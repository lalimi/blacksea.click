#!/usr/bin/env ruby
require_relative 'config/environment'

link = Link.find_by(unique_permalink: 'b')
if link
  puts "Product status: purchase_disabled_at = #{link.purchase_disabled_at}"
  puts "Product published: #{link.alive?}"
  puts "Product URL: http://localhost:3000/l/b"
else
  puts "Product not found"
end