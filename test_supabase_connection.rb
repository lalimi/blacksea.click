#!/usr/bin/env ruby

require 'pg'
require 'dotenv'

# Загружаем переменные окружения
Dotenv.load('.env')

puts "🔄 Тестируем подключение к Supabase..."
puts "Host: #{ENV['SUPABASE_DB_HOST']}"
puts "Port: #{ENV['SUPABASE_DB_PORT']}"
puts "Database: #{ENV['SUPABASE_DB_NAME']}"
puts "Username: #{ENV['SUPABASE_DB_USERNAME']}"

begin
  # Подключаемся к Supabase
  connection = PG.connect(
    host: ENV['SUPABASE_DB_HOST'],
    port: ENV['SUPABASE_DB_PORT'],
    dbname: ENV['SUPABASE_DB_NAME'],
    user: ENV['SUPABASE_DB_USERNAME'],
    password: ENV['SUPABASE_DB_PASSWORD'],
    sslmode: 'require'
  )
  
  puts "✅ Подключение к Supabase успешно!"
  
  # Проверяем базовую информацию
  result = connection.exec("SELECT version()")
  puts "📋 Версия PostgreSQL: #{result[0]['version']}"
  
  # Проверяем существующие таблицы
  tables_result = connection.exec("SELECT tablename FROM pg_tables WHERE schemaname = 'public'")
  puts "📊 Существующих таблиц в Supabase: #{tables_result.ntuples}"
  
  if tables_result.ntuples > 0
    puts "⚠️  Обнаружены существующие таблицы:"
    tables_result.each do |row|
      puts "  - #{row['tablename']}"
    end
  else
    puts "✨ База данных пустая - готова для миграции"
  end
  
  connection.close
  
rescue PG::Error => e
  puts "❌ Ошибка подключения к Supabase:"
  puts "   #{e.message}"
  puts "\n🔍 Проверьте:"
  puts "   - Правильность пароля в .env"
  puts "   - Доступность базы данных в Supabase Dashboard"
  puts "   - Сетевые настройки"
  exit 1
rescue => e
  puts "❌ Неожиданная ошибка: #{e.message}"
  exit 1
end

puts "\n🎉 Тест подключения завершен успешно!"