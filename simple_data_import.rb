#!/usr/bin/env ruby

require_relative 'config/environment'

puts "🔄 ПРОСТОЙ ИМПОРТ ДАННЫХ БЕЗ СЛОЖНЫХ ПРОВЕРОК"
puts "=" * 60

# Получаем данные из локальной БД
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

# Создаем простой SQL файл
output_file = 'supabase_simple_data.sql'

File.open(output_file, 'w') do |f|
  f.puts "-- ПРОСТОЙ ИМПОРТ ДАННЫХ В SUPABASE"
  f.puts "-- Использует базовые INSERT с проверкой конфликтов"
  f.puts "-- Создан: #{Time.now}"
  f.puts ""
  f.puts "SET session_replication_role = replica;"
  f.puts "SET client_min_messages TO WARNING;"
  f.puts ""
  
  # Сначала импортируем базовые таблицы
  priority_tables = %w[users affiliates links]
  
  priority_tables.each do |priority_table|
    table_data = tables_with_data.find { |t| t[:table_name] == priority_table }
    next unless table_data
    
    model_class = table_data[:model]
    table_name = table_data[:table_name]
    count = table_data[:count]
    
    puts "📋 Приоритетная таблица: #{table_name} (#{count} записей)"
    
    f.puts "-- ========================================"
    f.puts "-- #{table_name.upcase} (#{count} записей) - ПРИОРИТЕТНАЯ"
    f.puts "-- ========================================"
    
    begin
      records = model_class.all.limit(50) # Ограничиваем количество
      
      records.each do |record|
        attributes = record.attributes
        
        # Фильтруем проблемные колонки
        filtered_attributes = attributes.reject do |key, value|
          %w[active_test_path_assignments stripe_fee_cents].include?(key)
        end
        
        columns = filtered_attributes.keys
        values = filtered_attributes.values.map do |value|
          case value
          when nil
            'NULL'
          when String
            # Простое экранирование
            escaped = value.gsub("'", "''").gsub("\\", "\\\\")
            "'#{escaped}'"
          when Time, DateTime
            "'#{value.strftime('%Y-%m-%d %H:%M:%S')}'"
          when Date
            "'#{value.strftime('%Y-%m-%d')}'"
          when TrueClass, FalseClass
            value.to_s
          when Numeric
            value.to_s
          when Hash, Array
            # Упрощенная обработка JSON
            "'{}'"
          else
            "'#{value.to_s.gsub("'", "''")}'"
          end
        end
        
        # Простая INSERT команда
        f.puts "INSERT INTO #{table_name} (#{columns.join(', ')}) "
        f.puts "VALUES (#{values.join(', ')}) "
        f.puts "ON CONFLICT DO NOTHING;"
      end
      
      f.puts ""
      
    rescue => e
      puts "⚠️  Ошибка #{table_name}: #{e.message}"
      f.puts "-- ОШИБКА #{table_name}: #{e.message}"
      f.puts ""
    end
  end
  
  # Затем остальные таблицы
  remaining_tables = tables_with_data.reject { |t| priority_tables.include?(t[:table_name]) }
  
  remaining_tables.each do |table_data|
    model_class = table_data[:model]
    table_name = table_data[:table_name]
    count = table_data[:count]
    
    puts "📋 Обычная таблица: #{table_name} (#{count} записей)"
    
    f.puts "-- ========================================"
    f.puts "-- #{table_name.upcase} (#{count} записей)"
    f.puts "-- ========================================"
    
    begin
      records = model_class.all.limit(20) # Меньший лимит для остальных
      
      records.each do |record|
        attributes = record.attributes
        
        # Фильтруем проблемные колонки
        filtered_attributes = attributes.reject do |key, value|
          %w[active_test_path_assignments stripe_fee_cents].include?(key)
        end
        
        columns = filtered_attributes.keys
        values = filtered_attributes.values.map do |value|
          case value
          when nil
            'NULL'
          when String
            escaped = value.gsub("'", "''").gsub("\\", "\\\\")
            "'#{escaped}'"
          when Time, DateTime
            "'#{value.strftime('%Y-%m-%d %H:%M:%S')}'"
          when Date
            "'#{value.strftime('%Y-%m-%d')}'"
          when TrueClass, FalseClass
            value.to_s
          when Numeric
            value.to_s
          when Hash, Array
            "'{}'"
          else
            "'#{value.to_s.gsub("'", "''")}'"
          end
        end
        
        f.puts "INSERT INTO #{table_name} (#{columns.join(', ')}) "
        f.puts "VALUES (#{values.join(', ')}) "
        f.puts "ON CONFLICT DO NOTHING;"
      end
      
      f.puts ""
      
    rescue => e
      puts "⚠️  Ошибка #{table_name}: #{e.message}"
      f.puts "-- ОШИБКА #{table_name}: #{e.message}"
      f.puts ""
    end
  end
  
  f.puts "SET session_replication_role = DEFAULT;"
  f.puts ""
  f.puts "-- Проверка результатов"
  f.puts "SELECT 'users' as table, count(*) as records FROM users;"
  f.puts "SELECT 'links' as table, count(*) as records FROM links;"
  f.puts "SELECT 'affiliates' as table, count(*) as records FROM affiliates;"
  f.puts ""
  f.puts "-- ПРОСТОЙ ИМПОРТ ЗАВЕРШЕН"
end

puts "✅ Простой импорт создан: #{output_file}"
puts "📏 Размер: #{File.size(output_file) / 1024}KB"

puts "\n🎯 ОСОБЕННОСТИ:"
puts "✅ Простые INSERT команды без сложной логики"
puts "✅ ON CONFLICT DO NOTHING для избежания ошибок"
puts "✅ Приоритет для важных таблиц (users, links, affiliates)"
puts "✅ Фильтрация проблемных колонок"
puts "✅ Лимиты на количество записей"

puts "\n📋 ВЫПОЛНИТЕ В SUPABASE:"
puts "   #{output_file}"