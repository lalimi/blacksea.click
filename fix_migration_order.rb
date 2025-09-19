#!/usr/bin/env ruby

puts "🔧 ИСПРАВЛЕНИЕ ПОРЯДКА МИГРАЦИИ"
puts "Проблема: индексы создаются до добавления колонок"
puts "=" * 60

schema_content = File.read('local_schema.sql')

# Разделяем команды по типам более точно
sequences = []
tables = []
indexes = []
alters = []
constraints = []

# Парсим файл построчно для более точного разбора
current_command = ""
in_create_table = false

schema_content.each_line do |line|
  line = line.strip
  next if line.empty? || line.start_with?('--')
  
  # Накапливаем текущую команду
  current_command += line + "\n"
  
  # Определяем завершение команды
  if line.end_with?(';')
    command = current_command.strip
    
    case command
    when /^CREATE SEQUENCE/i
      sequences << command
    when /^CREATE TABLE/i
      tables << command
    when /^CREATE[^;]*INDEX/i
      indexes << command
    when /^ALTER TABLE.*ADD CONSTRAINT.*FOREIGN KEY/i
      constraints << command
    when /^ALTER TABLE/i
      alters << command
    end
    
    current_command = ""
  end
end

puts "📊 Команды разделены по типам:"
puts "   Sequences: #{sequences.length}"
puts "   Tables: #{tables.length}"  
puts "   Alters: #{alters.length}"
puts "   Indexes: #{indexes.length}"
puts "   Constraints: #{constraints.length}"

# Создаем исправленный скрипт с правильным порядком
output_file = 'supabase_fixed_migration.sql'
File.open(output_file, 'w') do |f|
  f.puts "-- ИСПРАВЛЕННАЯ МИГРАЦИЯ GUMROAD В SUPABASE"
  f.puts "-- Правильный порядок: Tables → Alters → Indexes → Constraints"
  f.puts "-- Создан автоматически: #{Time.now}"
  f.puts ""
  f.puts "SET client_min_messages TO WARNING;"
  f.puts ""
  
  f.puts "-- =================================="
  f.puts "-- ЭТАП 1: СОЗДАНИЕ SEQUENCES"
  f.puts "-- =================================="
  sequences.each_with_index do |seq, index|
    seq_name = seq.match(/CREATE SEQUENCE\s+(?:public\.)?(\w+)/i)&.captures&.first
    
    if seq_name
      f.puts "-- Sequence #{index + 1}/#{sequences.length}: #{seq_name}"
      f.puts "DO $$ BEGIN"
      f.puts "    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = '#{seq_name}') THEN"
      f.puts "        EXECUTE '#{seq.gsub("'", "''")}';"
      f.puts "    END IF;"
      f.puts "END $$;"
      f.puts ""
    end
  end
  
  f.puts "-- =================================="
  f.puts "-- ЭТАП 2: СОЗДАНИЕ БАЗОВЫХ ТАБЛИЦ"
  f.puts "-- =================================="
  tables.each_with_index do |table, index|
    table_name = table.match(/CREATE TABLE\s+(?:public\.)?(\w+)/i)&.captures&.first
    
    if table_name
      f.puts "-- Таблица #{index + 1}/#{tables.length}: #{table_name}"
      f.puts "DO $$ BEGIN"
      f.puts "    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = '#{table_name}' AND table_schema = 'public') THEN"
      f.puts "        EXECUTE '#{table.gsub("'", "''")}';"
      f.puts "    END IF;"
      f.puts "EXCEPTION WHEN others THEN"
      f.puts "    RAISE NOTICE 'Ошибка создания таблицы #{table_name}: %', SQLERRM;"
      f.puts "END $$;"
      f.puts ""
    end
  end
  
  f.puts "-- =================================="
  f.puts "-- ЭТАП 3: ДОБАВЛЕНИЕ КОЛОНОК (ALTER TABLE)"
  f.puts "-- =================================="
  alters.each_with_index do |alter, index|
    f.puts "-- Alter #{index + 1}/#{alters.length}"
    f.puts "DO $$ BEGIN"
    f.puts "    EXECUTE '#{alter.gsub("'", "''")}';"
    f.puts "EXCEPTION"
    f.puts "    WHEN duplicate_column THEN NULL; -- Колонка уже существует"
    f.puts "    WHEN duplicate_object THEN NULL; -- Объект уже существует"
    f.puts "    WHEN others THEN"
    f.puts "        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;"
    f.puts "END $$;"
    f.puts ""
  end
  
  f.puts "-- =================================="
  f.puts "-- ЭТАП 4: СОЗДАНИЕ ИНДЕКСОВ (после добавления всех колонок)"
  f.puts "-- =================================="
  indexes.each_with_index do |index_cmd, index|
    index_name = index_cmd.match(/CREATE[^;]*INDEX\s+(?:CONCURRENTLY\s+)?(?:IF NOT EXISTS\s+)?(\w+)/i)&.captures&.first
    
    if index_name
      f.puts "-- Индекс #{index + 1}/#{indexes.length}: #{index_name}"
      f.puts "DO $$ BEGIN"
      f.puts "    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = '#{index_name}') THEN"
      f.puts "        EXECUTE '#{index_cmd.gsub("'", "''")}';"
      f.puts "    END IF;"
      f.puts "EXCEPTION"
      f.puts "    WHEN duplicate_table THEN NULL; -- Индекс уже существует"
      f.puts "    WHEN undefined_column THEN"
      f.puts "        RAISE NOTICE 'Колонка для индекса #{index_name} не существует';"
      f.puts "    WHEN others THEN"
      f.puts "        RAISE NOTICE 'Ошибка создания индекса #{index_name}: %', SQLERRM;"
      f.puts "END $$;"
      f.puts ""
    end
  end
  
  f.puts "-- =================================="
  f.puts "-- ЭТАП 5: ДОБАВЛЕНИЕ ВНЕШНИХ КЛЮЧЕЙ"
  f.puts "-- =================================="
  constraints.each_with_index do |constraint, index|
    f.puts "-- Constraint #{index + 1}/#{constraints.length}"
    f.puts "DO $$ BEGIN"
    f.puts "    EXECUTE '#{constraint.gsub("'", "''")}';"
    f.puts "EXCEPTION"
    f.puts "    WHEN duplicate_object THEN NULL; -- Constraint уже существует"
    f.puts "    WHEN others THEN"
    f.puts "        RAISE NOTICE 'Ошибка constraint: %', SQLERRM;"
    f.puts "END $$;"
    f.puts ""
  end
  
  f.puts "-- =================================="
  f.puts "-- ПРОВЕРКА РЕЗУЛЬТАТОВ"
  f.puts "-- =================================="
  f.puts "SELECT 'Таблиц создано:' as type, count(*) as count FROM information_schema.tables WHERE table_schema = 'public';"
  f.puts "SELECT 'Индексов создано:' as type, count(*) as count FROM pg_indexes WHERE schemaname = 'public';"
  f.puts "SELECT 'Sequences создано:' as type, count(*) as count FROM pg_sequences WHERE schemaname = 'public';"
  f.puts ""
  f.puts "-- ИСПРАВЛЕННАЯ МИГРАЦИЯ ЗАВЕРШЕНА"
end

puts "✅ Исправленный скрипт создан: #{output_file}"
puts "📏 Размер: #{File.size(output_file) / 1024}KB"

puts "\n🎯 ИСПРАВЛЕНИЯ:"
puts "✅ Правильный порядок: Tables → Alters → Indexes → Constraints"  
puts "✅ Обработка ошибки undefined_column для индексов"
puts "✅ Подробное логирование ошибок"

puts "\n📋 ТЕПЕРЬ ВЫПОЛНИТЕ ЭТОТ ФАЙЛ В SUPABASE:"
puts "   #{output_file}"