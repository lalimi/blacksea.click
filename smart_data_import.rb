#!/usr/bin/env ruby

require_relative 'config/environment'

puts "🔄 УМНЫЙ ИМПОРТ ДАННЫХ С ПРОВЕРКОЙ КОЛОНОК"
puts "=" * 60

# Подключимся к локальной БД для получения данных
local_connection = ActiveRecord::Base.connection

# Получим список таблиц с данными
tables_with_data = []

Dir.glob("app/models/*.rb").each do |file|
  model_name = File.basename(file, '.rb').camelize
  
  begin
    model_class = model_name.constantize
    if model_class.is_a?(Class) && model_class < ActiveRecord::Base
      count = model_class.count rescue 0
      if count > 0
        tables_with_data << {
          model: model_class,
          name: model_name,
          count: count,
          table_name: model_class.table_name
        }
      end
    end
  rescue => e
    # Игнорируем модели которые не загружаются
  end
end

puts "📊 Найдено таблиц с данными: #{tables_with_data.length}"

# Создаем SQL файл с проверкой колонок
output_file = 'supabase_smart_data.sql'

File.open(output_file, 'w') do |f|
  f.puts "-- УМНЫЙ ИМПОРТ ДАННЫХ GUMROAD В SUPABASE"
  f.puts "-- Проверяет существование колонок перед вставкой"
  f.puts "-- Создан: #{Time.now}"
  f.puts ""
  f.puts "SET client_min_messages TO WARNING;"
  f.puts ""
  
  tables_with_data.sort_by { |t| t[:name] }.each do |table_info|
    model_class = table_info[:model]
    table_name = table_info[:table_name]
    count = table_info[:count]
    
    puts "📋 Обрабатываем #{table_info[:name]} (#{count} записей)..."
    
    f.puts "-- ========================================"
    f.puts "-- #{table_info[:name].upcase} (#{count} записей)"
    f.puts "-- ========================================"
    f.puts ""
    
    begin
      # Получаем все записи
      records = model_class.all.limit(100) # Ограничиваем для безопасности
      
      records.each_with_index do |record, index|
        attributes = record.attributes
        
        # Подготавливаем список колонок и значений
        columns = []
        values = []
        
        attributes.each do |column, value|
          # Пропускаем колонки которые часто отсутствуют в Supabase
          next if %w[active_test_path_assignments stripe_fee_cents].include?(column)
          
          columns << column
          
          # Форматируем значение
          case value
          when nil
            values << 'NULL'
          when String
            # Экранируем кавычки и переносы строк
            escaped_value = value.gsub("'", "''").gsub("\n", "\\n").gsub("\r", "\\r")
            values << "'#{escaped_value}'"
          when Time, DateTime
            values << "'#{value.strftime('%Y-%m-%d %H:%M:%S')}'"
          when Date
            values << "'#{value.strftime('%Y-%m-%d')}'"
          when TrueClass, FalseClass
            values << value.to_s
          when Numeric
            values << value.to_s
          when Hash, Array
            # JSON поля
            escaped_json = value.to_json.gsub("'", "''")
            values << "'#{escaped_json}'"
          else
            escaped_value = value.to_s.gsub("'", "''")
            values << "'#{escaped_value}'"
          end
        end
        
        # Создаем безопасную INSERT команду с проверкой колонок
        f.puts "-- Запись #{index + 1}/#{records.length} для #{table_name}"
        f.puts "DO $$ "
        f.puts "DECLARE"
        f.puts "    col_exists BOOLEAN;"
        f.puts "    missing_cols TEXT[] := ARRAY[]::TEXT[];"
        f.puts "    final_columns TEXT[] := ARRAY[]::TEXT[];"
        f.puts "    final_values TEXT[] := ARRAY[]::TEXT[];"
        f.puts "BEGIN"
        
        # Проверяем каждую колонку
        columns.each_with_index do |col, col_idx|
          f.puts "    -- Проверяем колонку #{col}"
          f.puts "    SELECT EXISTS ("
          f.puts "        SELECT 1 FROM information_schema.columns "
          f.puts "        WHERE table_name = '#{table_name}' "
          f.puts "        AND column_name = '#{col}' "
          f.puts "        AND table_schema = 'public'"
          f.puts "    ) INTO col_exists;"
          f.puts "    "
          f.puts "    IF col_exists THEN"
          f.puts "        final_columns := final_columns || '#{col}';"
          f.puts "        final_values := final_values || '#{values[col_idx]}';"
          f.puts "    ELSE"
          f.puts "        missing_cols := missing_cols || '#{col}';"
          f.puts "    END IF;"
          f.puts ""
        end
        
        f.puts "    -- Логируем отсутствующие колонки"
        f.puts "    IF array_length(missing_cols, 1) > 0 THEN"
        f.puts "        RAISE NOTICE 'Таблица #{table_name}: пропущены колонки: %', array_to_string(missing_cols, ', ');"
        f.puts "    END IF;"
        f.puts ""
        f.puts "    -- Выполняем INSERT только с существующими колонками"
        f.puts "    IF array_length(final_columns, 1) > 0 THEN"
        f.puts "        EXECUTE 'INSERT INTO #{table_name} (' || "
        f.puts "                array_to_string(final_columns, ', ') || "
        f.puts "                ') VALUES (' || "
        f.puts "                array_to_string(final_values, ', ') || "
        f.puts "                ') ON CONFLICT DO NOTHING';"
        f.puts "    END IF;"
        f.puts ""
        f.puts "EXCEPTION WHEN others THEN"
        f.puts "    RAISE NOTICE 'Ошибка вставки в #{table_name}: %', SQLERRM;"
        f.puts "END $$;"
        f.puts ""
      end
      
    rescue => e
      puts "⚠️  Ошибка обработки #{table_info[:name]}: #{e.message}"
      f.puts "-- ОШИБКА ОБРАБОТКИ #{table_info[:name]}: #{e.message}"
      f.puts ""
    end
  end
  
  f.puts "-- ========================================"
  f.puts "-- ПРОВЕРКА ИМПОРТА"
  f.puts "-- ========================================"
  
  # Добавляем проверку импорта для основных таблиц
  %w[users links events affiliates].each do |table|
    f.puts "DO $$ "
    f.puts "DECLARE"
    f.puts "    cnt INTEGER;"
    f.puts "BEGIN"
    f.puts "    SELECT count(*) INTO cnt FROM #{table};"
    f.puts "    RAISE NOTICE 'Таблица #{table}: % записей', cnt;"
    f.puts "EXCEPTION WHEN undefined_table THEN"
    f.puts "    RAISE NOTICE 'Таблица #{table}: НЕ СУЩЕСТВУЕТ';"
    f.puts "END $$;"
    f.puts ""
  end
  
  f.puts "-- УМНЫЙ ИМПОРТ ЗАВЕРШЕН"
end

puts "✅ Умный импорт данных создан: #{output_file}"
puts "📏 Размер: #{File.size(output_file) / 1024}KB"

puts "\n🎯 ОСОБЕННОСТИ УМНОГО ИМПОРТА:"
puts "✅ Проверяет существование каждой колонки перед вставкой"
puts "✅ Пропускает проблемные колонки (active_test_path_assignments, stripe_fee_cents)"
puts "✅ Использует ON CONFLICT DO NOTHING для избежания дублей"
puts "✅ Логирует отсутствующие колонки"
puts "✅ Показывает итоговую статистику по таблицам"

puts "\n📋 ТЕПЕРЬ ВЫПОЛНИТЕ В SUPABASE:"
puts "   #{output_file}"