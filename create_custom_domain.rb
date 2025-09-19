#!/usr/bin/env ruby
require_relative 'config/environment'

user = User.find_by(username: 'seller')
link = Link.find_by(unique_permalink: 'b')

if user && link
  # Создаем кастомный домен для пользователя
  custom_domain = user.build_custom_domain
  custom_domain.domain = 'seller.localhost'
  custom_domain.product = link

  if custom_domain.save
    # Помечаем домен как верифицированный
    custom_domain.mark_verified!
    puts "Custom domain 'seller.localhost' created and verified successfully!"
    puts "Domain: #{custom_domain.domain}"
    puts "User: #{custom_domain.user.name}"
    puts "Product: #{custom_domain.product.name}"
    puts "State: #{custom_domain.state}"
    puts "Verified: #{custom_domain.verified?}"
  else
    puts "Failed to create custom domain: #{custom_domain.errors.full_messages.join(', ')}"
  end
else
  puts "User or product not found"
end