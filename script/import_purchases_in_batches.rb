# ruby script/import_purchases_in_batches.rb
# Batch-import Purchase records into Elasticsearch using elasticsearch-model's import for arrays.
# Usage: bundle exec ruby -r ./config/environment script/import_purchases_in_batches.rb

BATCH_SIZE = (ENV['BATCH_SIZE'] || 200).to_i
puts "Starting Purchase import in batches (BATCH_SIZE=#{BATCH_SIZE})"

total = Purchase.count
puts "Total purchases to import: #{total}"

i = 0
Purchase.find_in_batches(batch_size: BATCH_SIZE) do |batch|
  Purchase.import(batch)
  i += batch.size
  puts "Imported #{i}/#{total} (ids #{batch.first.id}..#{batch.last.id})"
end

puts "Import finished: imported #{i} records"
