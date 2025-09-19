require 'net/http'
require 'json'

# Проверяем API подключение к Supabase
supabase_url = 'https://qewjnagvsbnwgamrrrwg.supabase.co'
anon_key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFld2puYWd2c2Jud2dhbXJycndnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU2OTYxMTUsImV4cCI6MjA3MTI3MjExNX0.cXxxoPv79s3SLV2N2KU0OqyzwRf3cLAJIjvjM2XqWxQ'

puts "🔄 Тестируем Supabase REST API..."

begin
  uri = URI("#{supabase_url}/rest/v1/")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  
  request = Net::HTTP::Get.new(uri)
  request['apikey'] = anon_key
  request['Content-Type'] = 'application/json'
  
  response = http.request(request)
  
  puts "📊 Статус ответа: #{response.code}"
  puts "📋 Заголовки: #{response.to_hash.keys.join(', ')}"
  
  if response.code == '200' || response.code == '404'
    puts "✅ Supabase API доступен!"
    puts "🎯 Готов к миграции данных"
  else
    puts "❌ Проблема с API: #{response.body}"
  end
  
rescue => e
  puts "❌ Ошибка подключения: #{e.message}"
end