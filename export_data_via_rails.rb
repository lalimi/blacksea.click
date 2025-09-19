#!/usr/bin/env ruby

require_relative 'config/environment'

puts "🔄 Экспорт данных через Rails ActiveRecord..."

output_file = 'supabase_data_rails.sql'

File.open(output_file, 'w') do |f|
  f.puts "-- ЭКСПОРТ ДАННЫХ GUMROAD ЧЕРЕЗ RAILS"
  f.puts "-- Создан: #{Time.now}"
  f.puts ""
  f.puts "-- Отключаем проверки для ускорения импорта"
  f.puts "SET session_replication_role = replica;"
  f.puts ""

  # Получаем все модели Rails
  models_to_export = []
  
  # Ищем все файлы моделей
  Dir.glob("app/models/*.rb").each do |file|
    model_name = File.basename(file, '.rb').camelize
    
    begin
      model_class = model_name.constantize
      if model_class.is_a?(Class) && model_class < ActiveRecord::Base
        # Проверяем есть ли записи в таблице
        count = model_class.count rescue 0
        if count > 0
          models_to_export << { model: model_class, name: model_name, count: count }
        end
      end
    rescue => e
      # Игнорируем модели которые не загружаются
    end
  end

  puts "📊 Найдено моделей с данными: #{models_to_export.length}"
  
  models_to_export.sort_by { |m| m[:name] }.each do |model_info|
    model_class = model_info[:model]
    model_name = model_info[:name]
    count = model_info[:count]
    
    puts "📋 Экспорт #{model_name} (#{count} записей)..."
    
    f.puts "-- ==============================================="
    f.puts "-- #{model_name.upcase} (#{count} записей)"
    f.puts "-- ==============================================="
    
    begin
      # Получаем название таблицы
      table_name = model_class.table_name
      
      # Получаем все записи
      records = model_class.all
      
      records.each_with_index do |record, index|
        # Получаем атрибуты записи
        attributes = record.attributes
        
        # Подготавливаем колонки и значения
        columns = attributes.keys
        values = attributes.values.map do |value|
          case value
          when nil
            'NULL'
          when String
            "'#{value.gsub("'", "''")}'"  # Экранируем кавычки
          when Time, DateTime
            "'#{value.strftime('%Y-%m-%d %H:%M:%S')}'"
          when Date
            "'#{value.strftime('%Y-%m-%d')}'"
          when TrueClass, FalseClass
            value.to_s
          when Numeric
            value.to_s
          else
            "'#{value.to_s.gsub("'", "''")}'"
          end
        end
        
        f.puts "INSERT INTO #{table_name} (#{columns.join(', ')}) VALUES (#{values.join(', ')});"
      end
      
      f.puts ""
      
    rescue => e
      puts "⚠️  Ошибка экспорта #{model_name}: #{e.message}"
      f.puts "-- ОШИБКА ЭКСПОРТА #{model_name}: #{e.message}"
      f.puts ""
    end
  end

  f.puts "-- Включаем проверки обратно"
  f.puts "SET session_replication_role = DEFAULT;"
  f.puts ""
  f.puts "-- ЭКСПОРТ ДАННЫХ ЗАВЕРШЕН"
end

puts "✅ Экспорт данных завершен: #{output_file}"
puts "📏 Размер файла: #{File.size(output_file)} байт"

# Показываем содержимое для проверки
puts "\n📋 Первые 10 строк файла:"
File.open(output_file, 'r') do |f|
  10.times do
    line = f.gets
    break unless line
    puts "   #{line.chomp}"
  end
end