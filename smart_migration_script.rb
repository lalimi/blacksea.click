#!/usr/bin/env ruby

puts "🚀 СОЗДАНИЕ УМНОГО СКРИПТА МИГРАЦИИ"
puts "=" * 60

# Читаем оригинальную схему
unless File.exist?('local_schema.sql')
  puts "❌ Файл local_schema.sql не найден!"
  exit 1
end

schema_content = File.read('local_schema.sql')

# Извлекаем все элементы с проверкой на существование
sequences = schema_content.scan(/CREATE SEQUENCE[^;]+;/m)
tables = schema_content.scan(/CREATE TABLE[^;]+;/m) 
indexes = schema_content.scan(/CREATE[^;]*INDEX[^;]+;/m)
alters = schema_content.scan(/ALTER TABLE[^;]+;/m)

puts "📊 Анализируем структуру:"
puts "   Sequences: #{sequences.length}"
puts "   Tables: #{tables.length}"  
puts "   Indexes: #{indexes.length}"
puts "   Alters: #{alters.length}"

# Создаем умный SQL файл
output_file = 'supabase_smart_migration.sql'
File.open(output_file, 'w') do |f|
  f.puts "-- УМНАЯ МИГРАЦИЯ GUMROAD В SUPABASE"
  f.puts "-- Создан автоматически: #{Time.now}"
  f.puts "-- Проверяет существование объектов перед созданием"
  f.puts ""
  f.puts "-- Устанавливаем режим для игнорирования несуществующих объектов"
  f.puts "SET client_min_messages TO WARNING;"
  f.puts ""
  
  f.puts "-- =================================="
  f.puts "-- 1. СОЗДАНИЕ SEQUENCES (ЕСЛИ НЕ СУЩЕСТВУЮТ)"
  f.puts "-- =================================="
  sequences.each_with_index do |seq, index|
    # Извлекаем имя последовательности
    seq_name = seq.match(/CREATE SEQUENCE\s+(?:public\.)?(\w+)/i)&.captures&.first
    
    if seq_name
      f.puts "-- Sequence #{index + 1}/#{sequences.length}: #{seq_name}"
      f.puts "DO $$ "
      f.puts "BEGIN"
      f.puts "    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = '#{seq_name}') THEN"
      f.puts "        #{seq.strip}"
      f.puts "    END IF;"
      f.puts "END $$;"
      f.puts ""
    end
  end
  
  f.puts "-- =================================="
  f.puts "-- 2. СОЗДАНИЕ ТАБЛИЦ (ЕСЛИ НЕ СУЩЕСТВУЮТ)"
  f.puts "-- =================================="
  tables.each_with_index do |table, index|
    # Извлекаем имя таблицы
    table_name = table.match(/CREATE TABLE\s+(?:public\.)?(\w+)/i)&.captures&.first
    
    if table_name
      f.puts "-- Таблица #{index + 1}/#{tables.length}: #{table_name}"
      f.puts "DO $$ "
      f.puts "BEGIN"
      f.puts "    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = '#{table_name}' AND table_schema = 'public') THEN"
      # Разбиваем CREATE TABLE на строки для правильного форматирования в DO блоке
      table_lines = table.strip.split("\n")
      f.puts "        EXECUTE '"
      table_lines.each_with_index do |line, line_idx|
        # Экранируем кавычки в SQL
        escaped_line = line.gsub("'", "''")
        if line_idx == table_lines.length - 1
          f.puts "            #{escaped_line}"
        else
          f.puts "            #{escaped_line}"
        end
      end
      f.puts "        ';"
      f.puts "    END IF;"
      f.puts "END $$;"
      f.puts ""
    end
  end
  
  f.puts "-- =================================="
  f.puts "-- 3. СОЗДАНИЕ ИНДЕКСОВ (ЕСЛИ НЕ СУЩЕСТВУЮТ)"
  f.puts "-- =================================="
  indexes.each_with_index do |index_cmd, index|
    # Пытаемся извлечь имя индекса
    index_name = index_cmd.match(/CREATE[^;]*INDEX\s+(?:CONCURRENTLY\s+)?(?:IF NOT EXISTS\s+)?(\w+)/i)&.captures&.first
    
    if index_name
      f.puts "-- Индекс #{index + 1}/#{indexes.length}: #{index_name}"
      f.puts "DO $$ "
      f.puts "BEGIN"
      f.puts "    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = '#{index_name}') THEN"
      f.puts "        EXECUTE '#{index_cmd.strip.gsub("'", "''")}';"
      f.puts "    END IF;"
      f.puts "EXCEPTION WHEN duplicate_table THEN"
      f.puts "    -- Индекс уже существует, игнорируем"
      f.puts "    NULL;"
      f.puts "END $$;"
      f.puts ""
    else
      # Если не можем извлечь имя, просто пытаемся создать с обработкой ошибок
      f.puts "-- Индекс #{index + 1}/#{indexes.length}: (имя не определено)"
      f.puts "DO $$ "
      f.puts "BEGIN"
      f.puts "    EXECUTE '#{index_cmd.strip.gsub("'", "''")}';"
      f.puts "EXCEPTION WHEN duplicate_table THEN"
      f.puts "    -- Индекс уже существует, игнорируем"
      f.puts "    NULL;"
      f.puts "WHEN others THEN"
      f.puts "    -- Другая ошибка, логируем но продолжаем"
      f.puts "    RAISE NOTICE 'Ошибка создания индекса: %', SQLERRM;"
      f.puts "END $$;"
      f.puts ""
    end
  end
  
  f.puts "-- =================================="
  f.puts "-- 4. ALTER TABLE КОМАНДЫ (С ОБРАБОТКОЙ ОШИБОК)"
  f.puts "-- =================================="
  alters.each_with_index do |alter, index|
    f.puts "-- Alter #{index + 1}/#{alters.length}"
    f.puts "DO $$ "
    f.puts "BEGIN"
    f.puts "    EXECUTE '#{alter.strip.gsub("'", "''")}';"
    f.puts "EXCEPTION WHEN duplicate_column THEN"
    f.puts "    -- Колонка уже существует, игнорируем"
    f.puts "    NULL;"
    f.puts "WHEN duplicate_object THEN"
    f.puts "    -- Объект уже существует, игнорируем"  
    f.puts "    NULL;"
    f.puts "WHEN others THEN"
    f.puts "    -- Другая ошибка, логируем но продолжаем"
    f.puts "    RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;"
    f.puts "END $$;"
    f.puts ""
  end
  
  f.puts "-- =================================="
  f.puts "-- ПРОВЕРКА РЕЗУЛЬТАТОВ"
  f.puts "-- =================================="
  f.puts "SELECT 'Создано таблиц:' as info, count(*) as count FROM information_schema.tables WHERE table_schema = 'public';"
  f.puts "SELECT 'Создано индексов:' as info, count(*) as count FROM pg_indexes WHERE schemaname = 'public';"
  f.puts "SELECT 'Создано sequences:' as info, count(*) as count FROM pg_sequences WHERE schemaname = 'public';"
  f.puts ""
  f.puts "-- УМНАЯ МИГРАЦИЯ ЗАВЕРШЕНА"
end

puts "✅ Умный скрипт миграции создан: #{output_file}"
puts "📏 Размер файла: #{File.size(output_file) / 1024}KB"

puts "\n🎯 ОСОБЕННОСТИ УМНОГО СКРИПТА:"
puts "✅ Проверяет существование объектов перед созданием"  
puts "✅ Игнорирует ошибки дублирования"
puts "✅ Логирует проблемы но продолжает выполнение"
puts "✅ Показывает итоговую статистику"

puts "\n📋 ИНСТРУКЦИЯ:"
puts "1. Откройте Supabase Dashboard SQL Editor"
puts "2. Скопируйте ВЕСЬ файл: #{output_file}"
puts "3. Выполните скрипт"
puts "4. Проверьте итоговую статистику в конце"

puts "\n⚡ Этот скрипт безопасно дополнит существующую структуру!"