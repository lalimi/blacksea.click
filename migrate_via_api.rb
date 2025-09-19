#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'uri'

# Конфигурация Supabase
SUPABASE_URL = 'https://qewjnagvsbnwgamrrrwg.supabase.co'
SERVICE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFld2puYWd2c2Jud2dhbXJycndnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1NTY5NjExNSwiZXhwIjoyMDcxMjcyMTE1fQ.yHfkPEm8qRVgcQHm13S84eeEMXYwjMCOhBLiOWaHnlI'

def make_supabase_request(method, path, data = nil)
  uri = URI("#{SUPABASE_URL}#{path}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  
  case method.upcase
  when 'GET'
    request = Net::HTTP::Get.new(uri)
  when 'POST'
    request = Net::HTTP::Post.new(uri)
    request.body = data.to_json if data
  end
  
  request['apikey'] = SERVICE_KEY
  request['Authorization'] = "Bearer #{SERVICE_KEY}"
  request['Content-Type'] = 'application/json'
  request['Prefer'] = 'return=representation'
  
  response = http.request(request)
  
  {
    code: response.code.to_i,
    body: response.body,
    parsed: (JSON.parse(response.body) rescue response.body)
  }
end

puts "🔄 Миграция через Supabase REST API..."

# Проверяем доступность API
puts "1. Проверка API..."
response = make_supabase_request('GET', '/rest/v1/')
if response[:code] == 200
  puts "✅ API доступен"
else
  puts "❌ API недоступен: #{response[:code]}"
  exit 1
end

# Проверяем существующие таблицы
puts "\n2. Проверка существующих таблиц..."
response = make_supabase_request('GET', '/rest/v1/information_schema.tables?table_schema=eq.public&select=table_name')

if response[:code] == 200
  existing_tables = response[:parsed].map { |t| t['table_name'] }
  puts "📊 Найдено таблиц: #{existing_tables.length}"
  
  if existing_tables.length > 0
    puts "📋 Существующие таблицы:"
    existing_tables.first(10).each { |table| puts "  - #{table}" }
    puts "  ... и еще #{existing_tables.length - 10}" if existing_tables.length > 10
  end
else
  puts "⚠️  Не удалось получить список таблиц: #{response[:code]}"
end

# Пытаемся создать простую тестовую таблицу через SQL
puts "\n3. Тест создания таблицы через SQL..."

# Supabase позволяет выполнять SQL через RPC функции
sql_command = "CREATE TABLE IF NOT EXISTS test_migration (id SERIAL PRIMARY KEY, name TEXT, created_at TIMESTAMP DEFAULT NOW());"

response = make_supabase_request('POST', '/rest/v1/rpc/exec_sql', { query: sql_command })

puts "SQL Response: #{response[:code]} - #{response[:body]}"

puts "\n4. Проверяем создание таблицы users..."
users_sql = "CREATE TABLE IF NOT EXISTS users (
  id BIGSERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);"

response = make_supabase_request('POST', '/rest/v1/rpc/exec_sql', { query: users_sql })
puts "Users table: #{response[:code]} - #{response[:parsed]}"

puts "\n✅ API миграция завершена!"