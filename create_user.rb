#!/usr/bin/env ruby
require_relative 'config/environment'

# Create the seller user with BlackSea email
seller = User.find_by(email: "seller@blacksea")
if seller.blank?
  seller = User.new
  seller.email = "seller@blacksea.com"
  seller.name = "Seller"
  seller.username = "seller"
  seller.confirmed_at = Time.current
  seller.is_team_member = true
  seller.has_payout_privilege = true
  seller.has_risk_privilege = true
  seller.password = SecureRandom.hex(24)

  # Make seller eligible for service products
  seller.created_at = 2.months.ago
  seller.payments.build(
    state: "completed",
    amount_cents: 1000,
    processor: "paypal",
    processor_fee_cents: 100,
    payout_period_end_date: 1.day.ago
  )

  seller.save!

  # Skip validations to set a pwned but easy password
  seller.password = "password"
  seller.save!(validate: false)

  puts "✅ User seller@blacksea created successfully!"
else
  puts "ℹ️  User seller@blacksea already exists"
end

# Create team members
TeamMembership::ROLES.excluding(TeamMembership::ROLE_OWNER).each do |role|
  email = "seller+#{role}@blacksea.com"
  user = User.find_by(email:)
  next if user.present?

  user = User.create!(
    email:,
    name: "#{role.humanize}ForSeller",
    username: "#{role}forseller",
    confirmed_at: Time.current,
    password: SecureRandom.hex(24)
  )

  # Skip validations to set a pwned but easy password
  user.password = "password"
  user.save!(validate: false)

  user.create_owner_membership_if_needed!
  user.user_memberships.create!(user:, seller:, role:)

  puts "✅ Team member #{email} created"
end

puts "🎉 All users created successfully!"