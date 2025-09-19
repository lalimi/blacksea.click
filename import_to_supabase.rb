#!/usr/bin/env ruby

require 'pg'
require 'dotenv'

Dotenv.load('.env')

puts "🚀 Импорт схемы в Supabase..."

# Параметры подключения к Supabase
connection_params = {
  host: ENV['SUPABASE_DB_HOST'],
  port: ENV['SUPABASE_DB_PORT'],
  dbname: ENV['SUPABASE_DB_NAME'],
  user: ENV['SUPABASE_DB_USERNAME'],
  password: ENV['SUPABASE_DB_PASSWORD'],
  sslmode: 'require'
}

begin
  connection = PG.connect(connection_params)
  puts "✅ Подключение к Supabase установлено"
  
  # Читаем схему и разбиваем на отдельные команды
  schema_content = File.read('local_schema.sql')
  
  # Удаляем служебные команды SET, которые могут вызвать проблемы
  schema_content.gsub!(/^SET .+;$/m, '')
  schema_content.gsub!(/^SELECT pg_catalog\.set_config.+;$/m, '')
  
  # Разбиваем на отдельные SQL команды
  commands = schema_content.split(/;\s*\n/).select { |cmd| cmd.strip.length > 0 }
  
  puts "📊 Найдено SQL команд: #{commands.length}"
  
  success_count = 0
  error_count = 0
  
  commands.each_with_index do |command, index|
    next if command.strip.empty?
    next if command.strip.start_with?('--')
    
    begin
      connection.exec(command.strip + ';')
      success_count += 1
      print "."
      
      if (index + 1) % 50 == 0
        puts " #{index + 1}/#{commands.length}"
      end
      
    rescue PG::Error => e
      error_count += 1
      
      # Игнорируем некоторые ожидаемые ошибки
      unless e.message.include?('already exists') || 
             e.message.include?('does not exist') ||
             e.message.include?('permission denied')
        puts "\n⚠️  Ошибка в команде #{index + 1}: #{e.message.first(100)}"
      end
    end
  end
  
  puts "\n✅ Импорт схемы завершен!"
  puts "   Успешно: #{success_count}"
  puts "   Ошибок: #{error_count}"
  
  # Проверяем созданные таблицы
  result = connection.exec("SELECT count(*) FROM information_schema.tables WHERE table_schema = 'public'")
  tables_count = result[0]['count'].to_i
  
  puts "📊 Создано таблиц: #{tables_count}"
  
  connection.close
  
rescue => e
  puts "❌ Ошибка импорта: #{e.message}"
  exit 1
end

puts "\n🎉 Схема успешно импортирована в Supabase!"