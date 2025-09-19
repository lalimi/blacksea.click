require 'net/http'
require 'json'

SUPABASE_URL = 'https://qewjnagvsbnwgamrrrwg.supabase.co'
SERVICE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFld2puYWd2c2Jud2dhbXJycndnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1NTY5NjExNSwiZXhwIjoyMDcxMjcyMTE1fQ.yHfkPEm8qRVgcQHm13S84eeEMXYwjMCOhBLiOWaHnlI'

def check_table(table_name)
  uri = URI("#{SUPABASE_URL}/rest/v1/#{table_name}?limit=1")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  
  request = Net::HTTP::Get.new(uri)
  request['apikey'] = SERVICE_KEY
  request['Authorization'] = "Bearer #{SERVICE_KEY}"
  
  response = http.request(request)
  
  case response.code
  when '200'
    data = JSON.parse(response.body)
    puts "✅ #{table_name}: OK (#{data.length} записей показано)"
    true
  when '400', '404'
    puts "❌ #{table_name}: НЕ СУЩЕСТВУЕТ"
    false
  else
    puts "⚠️  #{table_name}: код #{response.code}"
    false
  end
rescue => e
  puts "❌ #{table_name}: ОШИБКА - #{e.message}"
  false
end

puts "🔍 Проверка всех таблиц в Supabase..."

tables = ["active_storage_attachments", "active_storage_blobs", "active_storage_variant_records", "admin_action_call_infos", "affiliate_credits", "affiliate_partial_refunds", "affiliate_requests", "affiliates", "affiliates_links", "ar_internal_metadata", "asset_previews", "audience_members", "australia_backtax_email_infos", "backtax_agreements", "backtax_collections", "balance_transactions", "balances", "bank_accounts", "banks", "base_variant_integrations", "base_variants", "base_variants_product_files", "base_variants_purchases", "blocked_customer_objects", "bundle_product_purchases", "bundle_products", "cached_sales_related_products_infos", "call_availabilities", "call_limitation_infos", "calls", "cart_products", "carts", "charge_purchases", "charges", "collaborator_invitations", "comments", "commission_files", "commissions", "communities", "community_chat_messages", "community_chat_recap_runs", "community_chat_recaps", "community_notification_settings", "computed_sales_analytics_days", "consumption_events", "credit_cards", "credits", "custom_domains", "custom_fields", "custom_fields_products", "devices", "discover_search_suggestions", "discover_searches", "dispute_evidences", "disputes", "dropbox_files", "email_info_charges", "email_infos", "events", "followers", "friendly_id_slugs", "gifts", "gumroad_daily_analytics", "imported_customers", "installment_events", "installment_rules", "installments", "integrations", "invites", "large_sellers", "last_read_community_chat_messages", "legacy_permalinks", "licenses", "links", "media_locations", "merchant_accounts", "oauth_access_grants", "oauth_access_tokens", "oauth_applications", "offer_codes", "offer_codes_products", "order_purchases", "orders", "payment_options", "payments", "payments_balances", "post_email_blasts", "preorder_links", "preorders", "prices", "processor_payment_intents", "product_cached_values", "product_files", "product_files_archives", "product_files_files_archives", "product_folders", "product_installment_plans", "product_integrations", "product_review_responses", "product_review_stats", "product_review_videos", "product_reviews", "product_taggings", "public_files", "purchase_custom_field_files", "purchase_custom_fields", "purchase_early_fraud_warnings", "purchase_integrations", "purchase_offer_code_discounts", "purchase_refund_policies", "purchase_sales_tax_infos", "purchase_taxjar_infos", "purchase_wallet_types", "purchases", "purchasing_power_parity_infos", "recommended_purchase_infos", "recurring_services", "refund_policies", "refunds", "resource_subscriptions", "rich_contents", "sales_export_chunks", "sales_exports", "sales_related_products_infos", "schema_migrations", "self_service_affiliate_products", "seller_profile_sections", "seller_profiles", "sent_abandoned_cart_emails", "sent_email_infos", "sent_post_emails", "service_charges", "shipments", "shipping_destinations", "signup_events", "skus_variants", "staff_picked_products", "stamped_pdfs", "stripe_apple_pay_domains", "subscription_events", "subscription_plan_changes", "subscriptions", "subtitle_files", "tags", "taxonomies", "taxonomy_hierarchies", "taxonomy_stats", "team_invitations", "team_memberships", "third_party_analytics", "thumbnails", "tips", "top_sellers", "tos_agreements", "transcoded_videos", "upsell_purchases", "upsell_variants", "upsells", "upsells_selected_products", "url_redirects", "user_compliance_info", "user_compliance_info_requests", "users", "utm_link_driven_sales", "utm_link_visits", "utm_links", "variant_categories", "versions", "video_files", "wishlist_followers", "wishlist_products", "wishlists", "workflows", "yearly_stats", "zip_tax_rates"]

success_count = 0
tables.each do |table|
  success_count += 1 if check_table(table)
end

puts "\n📊 РЕЗУЛЬТАТ:"
puts "   Проверено: #{tables.length} таблиц"
puts "   Успешно: #{success_count}"
puts "   Ошибок: #{tables.length - success_count}"

if success_count == tables.length
  puts "\n🎉 ВСЕ ТАБЛИЦЫ МИГРИРОВАНЫ УСПЕШНО!"
else
  puts "\n⚠️  Некоторые таблицы требуют внимания"
end
