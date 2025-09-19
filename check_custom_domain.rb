#!/usr/bin/env ruby
require_relative 'config/environment'

link = Link.find_by(unique_permalink: 'b')
if link
  puts "Product: #{link.name}"
  puts "User: #{link.user.name} (#{link.user.username})"
  puts "Custom domain: #{link.custom_domain&.domain}"
  puts "Custom domain verified: #{link.custom_domain&.verified?}"

  # Проверим кастомный домен пользователя
  puts "\nUser's custom domain:"
  if link.user.custom_domain
    puts "  - #{link.user.custom_domain.domain} (verified: #{link.user.custom_domain.verified?})"
  else
    puts "  - No custom domain configured"
  end

  # Проверим, есть ли кастомный домен для seller.localhost
  seller_domain = CustomDomain.find_by(domain: 'seller.localhost')
  if seller_domain
    puts "\nCustom domain 'seller.localhost' found:"
    puts "  - User: #{seller_domain.user.name}"
    puts "  - Product: #{seller_domain.product&.name}"
    puts "  - Verified: #{seller_domain.verified?}"
  else
    puts "\nCustom domain 'seller.localhost' NOT found"
  end

  # Проверим все кастомные домены
  puts "\nAll custom domains:"
  CustomDomain.all.each do |cd|
    puts "  - #{cd.domain} -> #{cd.user.name} (product: #{cd.product&.name}, verified: #{cd.verified?})"
  end
else
  puts "Product not found"
end