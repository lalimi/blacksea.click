#!/usr/bin/env ruby

# Применение миграций Supabase через REST API
require 'net/http'
require 'json'
require 'uri'

# Загрузка переменных из .env.local
env_vars = {}
File.readlines('.env.local').each do |line|
  line.strip!
  next if line.empty? || line.start_with?('#')
  key, value = line.split('=', 2)
  env_vars[key] = value if key && value
end

supabase_url = env_vars['SUPABASE_URL']
service_key = env_vars['SUPABASE_SERVICE_ROLE_KEY']

puts "🚀 Применение миграций через Supabase REST API..."
puts "URL: #{supabase_url}"

# Проверка доступа
if !service_key || service_key == 'your_service_role_key_here'
  puts "❌ SUPABASE_SERVICE_ROLE_KEY не настроен"
  puts "   Получите ключ из Dashboard -> Settings -> API -> service_role"
  exit 1
end

# Функция для выполнения SQL через Edge Functions или RPC
def execute_sql(url, key, sql)
  begin
    # Попробуем через SQL Editor API (если доступен)
    uri = URI("#{url}/rest/v1/rpc/exec_sql")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    
    request = Net::HTTP::Post.new(uri)
    request['apikey'] = key
    request['Authorization'] = "Bearer #{key}"
    request['Content-Type'] = 'application/json'
    request.body = { sql: sql }.to_json
    
    response = http.request(request)
    
    if response.code.to_i == 200
      return { success: true, result: JSON.parse(response.body) }
    else
      return { 
        success: false, 
        error: "HTTP #{response.code}: #{response.body}",
        message: "RPC endpoint недоступен - используйте Dashboard SQL Editor"
      }
    end
  rescue => e
    return { 
      success: false, 
      error: e.message,
      message: "Ошибка подключения - используйте Dashboard SQL Editor"
    }
  end
end

# Получение списка миграций
migration_files = Dir['supabase/migrations/*.sql'].sort

if migration_files.empty?
  puts "❌ Миграции не найдены в supabase/migrations/"
  exit 1
end

puts "📝 Найдено #{migration_files.length} миграций:"
migration_files.each_with_index do |file, index|
  puts "   #{index + 1}. #{File.basename(file)}"
end

# Попытка применения миграций
puts "\n🔧 Попытка применения миграций через API..."

migration_files.each_with_index do |file, index|
  filename = File.basename(file)
  puts "\n📋 Миграция #{index + 1}/#{migration_files.length}: #{filename}"
  
  sql_content = File.read(file)
  
  # Разделение на отдельные команды (по ';')
  commands = sql_content.split(';').map(&:strip).reject(&:empty?)
  
  puts "   Команд SQL: #{commands.length}"
  
  # Проверка, что это безопасные команды
  dangerous_keywords = %w[DROP\ DATABASE DELETE\ FROM TRUNCATE]
  has_dangerous = commands.any? { |cmd| dangerous_keywords.any? { |keyword| cmd.upcase.include?(keyword) } }
  
  if has_dangerous
    puts "   ⚠️ Обнаружены потенциально опасные команды - пропускаем автоматическое выполнение"
    next
  end
  
  # Попытка выполнения через API
  result = execute_sql(supabase_url, service_key, sql_content)
  
  if result[:success]
    puts "   ✅ Миграция применена успешно"
  else
    puts "   ❌ Ошибка: #{result[:message]}"
  end
end

puts "\n" + "="*60
puts "📋 ЗАКЛЮЧЕНИЕ:"
puts

puts "⚠️ Автоматическое применение миграций через API ограничено."
puts "   Большинство Supabase проектов требуют применения миграций через:"

puts "\n🎯 РЕКОМЕНДУЕМЫЕ СПОСОБЫ:"
puts
puts "1. 📊 Dashboard SQL Editor (самый надежный):"
puts "   • Откройте https://supabase.com/dashboard"
puts "   • Перейдите в проект qewjnagvsbnwgamrrrwg"
puts "   • SQL Editor → New Query"
puts "   • Скопируйте и выполните содержимое каждого файла:"

migration_files.each_with_index do |file, index|
  filename = File.basename(file)
  puts "     #{index + 1}. #{filename}"
end

puts "\n2. 🔧 Supabase CLI (если получите доступ):"
puts "   • supabase login"
puts "   • supabase link --project-ref qewjnagvsbnwgamrrrwg"
puts "   • supabase db push"

puts "\n3. 🚀 Прямое PostgreSQL подключение (если настроите IP):"
puts "   • Добавьте IP #{`curl -s https://ipinfo.io/ip`.strip} в Allow List"
puts "   • ./bin/db_migrate_to_supabase.sh"

puts "\n💡 После применения миграций:"
puts "   ruby test_supabase_client.rb  # Проверка работы таблиц"