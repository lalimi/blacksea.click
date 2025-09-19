#!/usr/bin/env ruby

require_relative 'config/environment'

puts "🔧 ДОБАВЛЕНИЕ ВСЕХ НЕДОСТАЮЩИХ КОЛОНОК"
puts "=" * 60

# Получаем все модели с данными
models_with_data = []

Dir.glob("app/models/*.rb").each do |file|
  model_name = File.basename(file, '.rb').camelize
  
  begin
    model_class = model_name.constantize
    if model_class.is_a?(Class) && model_class < ActiveRecord::Base
      count = model_class.count rescue 0
      if count > 0
        models_with_data << {
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

puts "📊 Найдено моделей с данными: #{models_with_data.length}"

# Создаем SQL файл для добавления всех колонок
output_file = 'add_all_missing_columns.sql'
connection = ActiveRecord::Base.connection

File.open(output_file, 'w') do |f|
  f.puts "-- ДОБАВЛЕНИЕ ВСЕХ НЕДОСТАЮЩИХ КОЛОНОК ВО ВСЕ ТАБЛИЦЫ"
  f.puts "-- Создан: #{Time.now}"
  f.puts ""
  f.puts "SET client_min_messages TO WARNING;"
  f.puts ""
  
  models_with_data.each do |model_info|
    model_class = model_info[:model]
    table_name = model_info[:table_name]
    model_name = model_info[:name]
    
    puts "📋 Обрабатываем #{model_name} (таблица: #{table_name})"
    
    f.puts "-- ========================================"
    f.puts "-- ТАБЛИЦА: #{table_name.upcase} (модель: #{model_name})"
    f.puts "-- ========================================"
    f.puts ""
    
    begin
      columns = connection.columns(table_name)
      
      columns.each do |column_info|
        column_name = column_info.name
        
        # Пропускаем ID - он должен уже существовать
        next if column_name == 'id'
        
        # Определяем тип PostgreSQL
        pg_type = case column_info.type
        when :bigint
          'BIGINT'
        when :integer
          if column_name.include?('_id') || column_name == 'flags'
            'BIGINT'  # Все ID и flags делаем BIGINT
          else
            'INTEGER'
          end
        when :string
          limit = column_info.limit || 255
          "VARCHAR(#{limit})"
        when :text
          'TEXT'
        when :datetime
          'TIMESTAMP'
        when :date
          'DATE'
        when :boolean
          'BOOLEAN'
        when :decimal
          precision = column_info.precision || 10
          scale = column_info.scale || 2
          "DECIMAL(#{precision}, #{scale})"
        when :float
          'DOUBLE PRECISION'
        when :json, :jsonb
          'JSONB'
        else
          'TEXT' # Fallback
        end
        
        # Определяем DEFAULT
        default_clause = ""
        if column_info.default
          case column_info.type
          when :string, :text
            default_clause = " DEFAULT '#{column_info.default}'"
          when :boolean
            default_clause = " DEFAULT #{column_info.default}"
          when :integer, :bigint
            default_clause = " DEFAULT #{column_info.default}"
          when :datetime
            if column_info.default.to_s.include?('now')
              default_clause = " DEFAULT NOW()"
            end
          end
        end
        
        # NULL/NOT NULL
        null_clause = column_info.null ? "" : " NOT NULL"
        
        f.puts "-- Колонка: #{column_name} (#{column_info.type})"
        f.puts "DO $$ BEGIN"
        f.puts "    IF NOT EXISTS (SELECT 1 FROM information_schema.columns "
        f.puts "                   WHERE table_name = '#{table_name}' AND column_name = '#{column_name}' "
        f.puts "                   AND table_schema = 'public') THEN"
        f.puts "        ALTER TABLE #{table_name} ADD COLUMN #{column_name} #{pg_type}#{default_clause}#{null_clause};"
        f.puts "        RAISE NOTICE 'Добавлена колонка #{table_name}.#{column_name} (#{pg_type})';"
        f.puts "    END IF;"
        f.puts "EXCEPTION WHEN others THEN"
        f.puts "    RAISE NOTICE 'Ошибка добавления #{table_name}.#{column_name}: %', SQLERRM;"
        f.puts "END $$;"
        f.puts ""
      end
      
      f.puts ""
      
    rescue => e
      puts "⚠️  Ошибка обработки #{table_name}: #{e.message}"
      f.puts "-- ОШИБКА ОБРАБОТКИ #{table_name}: #{e.message}"
      f.puts ""
    end
  end
  
  f.puts "-- ========================================"
  f.puts "-- ПРОВЕРКА РЕЗУЛЬТАТОВ"
  f.puts "-- ========================================"
  
  models_with_data.each do |model_info|
    table_name = model_info[:table_name]
    f.puts "SELECT '#{table_name}' as table_name, count(*) as columns_count "
    f.puts "FROM information_schema.columns "
    f.puts "WHERE table_name = '#{table_name}' AND table_schema = 'public';"
  end
  
  f.puts ""
  f.puts "-- ДОБАВЛЕНИЕ ВСЕХ КОЛОНОК ЗАВЕРШЕНО"
end

puts "✅ Скрипт создан: #{output_file}"
puts "📏 Размер: #{File.size(output_file) / 1024}KB"

puts "\n📊 Обработано моделей: #{models_with_data.length}"
models_with_data.each do |m|
  puts "  #{m[:name]} (#{m[:table_name]}) - #{m[:count]} записей"
end

puts "\n🎯 ИНСТРУКЦИИ:"
puts "1. Выполните #{output_file} в Supabase SQL Editor"
puts "2. Затем повторно запустите импорт данных"
puts "3. Все колонки будут созданы с правильными типами"