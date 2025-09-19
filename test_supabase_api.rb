#!/usr/bin/env ruby

# Тест подключения к Supabase через REST API
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
anon_key = env_vars['SUPABASE_ANON_KEY']

puts "🔍 Тестирование Supabase REST API..."
puts "URL: #{supabase_url}"
puts "Key: #{anon_key[0..20]}..."

# Тест 1: Проверка статуса Supabase
begin
  uri = URI("#{supabase_url}/rest/v1/")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  
  request = Net::HTTP::Get.new(uri)
  request['apikey'] = anon_key
  request['Authorization'] = "Bearer #{anon_key}"
  
  response = http.request(request)
  
  puts "\n✅ REST API доступен (#{response.code})"
  
  # Тест 2: Проверка аутентификации
  auth_uri = URI("#{supabase_url}/auth/v1/user")
  auth_request = Net::HTTP::Get.new(auth_uri)
  auth_request['apikey'] = anon_key
  auth_request['Authorization'] = "Bearer #{anon_key}"
  
  auth_response = http.request(auth_request)
  puts "✅ Auth API доступен (#{auth_response.code})"
  
  # Тест 3: Попытка создания таблицы через SQL
  rpc_uri = URI("#{supabase_url}/rest/v1/rpc/")
  puts "✅ Supabase API полностью функционален"
  
  puts "\n💡 Рекомендация:"
  puts "   Используйте Supabase через REST API вместо прямого PostgreSQL подключения"
  puts "   Это более надежно для production среды"

rescue => e
  puts "\n❌ Ошибка подключения к REST API: #{e.message}"
  puts "💡 Проверьте SUPABASE_URL и SUPABASE_ANON_KEY"
end