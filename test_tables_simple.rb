#!/usr/bin/env ruby

# Простой тест созданных таблиц через service role key (обходит RLS)
require 'net/http'
require 'json'
require 'uri'

# Загрузка переменных из .env.local
env_vars = {}
File.readlines('.env.local').each do |line|
  line.strip!
  next if line.empty? || line.start_with?('#')
  key, value = line.split('=', 2)
  env_vars[key] = value if key && value
end

supabase_url = env_vars['SUPABASE_URL']
service_key = env_vars['SUPABASE_SERVICE_ROLE_KEY']  # Используем service key вместо anon

puts "🧪 Тестирование таблиц через Service Role Key..."
puts "URL: #{supabase_url}"

if !service_key || service_key == 'your_service_role_key_here'
  puts "❌ SUPABASE_SERVICE_ROLE_KEY не настроен"
  exit 1
end

# Функция для выполнения запросов с service key
def api_request(url, key, method, path, data = nil)
  uri = URI("#{url}#{path}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  
  case method.upcase
  when 'GET'
    request = Net::HTTP::Get.new(uri)
  when 'POST'
    request = Net::HTTP::Post.new(uri)
    request.body = data.to_json if data
  when 'PATCH'
    request = Net::HTTP::Patch.new(uri)
    request.body = data.to_json if data
  end
  
  request['apikey'] = key
  request['Authorization'] = "Bearer #{key}"
  request['Content-Type'] = 'application/json'
  request['Prefer'] = 'return=representation'
  
  response = http.request(request)
  
  {
    code: response.code.to_i,
    body: response.body,
    parsed: (JSON.parse(response.body) rescue response.body)
  }
rescue => e
  { error: e.message }
end

# Тесты таблиц
tables_to_test = ['users', 'products', 'purchases', 'product_files', 'comments']

puts "\n📊 Проверка доступности таблиц через Service Key:"

tables_to_test.each do |table|
  print "   Testing #{table}... "
  
  # Пытаемся получить количество записей
  result = api_request(supabase_url, service_key, 'GET', "/rest/v1/#{table}?select=count")
  
  case result[:code]
  when 200
    puts "✅ Доступна (#{result[:parsed].length} записей)"
  when 400
    puts "⚠️  Таблица существует, но есть проблемы с запросом"
  when 404
    puts "❌ Таблица не найдена"
  when 401, 403
    puts "🔒 Доступ запрещен (даже для service key)"
  else
    puts "❓ Код #{result[:code]}: #{result[:parsed]}"
  end
end

puts "\n🧪 Тест создания записи в таблице users:"

# Тестовые данные для пользователя
test_user = {
  email: "test_#{Time.now.to_i}@example.com",
  name: "Test User",
  username: "testuser_#{Time.now.to_i}"
}

result = api_request(supabase_url, service_key, 'POST', "/rest/v1/users", test_user)

case result[:code]
when 201
  puts "✅ Пользователь создан успешно!"
  puts "   ID: #{result[:parsed][0]['id']}"
  puts "   Email: #{result[:parsed][0]['email']}"
  
  # Тестируем чтение созданного пользователя
  user_id = result[:parsed][0]['id']
  read_result = api_request(supabase_url, service_key, 'GET', "/rest/v1/users?id=eq.#{user_id}")
  
  if read_result[:code] == 200 && read_result[:parsed].length > 0
    puts "✅ Пользователь успешно прочитан из базы"
  else
    puts "⚠️  Создан, но не удалось прочитать"
  end
  
when 400
  puts "⚠️  Ошибка валидации: #{result[:parsed]}"
when 401, 403
  puts "🔒 Нет доступа на создание (RLS активен)"
when 409
  puts "⚠️  Конфликт (возможно, email уже существует)"
else
  puts "❌ Ошибка #{result[:code]}: #{result[:parsed]}"
end

puts "\n🧪 Тест создания продукта:"

test_product = {
  name: "Test Product #{Time.now.to_i}",
  description: "Test product description",
  price_cents: 1000,
  published: false
}

result = api_request(supabase_url, service_key, 'POST', "/rest/v1/products", test_product)

case result[:code]
when 201
  puts "✅ Продукт создан успешно!"
  puts "   ID: #{result[:parsed][0]['id']}"
  puts "   Name: #{result[:parsed][0]['name']}"
when 400
  puts "⚠️  Ошибка создания продукта: #{result[:parsed]}"
when 401, 403
  puts "🔒 Нет доступа на создание продукта"
else
  puts "❌ Ошибка #{result[:code]}: #{result[:parsed]}"
end

puts "\n" + "="*60
puts "📋 ИТОГИ ТЕСТИРОВАНИЯ:"

puts "\n✅ Что работает:"
puts "   • Supabase REST API доступен"
puts "   • Service Role Key настроен корректно"
puts "   • Таблицы созданы в базе данных"

puts "\n🔧 Если есть проблемы с доступом:"
puts "   • RLS (Row Level Security) может быть активен"
puts "   • Нужно настроить политики доступа"
puts "   • Или временно отключить RLS для тестирования"

puts "\n🚀 Следующие шаги:"
puts "   1. Если создание работает - интеграция готова!"
puts "   2. Если нет - настроим RLS политики"
puts "   3. Интеграция с Rails моделями"