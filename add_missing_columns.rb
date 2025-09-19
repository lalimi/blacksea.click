#!/usr/bin/env ruby

require_relative 'config/environment'

puts "🔧 ДОБАВЛЕНИЕ НЕДОСТАЮЩИХ КОЛОНОК В SUPABASE"
puts "=" * 60

# Получаем колонки из локальной модели User
user_columns = User.column_names

# Создаем SQL файл для добавления колонок
output_file = 'add_missing_columns.sql'

File.open(output_file, 'w') do |f|
  f.puts "-- ДОБАВЛЕНИЕ НЕДОСТАЮЩИХ КОЛОНОК В SUPABASE"
  f.puts "-- Основано на схеме Rails модели User"
  f.puts "-- Создан: #{Time.now}"
  f.puts ""
  f.puts "SET client_min_messages TO WARNING;"
  f.puts ""
  
  f.puts "-- =================================="
  f.puts "-- ДОБАВЛЕНИЕ КОЛОНОК В ТАБЛИЦУ USERS"
  f.puts "-- =================================="
  f.puts ""
  
  # Получаем информацию о типах колонок из локальной БД
  connection = ActiveRecord::Base.connection
  
  user_columns.each do |column_name|
    begin
      column_info = connection.columns('users').find { |col| col.name == column_name }
      next unless column_info
      
      # Определяем тип PostgreSQL
      pg_type = case column_info.type
      when :bigint, :integer
        if column_name == 'id'
          'BIGSERIAL PRIMARY KEY'
        elsif column_name.include?('_id')
          'BIGINT'
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
      when :json, :jsonb
        'JSONB'
      else
        'TEXT' # Fallback
      end
      
      # Определяем DEFAULT и NULL
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
          if column_info.default.include?('now')
            default_clause = " DEFAULT NOW()"
          end
        end
      end
      
      null_clause = column_info.null ? "" : " NOT NULL"
      
      # Пропускаем PRIMARY KEY колонки (id уже должен существовать)
      next if column_name == 'id'
      
      f.puts "-- Колонка: #{column_name} (#{column_info.type})"
      f.puts "DO $$ BEGIN"
      f.puts "    IF NOT EXISTS (SELECT 1 FROM information_schema.columns "
      f.puts "                   WHERE table_name = 'users' AND column_name = '#{column_name}' "
      f.puts "                   AND table_schema = 'public') THEN"
      f.puts "        ALTER TABLE users ADD COLUMN #{column_name} #{pg_type}#{default_clause}#{null_clause};"
      f.puts "        RAISE NOTICE 'Добавлена колонка users.#{column_name}';"
      f.puts "    END IF;"
      f.puts "EXCEPTION WHEN others THEN"
      f.puts "    RAISE NOTICE 'Ошибка добавления колонки #{column_name}: %', SQLERRM;"
      f.puts "END $$;"
      f.puts ""
      
    rescue => e
      puts "⚠️  Ошибка обработки колонки #{column_name}: #{e.message}"
    end
  end
  
  f.puts "-- =================================="
  f.puts "-- ДОБАВЛЕНИЕ КОЛОНОК В ДРУГИЕ ТАБЛИЦЫ"
  f.puts "-- =================================="
  f.puts ""
  
  # Проверим другие важные таблицы
  %w[links affiliates events].each do |table_name|
    begin
      model_class = table_name.singularize.camelize.constantize
      columns = model_class.column_names
      
      f.puts "-- Таблица: #{table_name}"
      
      columns.each do |column_name|
        next if column_name == 'id' # Пропускаем ID
        
        column_info = connection.columns(table_name).find { |col| col.name == column_name }
        next unless column_info
        
        pg_type = case column_info.type
        when :bigint, :integer
          if column_name.include?('_id')
            'BIGINT'
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
          'DECIMAL(10,2)'
        when :json, :jsonb
          'JSONB'
        else
          'TEXT'
        end
        
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
        
        null_clause = column_info.null ? "" : " NOT NULL"
        
        f.puts "DO $$ BEGIN"
        f.puts "    IF NOT EXISTS (SELECT 1 FROM information_schema.columns "
        f.puts "                   WHERE table_name = '#{table_name}' AND column_name = '#{column_name}' "
        f.puts "                   AND table_schema = 'public') THEN"
        f.puts "        ALTER TABLE #{table_name} ADD COLUMN #{column_name} #{pg_type}#{default_clause}#{null_clause};"
        f.puts "        RAISE NOTICE 'Добавлена колонка #{table_name}.#{column_name}';"
        f.puts "    END IF;"
        f.puts "EXCEPTION WHEN others THEN"
        f.puts "    RAISE NOTICE 'Ошибка добавления колонки #{table_name}.#{column_name}: %', SQLERRM;"
        f.puts "END $$;"
        f.puts ""
      end
      
      f.puts ""
      
    rescue => e
      puts "⚠️  Ошибка обработки таблицы #{table_name}: #{e.message}"
    end
  end
  
  f.puts "-- =================================="
  f.puts "-- ПРОВЕРКА РЕЗУЛЬТАТОВ"
  f.puts "-- =================================="
  f.puts "SELECT table_name, column_name, data_type "
  f.puts "FROM information_schema.columns "
  f.puts "WHERE table_name IN ('users', 'links', 'affiliates', 'events') "
  f.puts "  AND table_schema = 'public' "
  f.puts "ORDER BY table_name, ordinal_position;"
  f.puts ""
  f.puts "-- ДОБАВЛЕНИЕ КОЛОНОК ЗАВЕРШЕНО"
end

puts "✅ Скрипт добавления колонок создан: #{output_file}"
puts "📏 Размер: #{File.size(output_file) / 1024}KB"

puts "\n📊 Колонки для добавления в users: #{user_columns.length}"
puts "   #{user_columns.first(10).join(', ')}, ..."

puts "\n🎯 ИНСТРУКЦИИ:"
puts "1. Выполните #{output_file} в Supabase SQL Editor"
puts "2. Затем повторно запустите импорт данных"
puts "3. Все колонки будут созданы с правильными типами"