require 'net/http'
require 'json'

SUPABASE_URL = 'https://qewjnagvsbnwgamrrrwg.supabase.co'
SERVICE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFld2puYWd2c2Jud2dhbXJycndnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1NTY5NjExNSwiZXhwIjoyMDcxMjcyMTE1fQ.yHfkPEm8qRVgcQHm13S84eeEMXYwjMCOhBLiOWaHnlI'

puts "🔍 Проверяем статус Supabase БД..."

uri = URI("#{SUPABASE_URL}/rest/v1/users?limit=1")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri)
request['apikey'] = SERVICE_KEY
request['Authorization'] = "Bearer #{SERVICE_KEY}"

response = http.request(request)
puts "Код: #{response.code}"
puts "Ответ: #{response.body}"

case response.code
when '200'
  puts "✅ Таблица users существует!"
when '400', '404'
  puts "❌ Таблица users не создана"
else
  puts "⚠️  Неожиданный ответ"
end