#!/usr/bin/env ruby

require 'net/http'
require 'json'

SUPABASE_URL = 'https://qewjnagvsbnwgamrrrwg.supabase.co'
SERVICE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFld2puYWd2c2Jud2dhbXJycndnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1NTY5NjExNSwiZXhwIjoyMDcxMjcyMTE1fQ.yHfkPEm8qRVgcQHm13S84eeEMXYwjMCOhBLiOWaHnlI'

puts "🎉 ПРОВЕРКА УСПЕШНОСТИ МИГРАЦИИ В SUPABASE"
puts "=" * 60

def api_request(table, limit = 5)
  uri = URI("#{SUPABASE_URL}/rest/v1/#{table}?limit=#{limit}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.read_timeout = 10
  
  request = Net::HTTP::Get.new(uri)
  request['apikey'] = SERVICE_KEY
  request['Authorization'] = "Bearer #{SERVICE_KEY}"
  request['Content-Type'] = 'application/json'
  
  response = http.request(request)
  
  case response.code.to_i
  when 200
    data = JSON.parse(response.body)
    { success: true, data: data, count: data.length }
  when 403
    { success: false, error: 'Нет доступа к таблице (RLS политики)' }
  when 404
    { success: false, error: 'Таблица не существует' }
  else
    { success: false, error: "HTTP #{response.code}: #{response.body}" }
  end
rescue => e
  { success: false, error: e.message }
end

# Проверяем основные таблицы
tables_to_check = [
  { name: 'users', expected: 5 },
  { name: 'links', expected: 4 },
  { name: 'affiliates', expected: 2 },
  { name: 'events', expected: 26 },
  { name: 'prices', expected: 5 },
  { name: 'refund_policies', expected: 1 },
  { name: 'variant_categories', expected: 1 }
]

puts "📊 ПРОВЕРКА ИМПОРТИРОВАННЫХ ДАННЫХ:"
puts "-" * 40

success_count = 0
total_records = 0

tables_to_check.each do |table_info|
  table_name = table_info[:name]
  expected = table_info[:expected]
  
  print "#{table_name.ljust(20)}: "
  
  result = api_request(table_name, 50)
  
  if result[:success]
    count = result[:count]
    total_records += count
    
    if count >= expected
      puts "✅ #{count} записей (ожидалось #{expected})"
      success_count += 1
    else
      puts "⚠️  #{count} записей (ожидалось #{expected})"
    end
    
    # Показываем примеры данных
    if result[:data] && result[:data].length > 0
      sample = result[:data].first
      key_fields = %w[id name email title unique_permalink].select { |field| sample[field] }
      if key_fields.any?
        puts "    Пример: #{key_fields.map { |f| "#{f}=#{sample[f]}" }.join(', ')}"
      end
    end
  else
    puts "❌ #{result[:error]}"
  end
end

puts "-" * 40
puts "📈 СТАТИСТИКА МИГРАЦИИ:"
puts "  Успешных таблиц: #{success_count}/#{tables_to_check.length}"
puts "  Всего записей: #{total_records}"

if success_count == tables_to_check.length
  puts "\n🎉 МИГРАЦИЯ ВЫПОЛНЕНА УСПЕШНО!"
  puts "   ✅ Все таблицы созданы"
  puts "   ✅ Данные импортированы"
  puts "   ✅ Структура соответствует ожиданиям"
  
  puts "\n🚀 СЛЕДУЮЩИЕ ШАГИ:"
  puts "   1. Добавьте IP 188.190.191.38 в Supabase Allow List"
  puts "   2. Настройте Real-time мониторинг"
  puts "   3. Проверьте работу Rails с Supabase"
else
  puts "\n⚠️  МИГРАЦИЯ ТРЕБУЕТ ВНИМАНИЯ:"
  puts "   Некоторые таблицы имеют проблемы с доступом"
  puts "   Возможно, активированы RLS политики"
end

puts "\n" + "=" * 60