#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'uri'

puts "🚀 ПОЛНАЯ МИГРАЦИЯ ВСЕХ ТАБЛИЦ В SUPABASE"
puts "=" * 60

# Конфигурация Supabase
SUPABASE_URL = 'https://qewjnagvsbnwgamrrrwg.supabase.co'
SERVICE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFld2puYWd2c2Jud2dhbXJycndnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1NTY5NjExNSwiZXhwIjoyMDcxMjcyMTE1fQ.yHfkPEm8qRVgcQHm13S84eeEMXYwjMCOhBLiOWaHnlI'

puts "📁 Читаем схему из файла local_schema.sql..."
unless File.exist?('local_schema.sql')
  puts "❌ Файл local_schema.sql не найден!"
  exit 1
end

schema_content = File.read('local_schema.sql')

# Извлекаем все CREATE TABLE команды
table_creates = schema_content.scan(/CREATE TABLE[^;]+;/m)
puts "📊 Найдено CREATE TABLE команд: #{table_creates.length}"

# Извлекаем все CREATE INDEX команды  
index_creates = schema_content.scan(/CREATE[^;]*INDEX[^;]+;/m)
puts "📊 Найдено CREATE INDEX команд: #{index_creates.length}"

# Извлекаем все ALTER TABLE команды
alter_commands = schema_content.scan(/ALTER TABLE[^;]+;/m)
puts "📊 Найдено ALTER TABLE команд: #{alter_commands.length}"

# Извлекаем все CREATE SEQUENCE команды
sequence_creates = schema_content.scan(/CREATE SEQUENCE[^;]+;/m)
puts "📊 Найдено CREATE SEQUENCE команд: #{sequence_creates.length}"

# Создаем SQL файл для импорта в Supabase Dashboard
output_file = 'supabase_migration.sql'
File.open(output_file, 'w') do |f|
  f.puts "-- ПОЛНАЯ МИГРАЦИЯ GUMROAD В SUPABASE"
  f.puts "-- Создан автоматически: #{Time.now}"
  f.puts "-- Количество таблиц: #{table_creates.length}"
  f.puts ""
  
  f.puts "-- =================================="
  f.puts "-- 1. СОЗДАНИЕ SEQUENCES"
  f.puts "-- =================================="
  sequence_creates.each_with_index do |seq, index|
    f.puts "-- Sequence #{index + 1}/#{sequence_creates.length}"
    f.puts seq
    f.puts ""
  end
  
  f.puts "-- =================================="
  f.puts "-- 2. СОЗДАНИЕ ТАБЛИЦ"  
  f.puts "-- =================================="
  table_creates.each_with_index do |table, index|
    # Извлекаем имя таблицы
    table_name = table.match(/CREATE TABLE\s+(?:public\.)?(\w+)/i)&.captures&.first
    
    f.puts "-- Таблица #{index + 1}/#{table_creates.length}: #{table_name}"
    f.puts table
    f.puts ""
  end
  
  f.puts "-- =================================="
  f.puts "-- 3. СОЗДАНИЕ ИНДЕКСОВ"
  f.puts "-- =================================="
  index_creates.each_with_index do |index_cmd, index|
    f.puts "-- Индекс #{index + 1}/#{index_creates.length}"
    f.puts index_cmd
    f.puts ""
  end
  
  f.puts "-- =================================="
  f.puts "-- 4. ALTER TABLE КОМАНДЫ"
  f.puts "-- =================================="
  alter_commands.each_with_index do |alter, index|
    f.puts "-- Alter #{index + 1}/#{alter_commands.length}"
    f.puts alter
    f.puts ""
  end
  
  f.puts "-- =================================="
  f.puts "-- МИГРАЦИЯ ЗАВЕРШЕНА"
  f.puts "-- =================================="
end

puts "✅ SQL скрипт создан: #{output_file}"
puts "📏 Размер файла: #{File.size(output_file) / 1024}KB"

# Создаем скрипт для импорта данных
puts "\n📊 Создаем скрипт импорта данных..."
data_content = File.read('local_data.sql')

# Извлекаем все INSERT команды
insert_commands = data_content.scan(/INSERT INTO[^;]+;/m)
puts "📊 Найдено INSERT команд: #{insert_commands.length}"

# Создаем файл с данными
data_output = 'supabase_data.sql'
File.open(data_output, 'w') do |f|
  f.puts "-- ИМПОРТ ДАННЫХ GUMROAD В SUPABASE"
  f.puts "-- Создан автоматически: #{Time.now}"
  f.puts "-- Количество INSERT команд: #{insert_commands.length}"
  f.puts ""
  
  f.puts "-- Отключаем проверки целостности для ускорения импорта"
  f.puts "SET session_replication_role = replica;"
  f.puts ""
  
  insert_commands.each_with_index do |insert, index|
    # Извлекаем имя таблицы из INSERT
    table_name = insert.match(/INSERT INTO\s+(?:public\.)?(\w+)/i)&.captures&.first
    
    f.puts "-- Данные для таблицы: #{table_name} (#{index + 1}/#{insert_commands.length})"
    f.puts insert
    f.puts ""
  end
  
  f.puts "-- Включаем проверки целостности обратно"
  f.puts "SET session_replication_role = DEFAULT;"
  f.puts ""
  f.puts "-- ИМПОРТ ДАННЫХ ЗАВЕРШЕН"
end

puts "✅ Скрипт данных создан: #{data_output}"
puts "📏 Размер файла: #{File.size(data_output) / 1024}KB"

puts "\n" + "=" * 60
puts "🎯 ИНСТРУКЦИИ ПО ИМПОРТУ:"
puts "=" * 60

puts "\n1️⃣  Откройте Supabase Dashboard:"
puts "   https://supabase.com/dashboard/project/qewjnagvsbnwgamrrrwg"

puts "\n2️⃣  Перейдите в SQL Editor:"
puts "   Dashboard → SQL Editor → New query"

puts "\n3️⃣  Выполните миграцию схемы:"
puts "   • Откройте файл: #{output_file}"
puts "   • Скопируйте весь содержимое"
puts "   • Вставьте в SQL Editor"
puts "   • Нажмите RUN"

puts "\n4️⃣  Выполните импорт данных:"
puts "   • Откройте файл: #{data_output}"
puts "   • Скопируйте весь содержимое"
puts "   • Вставьте в SQL Editor"
puts "   • Нажмите RUN"

puts "\n5️⃣  Проверьте результат:"
puts "   ruby verify_migration.rb"

puts "\n⚡ ВАЖНО:"
puts "   • Выполняйте команды поочередно"
puts "   • При ошибках - смотрите логи в Dashboard"
puts "   • Большие запросы можно разбить на части"

puts "\n🎉 Все готово для полной миграции #{table_creates.length} таблиц!"

# Создаем скрипт верификации
File.open('verify_migration.rb', 'w') do |f|
  f.puts <<~RUBY
    require 'net/http'
    require 'json'
    
    SUPABASE_URL = '#{SUPABASE_URL}'
    SERVICE_KEY = '#{SERVICE_KEY}'
    
    def check_table(table_name)
      uri = URI("\#{SUPABASE_URL}/rest/v1/\#{table_name}?limit=1")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      
      request = Net::HTTP::Get.new(uri)
      request['apikey'] = SERVICE_KEY
      request['Authorization'] = "Bearer \#{SERVICE_KEY}"
      
      response = http.request(request)
      
      case response.code
      when '200'
        data = JSON.parse(response.body)
        puts "✅ \#{table_name}: OK (\#{data.length} записей показано)"
        true
      when '400', '404'
        puts "❌ \#{table_name}: НЕ СУЩЕСТВУЕТ"
        false
      else
        puts "⚠️  \#{table_name}: код \#{response.code}"
        false
      end
    rescue => e
      puts "❌ \#{table_name}: ОШИБКА - \#{e.message}"
      false
    end
    
    puts "🔍 Проверка всех таблиц в Supabase..."
    
    tables = #{table_creates.map { |t| t.match(/CREATE TABLE\s+(?:public\.)?(\w+)/i)&.captures&.first }.compact.inspect}
    
    success_count = 0
    tables.each do |table|
      success_count += 1 if check_table(table)
    end
    
    puts "\\n📊 РЕЗУЛЬТАТ:"
    puts "   Проверено: \#{tables.length} таблиц"
    puts "   Успешно: \#{success_count}"
    puts "   Ошибок: \#{tables.length - success_count}"
    
    if success_count == tables.length
      puts "\\n🎉 ВСЕ ТАБЛИЦЫ МИГРИРОВАНЫ УСПЕШНО!"
    else
      puts "\\n⚠️  Некоторые таблицы требуют внимания"
    end
  RUBY
end

puts "\n📋 Создан скрипт проверки: verify_migration.rb"