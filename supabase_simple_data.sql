-- ПРОСТОЙ ИМПОРТ ДАННЫХ В SUPABASE
-- Использует базовые INSERT с проверкой конфликтов
-- Создан: 2025-08-28 13:23:52 +0300

SET session_replication_role = replica;
SET client_min_messages TO WARNING;

-- ========================================
-- USERS (5 записей) - ПРИОРИТЕТНАЯ
-- ========================================
INSERT INTO users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, google_uid, username, user_risk_state, external_id, name, provider, confirmed_at, confirmation_token, confirmation_sent_at, unconfirmed_email, tier_state, flags, locale, timezone, currency_type, recommendation_type, facebook_meta_tag, google_analytics_id, support_email, bio, profile_picture_url, country, verified, payment_notification, facebook_uid, twitter_user_id, twitter_handle, twitter_oauth_token, twitter_oauth_secret, facebook_id, purchasing_power_parity_limit, kindle_email, payment_address, deleted_at, account_created_ip, notification_endpoint, json_data, tos_violation_reason, google_analytics_domains, facebook_pixel_id, split_payment_by_cents, last_active_sessions_invalidated_at, otp_secret_key, orientation_priority_tag, facebook_access_token, manage_pages, banned_at, weekly_notification, state, city, zip_code, street_address) 
VALUES (3, 'test@example.com', '$2a$11$aDbFr03VvZ7OPrbycz.JnezMQZATV5ESCRE/ihDnOmi32GGjUzeBG', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-08-26 07:10:57', '2025-08-26 07:10:57', NULL, NULL, 'not_reviewed', '8899095974529', NULL, NULL, NULL, 'ZpAdZyDwFfguwbNMY7-d', '2025-08-26 07:10:57', NULL, 0, 22123376574785, 'en', 'Pacific Time (US & Canada)', 'usd', 'own_products', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, NULL, NULL, NULL, NULL, 'J7BVDRCF672MRHQCC727LTY2E4EU6GJZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, google_uid, username, user_risk_state, external_id, name, provider, confirmed_at, confirmation_token, confirmation_sent_at, unconfirmed_email, tier_state, flags, locale, timezone, currency_type, recommendation_type, facebook_meta_tag, google_analytics_id, support_email, bio, profile_picture_url, country, verified, payment_notification, facebook_uid, twitter_user_id, twitter_handle, twitter_oauth_token, twitter_oauth_secret, facebook_id, purchasing_power_parity_limit, kindle_email, payment_address, deleted_at, account_created_ip, notification_endpoint, json_data, tos_violation_reason, google_analytics_domains, facebook_pixel_id, split_payment_by_cents, last_active_sessions_invalidated_at, otp_secret_key, orientation_priority_tag, facebook_access_token, manage_pages, banned_at, weekly_notification, state, city, zip_code, street_address) 
VALUES (5, 'test_final@example.com', '$2a$11$ffqGpHFR5yNHbOvvzJv.VOh6BMTXWa6oafDca7RZnleYdrgPrGD0C', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-08-26 12:20:38', '2025-08-26 12:20:38', NULL, NULL, 'not_reviewed', '7968955700359', NULL, NULL, NULL, 'vjx82xu8Etd4CtK_xdT9', '2025-08-26 12:20:38', NULL, 0, 22123376574785, 'en', 'Pacific Time (US & Canada)', 'usd', 'own_products', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, NULL, NULL, NULL, NULL, 'JD4ARAKW65EJTEROKZHFRXSCXQGKJPKG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, google_uid, username, user_risk_state, external_id, name, provider, confirmed_at, confirmation_token, confirmation_sent_at, unconfirmed_email, tier_state, flags, locale, timezone, currency_type, recommendation_type, facebook_meta_tag, google_analytics_id, support_email, bio, profile_picture_url, country, verified, payment_notification, facebook_uid, twitter_user_id, twitter_handle, twitter_oauth_token, twitter_oauth_secret, facebook_id, purchasing_power_parity_limit, kindle_email, payment_address, deleted_at, account_created_ip, notification_endpoint, json_data, tos_violation_reason, google_analytics_domains, facebook_pixel_id, split_payment_by_cents, last_active_sessions_invalidated_at, otp_secret_key, orientation_priority_tag, facebook_access_token, manage_pages, banned_at, weekly_notification, state, city, zip_code, street_address) 
VALUES (6, 'final_test@example.com', '$2a$11$3NPFyrk/l8Opg2hCCAWe7uHEQHs23oovIBncpy3.XCGGiw9lGs09C', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-08-26 12:24:53', '2025-08-26 12:24:53', NULL, NULL, 'not_reviewed', '8634327479571', 'Final Test User', NULL, NULL, 'JymJWcXunjzHF83z4mEA', '2025-08-26 12:24:53', NULL, 0, 22123376574785, 'en', 'Pacific Time (US & Canada)', 'usd', 'own_products', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, NULL, NULL, NULL, NULL, 'TGLMKX5WJTRBS24LWUGDHYQ7Z6LYUHNT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, google_uid, username, user_risk_state, external_id, name, provider, confirmed_at, confirmation_token, confirmation_sent_at, unconfirmed_email, tier_state, flags, locale, timezone, currency_type, recommendation_type, facebook_meta_tag, google_analytics_id, support_email, bio, profile_picture_url, country, verified, payment_notification, facebook_uid, twitter_user_id, twitter_handle, twitter_oauth_token, twitter_oauth_secret, facebook_id, purchasing_power_parity_limit, kindle_email, payment_address, deleted_at, account_created_ip, notification_endpoint, json_data, tos_violation_reason, google_analytics_domains, facebook_pixel_id, split_payment_by_cents, last_active_sessions_invalidated_at, otp_secret_key, orientation_priority_tag, facebook_access_token, manage_pages, banned_at, weekly_notification, state, city, zip_code, street_address) 
VALUES (4, 'miroshnichenko.lalita@gmail.com', '$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK', NULL, NULL, '2025-08-27 14:16:01', 3, '2025-08-26 12:10:08', '2025-08-26 07:54:27', '::1', '::1', '2025-08-26 07:12:41', '2025-08-27 14:16:01', '106384220000990454010', NULL, 'not_reviewed', '1418591517294', 'Лалита Мирошниченко', 'google_oauth2', '2025-08-26 07:12:41', NULL, NULL, NULL, 0, 22123376836929, 'uk', 'Pacific Time (US & Canada)', 'uah', 'own_products', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, NULL, NULL, NULL, NULL, 'HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, google_uid, username, user_risk_state, external_id, name, provider, confirmed_at, confirmation_token, confirmation_sent_at, unconfirmed_email, tier_state, flags, locale, timezone, currency_type, recommendation_type, facebook_meta_tag, google_analytics_id, support_email, bio, profile_picture_url, country, verified, payment_notification, facebook_uid, twitter_user_id, twitter_handle, twitter_oauth_token, twitter_oauth_secret, facebook_id, purchasing_power_parity_limit, kindle_email, payment_address, deleted_at, account_created_ip, notification_endpoint, json_data, tos_violation_reason, google_analytics_domains, facebook_pixel_id, split_payment_by_cents, last_active_sessions_invalidated_at, otp_secret_key, orientation_priority_tag, facebook_access_token, manage_pages, banned_at, weekly_notification, state, city, zip_code, street_address) 
VALUES (8, 'test_seller@example.com', '$2a$11$vzj2kSI79TEIV4uWBYdZAO7THkZE265NyJXzcuaP1m118MaIWGlUK', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-08-27 15:35:59', '2025-08-27 15:35:59', NULL, NULL, 'not_reviewed', '9238446862723', 'Test Seller', NULL, NULL, 'duhrkVbR5GNGJ7M5iXbo', '2025-08-27 15:35:59', NULL, 0, 22123376574785, 'uk', 'Pacific Time (US & Canada)', 'uah', 'own_products', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{}', NULL, NULL, NULL, NULL, NULL, 'V5FQBD4HFQOSMG5WJXIOGIH5MYIH4FKA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL) 
ON CONFLICT DO NOTHING;

-- ========================================
-- AFFILIATES (2 записей) - ПРИОРИТЕТНАЯ
-- ========================================
INSERT INTO affiliates (id, seller_id, affiliate_user_id, affiliate_basis_points, created_at, updated_at, deleted_at, flags, destination_url, type) 
VALUES (1, NULL, 7, 1000, '2025-08-27 12:51:59', '2025-08-27 12:51:59', NULL, 0, NULL, 'GlobalAffiliate') 
ON CONFLICT DO NOTHING;
INSERT INTO affiliates (id, seller_id, affiliate_user_id, affiliate_basis_points, created_at, updated_at, deleted_at, flags, destination_url, type) 
VALUES (2, NULL, 8, 1000, '2025-08-27 15:35:59', '2025-08-27 15:35:59', NULL, 0, NULL, 'GlobalAffiliate') 
ON CONFLICT DO NOTHING;

-- ========================================
-- LINKS (4 записей) - ПРИОРИТЕТНАЯ
-- ========================================
INSERT INTO links (id, user_id, name, unique_permalink, preview_url, description, purchase_type, created_at, updated_at, purchase_disabled_at, deleted_at, price_cents, price_currency_type, customizable_price, max_purchase_count, bad_card_counter, require_shipping, last_partner_sync, preview_oembed, showcaseable, custom_receipt, custom_filetype, filetype, filegroup, size, bitrate, framerate, pagelength, duration, width, height, custom_permalink, common_color, suggested_price_cents, banned_at, risk_score, risk_score_updated_at, draft, flags, subscription_duration, json_data, external_mapping_id, affiliate_application_id, rental_price_cents, duration_in_months, migrated_to_tiered_pricing_at, free_trial_duration_unit, free_trial_duration_amount, content_updated_at, taxonomy_id, native_type, discover_fee_per_thousand) 
VALUES (2, 8, 'Тестовий цифровий продукт', 'y', NULL, 'Це тестовий цифровий продукт для перевірки системи', 'buy_only', '2025-08-27 15:39:51', '2025-08-27 15:39:51', NULL, NULL, 2500, 'uah', NULL, NULL, 0, false, NULL, NULL, false, NULL, NULL, 'link', 'url', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 0, NULL, '{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'digital', 300) 
ON CONFLICT DO NOTHING;
INSERT INTO links (id, user_id, name, unique_permalink, preview_url, description, purchase_type, created_at, updated_at, purchase_disabled_at, deleted_at, price_cents, price_currency_type, customizable_price, max_purchase_count, bad_card_counter, require_shipping, last_partner_sync, preview_oembed, showcaseable, custom_receipt, custom_filetype, filetype, filegroup, size, bitrate, framerate, pagelength, duration, width, height, custom_permalink, common_color, suggested_price_cents, banned_at, risk_score, risk_score_updated_at, draft, flags, subscription_duration, json_data, external_mapping_id, affiliate_application_id, rental_price_cents, duration_in_months, migrated_to_tiered_pricing_at, free_trial_duration_unit, free_trial_duration_amount, content_updated_at, taxonomy_id, native_type, discover_fee_per_thousand) 
VALUES (3, 8, 'Тестовий фізичний товар', 'o', NULL, 'Це тестовий фізичний товар з доставкою', 'buy_only', '2025-08-27 15:39:52', '2025-08-27 15:39:52', NULL, NULL, 5000, 'uah', NULL, NULL, 0, true, NULL, NULL, false, NULL, NULL, 'link', 'url', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 128, NULL, '{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'physical', 300) 
ON CONFLICT DO NOTHING;
INSERT INTO links (id, user_id, name, unique_permalink, preview_url, description, purchase_type, created_at, updated_at, purchase_disabled_at, deleted_at, price_cents, price_currency_type, customizable_price, max_purchase_count, bad_card_counter, require_shipping, last_partner_sync, preview_oembed, showcaseable, custom_receipt, custom_filetype, filetype, filegroup, size, bitrate, framerate, pagelength, duration, width, height, custom_permalink, common_color, suggested_price_cents, banned_at, risk_score, risk_score_updated_at, draft, flags, subscription_duration, json_data, external_mapping_id, affiliate_application_id, rental_price_cents, duration_in_months, migrated_to_tiered_pricing_at, free_trial_duration_unit, free_trial_duration_amount, content_updated_at, taxonomy_id, native_type, discover_fee_per_thousand) 
VALUES (4, 8, 'Test Product Simple', 'z', NULL, 'Simple test product', 'buy_only', '2025-08-27 16:46:09', '2025-08-27 16:46:09', NULL, NULL, 2500, 'uah', NULL, NULL, 0, false, NULL, NULL, false, NULL, NULL, 'link', 'url', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 0, NULL, '{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'digital', 300) 
ON CONFLICT DO NOTHING;
INSERT INTO links (id, user_id, name, unique_permalink, preview_url, description, purchase_type, created_at, updated_at, purchase_disabled_at, deleted_at, price_cents, price_currency_type, customizable_price, max_purchase_count, bad_card_counter, require_shipping, last_partner_sync, preview_oembed, showcaseable, custom_receipt, custom_filetype, filetype, filegroup, size, bitrate, framerate, pagelength, duration, width, height, custom_permalink, common_color, suggested_price_cents, banned_at, risk_score, risk_score_updated_at, draft, flags, subscription_duration, json_data, external_mapping_id, affiliate_application_id, rental_price_cents, duration_in_months, migrated_to_tiered_pricing_at, free_trial_duration_unit, free_trial_duration_amount, content_updated_at, taxonomy_id, native_type, discover_fee_per_thousand) 
VALUES (5, 4, 'Цифровий товар основного користувача', 'r', NULL, 'Тестовий цифровий товар', 'buy_only', '2025-08-27 17:03:49', '2025-08-27 17:03:49', NULL, NULL, 5000, 'uah', NULL, NULL, 0, false, NULL, NULL, false, NULL, NULL, 'link', 'url', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 0, NULL, '{}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'digital', 300) 
ON CONFLICT DO NOTHING;

-- ========================================
-- PRICES (5 записей)
-- ========================================
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (1, 1, 5000, 'uah', NULL, '2025-08-27 12:52:00', '2025-08-27 12:52:00', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (2, 2, 2500, 'uah', NULL, '2025-08-27 15:39:51', '2025-08-27 15:39:51', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (3, 3, 5000, 'uah', NULL, '2025-08-27 15:39:52', '2025-08-27 15:39:52', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (4, 4, 2500, 'uah', NULL, '2025-08-27 16:46:09', '2025-08-27 16:46:09', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (5, 5, 5000, 'uah', NULL, '2025-08-27 17:03:49', '2025-08-27 17:03:49', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;

-- ========================================
-- EVENTS (26 записей)
-- ========================================
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (1, 0, '::1', 'emails_view', 4, NULL, '2025-08-27 12:54:11', '2025-08-27 12:54:11', 'http://localhost:3000/checkout/discounts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/emails', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (2, 0, '::1', 'emails_view', 4, NULL, '2025-08-27 12:54:12', '2025-08-27 12:54:12', 'http://localhost:3000/checkout/discounts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/emails/published', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (3, 0, '::1', 'workflows_view', 4, NULL, '2025-08-27 12:54:15', '2025-08-27 12:54:15', 'http://localhost:3000/emails/published', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/workflows', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (4, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 12:54:17', '2025-08-27 12:54:17', 'http://localhost:3000/workflows', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (5, 0, '::1', 'emails_view', 4, NULL, '2025-08-27 13:12:59', '2025-08-27 13:12:59', 'http://localhost:3000/collaborators', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/emails', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (6, 0, '::1', 'emails_view', 4, NULL, '2025-08-27 13:12:59', '2025-08-27 13:12:59', 'http://localhost:3000/collaborators', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/emails/published', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (7, 0, '::1', 'workflows_view', 4, NULL, '2025-08-27 13:13:04', '2025-08-27 13:13:04', 'http://localhost:3000/checkout/discounts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/workflows', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (8, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 13:13:10', '2025-08-27 13:13:10', 'http://localhost:3000/workflows', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (9, 0, '::1', 'emails_view', 4, NULL, '2025-08-27 13:57:50', '2025-08-27 13:57:50', 'http://localhost:3000/checkout/discounts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/emails', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (10, 0, '::1', 'emails_view', 4, NULL, '2025-08-27 13:57:51', '2025-08-27 13:57:51', 'http://localhost:3000/checkout/discounts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/emails/published', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (11, 0, '::1', 'workflows_view', 4, NULL, '2025-08-27 13:57:55', '2025-08-27 13:57:55', 'http://localhost:3000/emails/published', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/workflows', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (12, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 13:58:01', '2025-08-27 13:58:01', 'http://localhost:3000/workflows', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (13, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 13:58:10', '2025-08-27 13:58:10', 'http://localhost:3000/customers', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (14, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 14:00:52', '2025-08-27 14:00:52', 'http://localhost:3000/payouts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (15, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 14:02:33', '2025-08-27 14:02:33', 'http://localhost:3000/payouts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (16, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 14:05:38', '2025-08-27 14:05:38', 'http://localhost:3000/payouts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (17, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 14:06:57', '2025-08-27 14:06:57', 'http://localhost:3000/payouts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (18, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 14:11:04', '2025-08-27 14:11:04', 'http://localhost:3000/payouts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (19, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 14:11:13', '2025-08-27 14:11:13', 'http://localhost:3000/payouts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, service_charge_id) 
VALUES (20, 0, '::1', 'customers_view', 4, NULL, '2025-08-27 14:25:11', '2025-08-27 14:25:11', 'http://localhost:3000/payouts', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', false, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false, '/customers', NULL, NULL, 0.0, 0.0, NULL, NULL, 'c8c5e239db9019680bf7a5d3fb32ffb0', NULL, 'c4148e78-a514-4622-8794-7c85ac397dd5', 'localhost', NULL, NULL) 
ON CONFLICT DO NOTHING;

-- ========================================
-- PRICES (5 записей)
-- ========================================
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (1, 1, 5000, 'uah', NULL, '2025-08-27 12:52:00', '2025-08-27 12:52:00', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (2, 2, 2500, 'uah', NULL, '2025-08-27 15:39:51', '2025-08-27 15:39:51', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (3, 3, 5000, 'uah', NULL, '2025-08-27 15:39:52', '2025-08-27 15:39:52', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (4, 4, 2500, 'uah', NULL, '2025-08-27 16:46:09', '2025-08-27 16:46:09', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (5, 5, 5000, 'uah', NULL, '2025-08-27 17:03:49', '2025-08-27 17:03:49', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;

-- ========================================
-- REFUND_POLICIES (1 записей)
-- ========================================
INSERT INTO refund_policies (id, seller_id, product_id, title, fine_print, created_at, updated_at, max_refund_period_in_days) 
VALUES (2, 8, NULL, NULL, NULL, '2025-08-27 15:35:59', '2025-08-27 15:35:59', 30) 
ON CONFLICT DO NOTHING;

-- ========================================
-- REFUND_POLICIES (1 записей)
-- ========================================
INSERT INTO refund_policies (id, seller_id, product_id, title, fine_print, created_at, updated_at, max_refund_period_in_days) 
VALUES (2, 8, NULL, NULL, NULL, '2025-08-27 15:35:59', '2025-08-27 15:35:59', 30) 
ON CONFLICT DO NOTHING;

-- ========================================
-- REFUND_POLICIES (1 записей)
-- ========================================
INSERT INTO refund_policies (id, seller_id, product_id, title, fine_print, created_at, updated_at, max_refund_period_in_days) 
VALUES (2, 8, NULL, NULL, NULL, '2025-08-27 15:35:59', '2025-08-27 15:35:59', 30) 
ON CONFLICT DO NOTHING;

-- ========================================
-- VARIANT_CATEGORIES (1 записей)
-- ========================================
INSERT INTO variant_categories (id, link_id, deleted_at, title, flags) 
VALUES (1, 7, NULL, 'Tier', 0) 
ON CONFLICT DO NOTHING;

-- ========================================
-- PRICES (5 записей)
-- ========================================
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (1, 1, 5000, 'uah', NULL, '2025-08-27 12:52:00', '2025-08-27 12:52:00', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (2, 2, 2500, 'uah', NULL, '2025-08-27 15:39:51', '2025-08-27 15:39:51', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (3, 3, 5000, 'uah', NULL, '2025-08-27 15:39:52', '2025-08-27 15:39:52', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (4, 4, 2500, 'uah', NULL, '2025-08-27 16:46:09', '2025-08-27 16:46:09', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;
INSERT INTO prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) 
VALUES (5, 5, 5000, 'uah', NULL, '2025-08-27 17:03:49', '2025-08-27 17:03:49', NULL, 0, NULL, NULL) 
ON CONFLICT DO NOTHING;

SET session_replication_role = DEFAULT;

-- Проверка результатов
SELECT 'users' as table, count(*) as records FROM users;
SELECT 'links' as table, count(*) as records FROM links;
SELECT 'affiliates' as table, count(*) as records FROM affiliates;

-- ПРОСТОЙ ИМПОРТ ЗАВЕРШЕН
