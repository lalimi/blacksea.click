--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Homebrew)
-- Dumped by pg_dump version 14.18 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at, service_name) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: admin_action_call_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_action_call_infos (id, controller_name, action_name, call_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: affiliate_credits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affiliate_credits (id, oauth_application_id, basis_points, amount_cents, affiliate_user_id, seller_id, created_at, updated_at, purchase_id, link_id, affiliate_credit_success_balance_id, affiliate_credit_chargeback_balance_id, affiliate_credit_refund_balance_id, affiliate_id, fee_cents) FROM stdin;
\.


--
-- Data for Name: affiliate_partial_refunds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affiliate_partial_refunds (id, amount_cents, purchase_id, total_credit_cents, affiliate_user_id, seller_id, affiliate_id, balance_id, affiliate_credit_id, created_at, updated_at, fee_cents) FROM stdin;
\.


--
-- Data for Name: affiliate_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affiliate_requests (id, seller_id, name, email, promotion_text, locale, state, state_transitioned_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: affiliates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affiliates (id, seller_id, affiliate_user_id, affiliate_basis_points, created_at, updated_at, deleted_at, flags, destination_url, type) FROM stdin;
1	\N	7	1000	2025-08-27 12:51:59.470875	2025-08-27 12:51:59.470875	\N	0	\N	GlobalAffiliate
2	\N	8	1000	2025-08-27 15:35:59.763215	2025-08-27 15:35:59.763215	\N	0	\N	GlobalAffiliate
\.


--
-- Data for Name: affiliates_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affiliates_links (id, affiliate_id, link_id, created_at, updated_at, affiliate_basis_points, destination_url, flags) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-08-25 11:15:44.24729	2025-08-25 11:15:44.247293
\.


--
-- Data for Name: asset_previews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.asset_previews (id, link_id, guid, oembed, created_at, updated_at, deleted_at, "position", unsplash_url) FROM stdin;
\.


--
-- Data for Name: audience_members; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.audience_members (id, seller_id, email, details, created_at, updated_at, customer, follower, affiliate, min_paid_cents, max_paid_cents, min_created_at, max_created_at, min_purchase_created_at, max_purchase_created_at, follower_created_at, min_affiliate_created_at, max_affiliate_created_at) FROM stdin;
\.


--
-- Data for Name: australia_backtax_email_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.australia_backtax_email_infos (id, user_id, email_name, sent_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: backtax_agreements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.backtax_agreements (id, user_id, jurisdiction, signature, created_at, updated_at, flags) FROM stdin;
\.


--
-- Data for Name: backtax_collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.backtax_collections (id, user_id, backtax_agreement_id, amount_cents, amount_cents_usd, currency, stripe_transfer_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: balance_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.balance_transactions (id, created_at, updated_at, user_id, merchant_account_id, balance_id, purchase_id, dispute_id, refund_id, credit_id, occurred_at, issued_amount_currency, issued_amount_gross_cents, issued_amount_net_cents, holding_amount_currency, holding_amount_gross_cents, holding_amount_net_cents) FROM stdin;
\.


--
-- Data for Name: balances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.balances (id, user_id, date, amount_cents, state, created_at, updated_at, merchant_account_id, currency, holding_currency, holding_amount_cents) FROM stdin;
\.


--
-- Data for Name: bank_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bank_accounts (id, user_id, bank_number, account_number, state, created_at, updated_at, account_number_last_four, account_holder_full_name, deleted_at, type, branch_code, account_type, stripe_bank_account_id, stripe_fingerprint, stripe_connect_account_id, country, credit_card_id) FROM stdin;
\.


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.banks (id, routing_number, name) FROM stdin;
\.


--
-- Data for Name: base_variant_integrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.base_variant_integrations (id, base_variant_id, integration_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: base_variants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.base_variants (id, variant_category_id, price_difference_cents, name, max_purchase_count, deleted_at, created_at, updated_at, type, link_id, custom_sku, flags, description, position_in_category, customizable_price, subscription_price_change_effective_date, subscription_price_change_message, duration_in_minutes) FROM stdin;
\.


--
-- Data for Name: base_variants_product_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.base_variants_product_files (id, base_variant_id, product_file_id) FROM stdin;
\.


--
-- Data for Name: base_variants_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.base_variants_purchases (id, purchase_id, base_variant_id) FROM stdin;
\.


--
-- Data for Name: blocked_customer_objects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blocked_customer_objects (id, seller_id, object_type, object_value, buyer_email, blocked_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bundle_product_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bundle_product_purchases (id, bundle_purchase_id, product_purchase_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bundle_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bundle_products (id, bundle_id, product_id, variant_id, quantity, deleted_at, created_at, updated_at, "position") FROM stdin;
\.


--
-- Data for Name: cached_sales_related_products_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cached_sales_related_products_infos (id, product_id, counts, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: call_availabilities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.call_availabilities (id, call_id, start_time, end_time, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: call_limitation_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.call_limitation_infos (id, call_id, minimum_notice_in_minutes, maximum_calls_per_day, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: calls; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.calls (id, purchase_id, call_url, start_time, end_time, created_at, updated_at, google_calendar_event_id) FROM stdin;
\.


--
-- Data for Name: cart_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cart_products (id, cart_id, product_id, option_id, affiliate_id, accepted_offer_id, price, quantity, recurrence, recommended_by, rent, url_parameters, referrer, recommender_model_name, created_at, updated_at, deleted_at, call_start_time, accepted_offer_details, pay_in_installments) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts (id, user_id, order_id, return_url, discount_codes, reject_ppp_discount, deleted_at, created_at, updated_at, email, browser_guid, ip_address) FROM stdin;
\.


--
-- Data for Name: charge_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.charge_purchases (id, charge_id, purchase_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: charges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.charges (id, order_id, seller_id, processor, processor_transaction_id, payment_method_fingerprint, credit_card_id, merchant_account_id, amount_cents, gumroad_amount_cents, processor_fee_cents, processor_fee_currency, paypal_order_id, stripe_payment_intent_id, stripe_setup_intent_id, created_at, updated_at, disputed_at, dispute_reversed_at, flags) FROM stdin;
\.


--
-- Data for Name: collaborator_invitations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collaborator_invitations (id, collaborator_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.comments (id, commentable_id, commentable_type, author_id, author_name, content, comment_type, json_data, created_at, updated_at, deleted_at, purchase_id, ancestry, ancestry_depth) FROM stdin;
\.


--
-- Data for Name: commission_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commission_files (id, url, commission_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: commissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commissions (id, status, deposit_purchase_id, completion_purchase_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.communities (id, resource_type, resource_id, seller_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: community_chat_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.community_chat_messages (id, community_id, user_id, content, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: community_chat_recap_runs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.community_chat_recap_runs (id, recap_frequency, from_date, to_date, recaps_count, finished_at, notified_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: community_chat_recaps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.community_chat_recaps (id, community_chat_recap_run_id, community_id, seller_id, summarized_message_count, summary, status, error_message, input_token_count, output_token_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: community_notification_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.community_notification_settings (id, user_id, seller_id, recap_frequency, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: computed_sales_analytics_days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.computed_sales_analytics_days (id, key, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: consumption_events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.consumption_events (id, product_file_id, url_redirect_id, purchase_id, event_type, platform, flags, json_data, created_at, updated_at, link_id, consumed_at, media_location_basis_points) FROM stdin;
\.


--
-- Data for Name: credit_cards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.credit_cards (id, card_type, expiry_month, expiry_year, stripe_customer_id, visual, created_at, updated_at, stripe_fingerprint, cvc_check_failed, card_country, stripe_card_id, card_bin, preorder_id, card_data_handling_mode, charge_processor_id, braintree_customer_id, funding_type, paypal_billing_agreement_id, processor_payment_method_id, json_data) FROM stdin;
\.


--
-- Data for Name: credits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.credits (id, user_id, amount_cents, balance_id, created_at, updated_at, crediting_user_id, chargebacked_purchase_id, merchant_account_id, dispute_id, returned_payment_id, refund_id, financing_paydown_purchase_id, fee_retention_refund_id, backtax_agreement_id, json_data) FROM stdin;
\.


--
-- Data for Name: custom_domains; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.custom_domains (id, user_id, domain, created_at, updated_at, ssl_certificate_issued_at, deleted_at, state, failed_verification_attempts_count, product_id) FROM stdin;
\.


--
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.custom_fields (id, field_type, name, required, global, created_at, updated_at, seller_id, flags) FROM stdin;
\.


--
-- Data for Name: custom_fields_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.custom_fields_products (id, custom_field_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.devices (id, token, app_version, device_type, user_id, created_at, updated_at, app_type) FROM stdin;
\.


--
-- Data for Name: discover_search_suggestions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.discover_search_suggestions (id, discover_search_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: discover_searches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.discover_searches (id, query, taxonomy_id, user_id, ip_address, browser_guid, autocomplete, created_at, updated_at, clicked_resource_type, clicked_resource_id) FROM stdin;
\.


--
-- Data for Name: dispute_evidences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dispute_evidences (id, dispute_id, purchased_at, customer_purchase_ip, customer_email, customer_name, billing_address, shipping_address, shipped_at, shipping_carrier, shipping_tracking_number, uncategorized_text, created_at, updated_at, product_description, cancellation_policy_disclosure, refund_policy_disclosure, cancellation_rebuttal, refund_refusal_explanation, seller_contacted_at, seller_submitted_at, resolved_at, resolution, error_message, access_activity_log, reason_for_winning) FROM stdin;
\.


--
-- Data for Name: disputes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.disputes (id, purchase_id, charge_processor_id, charge_processor_dispute_id, reason, state, initiated_at, closed_at, formalized_at, won_at, lost_at, created_at, updated_at, service_charge_id, seller_id, event_created_at, charge_id) FROM stdin;
\.


--
-- Data for Name: dropbox_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dropbox_files (id, state, dropbox_url, expires_at, deleted_at, user_id, product_file_id, link_id, json_data, s3_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: email_info_charges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.email_info_charges (id, email_info_id, charge_id) FROM stdin;
\.


--
-- Data for Name: email_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.email_infos (id, purchase_id, installment_id, type, email_name, state, sent_at, delivered_at, opened_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events (id, visit_id, ip_address, event_name, user_id, link_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, friend_actions, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, active_test_path_assignments, service_charge_id) FROM stdin;
1	0	::1	emails_view	4	\N	2025-08-27 12:54:11.940285	2025-08-27 12:54:11.940285	http://localhost:3000/checkout/discounts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/emails	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
2	0	::1	emails_view	4	\N	2025-08-27 12:54:12.059813	2025-08-27 12:54:12.059813	http://localhost:3000/checkout/discounts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/emails/published	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
3	0	::1	workflows_view	4	\N	2025-08-27 12:54:15.019277	2025-08-27 12:54:15.019277	http://localhost:3000/emails/published	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/workflows	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
4	0	::1	customers_view	4	\N	2025-08-27 12:54:17.547078	2025-08-27 12:54:17.547078	http://localhost:3000/workflows	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
5	0	::1	emails_view	4	\N	2025-08-27 13:12:59.528581	2025-08-27 13:12:59.528581	http://localhost:3000/collaborators	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/emails	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
6	0	::1	emails_view	4	\N	2025-08-27 13:12:59.691472	2025-08-27 13:12:59.691472	http://localhost:3000/collaborators	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/emails/published	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
7	0	::1	workflows_view	4	\N	2025-08-27 13:13:04.577709	2025-08-27 13:13:04.577709	http://localhost:3000/checkout/discounts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/workflows	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
8	0	::1	customers_view	4	\N	2025-08-27 13:13:10.253195	2025-08-27 13:13:10.253195	http://localhost:3000/workflows	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
9	0	::1	emails_view	4	\N	2025-08-27 13:57:50.095346	2025-08-27 13:57:50.095346	http://localhost:3000/checkout/discounts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/emails	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
10	0	::1	emails_view	4	\N	2025-08-27 13:57:51.020547	2025-08-27 13:57:51.020547	http://localhost:3000/checkout/discounts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/emails/published	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
11	0	::1	workflows_view	4	\N	2025-08-27 13:57:55.52201	2025-08-27 13:57:55.52201	http://localhost:3000/emails/published	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/workflows	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
12	0	::1	customers_view	4	\N	2025-08-27 13:58:01.792744	2025-08-27 13:58:01.792744	http://localhost:3000/workflows	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
13	0	::1	customers_view	4	\N	2025-08-27 13:58:10.391203	2025-08-27 13:58:10.391203	http://localhost:3000/customers	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
14	0	::1	customers_view	4	\N	2025-08-27 14:00:52.730452	2025-08-27 14:00:52.730452	http://localhost:3000/payouts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
15	0	::1	customers_view	4	\N	2025-08-27 14:02:33.437331	2025-08-27 14:02:33.437331	http://localhost:3000/payouts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
16	0	::1	customers_view	4	\N	2025-08-27 14:05:38.047205	2025-08-27 14:05:38.047205	http://localhost:3000/payouts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
17	0	::1	customers_view	4	\N	2025-08-27 14:06:57.595682	2025-08-27 14:06:57.595682	http://localhost:3000/payouts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
18	0	::1	customers_view	4	\N	2025-08-27 14:11:04.884865	2025-08-27 14:11:04.884865	http://localhost:3000/payouts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
19	0	::1	customers_view	4	\N	2025-08-27 14:11:13.799861	2025-08-27 14:11:13.799861	http://localhost:3000/payouts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
20	0	::1	customers_view	4	\N	2025-08-27 14:25:11.210614	2025-08-27 14:25:11.210614	http://localhost:3000/payouts	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
21	0	::1	customers_view	4	\N	2025-08-27 14:32:24.297252	2025-08-27 14:32:24.297252	http://localhost:3000/products	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
22	0	::1	customers_view	4	\N	2025-08-27 14:41:35.621071	2025-08-27 14:41:35.621071	http://localhost:3000/dashboard/sales?from=2025-07-27&to=2025-08-27	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
23	0	::1	customers_view	4	\N	2025-08-27 14:51:48.785072	2025-08-27 14:51:48.785072	http://localhost:3000/dashboard	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
24	0	::1	workflows_view	4	\N	2025-08-27 14:51:58.367085	2025-08-27 14:51:58.367085	http://localhost:3000/customers	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/workflows	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
25	0	::1	customers_view	4	\N	2025-08-27 15:40:11.080996	2025-08-27 15:40:11.080996	http://localhost:3000/products	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
26	0	::1	customers_view	4	\N	2025-08-27 18:14:21.399076	2025-08-27 18:14:21.399076	http://localhost:3000/dashboard	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36	f	\N	\N	\N	\N	\N	\N	\N	\N	f	f	/customers	\N	\N	0	0	\N	\N	c8c5e239db9019680bf7a5d3fb32ffb0	\N	c4148e78-a514-4622-8794-7c85ac397dd5	localhost	\N	\N	\N
\.


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.followers (id, followed_id, email, created_at, updated_at, follower_user_id, source, source_product_id, confirmed_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Data for Name: gifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gifts (id, giftee_purchase_id, gifter_purchase_id, link_id, state, gift_note, giftee_email, gifter_email, created_at, updated_at, flags) FROM stdin;
\.


--
-- Data for Name: gumroad_daily_analytics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gumroad_daily_analytics (id, period_ended_at, gumroad_price_cents, gumroad_fee_cents, creators_with_sales, gumroad_discover_price_cents, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: imported_customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.imported_customers (id, email, purchase_date, link_id, importing_user_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: installment_events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.installment_events (id, event_id, installment_id) FROM stdin;
\.


--
-- Data for Name: installment_rules; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.installment_rules (id, installment_id, delayed_delivery_time, to_be_published_at, version, deleted_at, created_at, updated_at, time_period) FROM stdin;
\.


--
-- Data for Name: installments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.installments (id, link_id, message, url, created_at, updated_at, name, published_at, deleted_at, flags, seller_id, installment_type, json_data, customer_count, workflow_id, call_to_action_text, call_to_action_url, cover_image_url, base_variant_id, slug, installment_events_count) FROM stdin;
\.


--
-- Data for Name: integrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.integrations (id, api_key, json_data, created_at, updated_at, flags, type) FROM stdin;
\.


--
-- Data for Name: invites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.invites (id, sender_id, receiver_email, receiver_id, invite_state, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: large_sellers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.large_sellers (id, user_id, sales_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: last_read_community_chat_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.last_read_community_chat_messages (id, user_id, community_id, community_chat_message_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: legacy_permalinks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.legacy_permalinks (id, permalink, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: licenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.licenses (id, link_id, purchase_id, serial, trial_expires_at, uses, json_data, deleted_at, flags, created_at, updated_at, imported_customer_id, disabled_at) FROM stdin;
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.links (id, user_id, name, unique_permalink, preview_url, description, purchase_type, created_at, updated_at, purchase_disabled_at, deleted_at, price_cents, price_currency_type, customizable_price, max_purchase_count, bad_card_counter, require_shipping, last_partner_sync, preview_oembed, showcaseable, custom_receipt, custom_filetype, filetype, filegroup, size, bitrate, framerate, pagelength, duration, width, height, custom_permalink, common_color, suggested_price_cents, banned_at, risk_score, risk_score_updated_at, draft, flags, subscription_duration, json_data, external_mapping_id, affiliate_application_id, rental_price_cents, duration_in_months, migrated_to_tiered_pricing_at, free_trial_duration_unit, free_trial_duration_amount, content_updated_at, taxonomy_id, native_type, discover_fee_per_thousand) FROM stdin;
2	8	Тестовий цифровий продукт	y	\N	Це тестовий цифровий продукт для перевірки системи	0	2025-08-27 15:39:51.459407	2025-08-27 15:39:51.459407	\N	\N	2500	uah	\N	\N	0	f	\N	\N	f	\N	\N	link	url	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	0	\N	{}	\N	\N	\N	\N	\N	\N	\N	\N	\N	digital	300
3	8	Тестовий фізичний товар	o	\N	Це тестовий фізичний товар з доставкою	0	2025-08-27 15:39:52.087866	2025-08-27 15:39:52.087866	\N	\N	5000	uah	\N	\N	0	t	\N	\N	f	\N	\N	link	url	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	128	\N	{}	\N	\N	\N	\N	\N	\N	\N	\N	\N	physical	300
4	8	Test Product Simple	z	\N	Simple test product	0	2025-08-27 16:46:09.707538	2025-08-27 16:46:09.707538	\N	\N	2500	uah	\N	\N	0	f	\N	\N	f	\N	\N	link	url	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	0	\N	{}	\N	\N	\N	\N	\N	\N	\N	\N	\N	digital	300
5	4	Цифровий товар основного користувача	r	\N	Тестовий цифровий товар	0	2025-08-27 17:03:49.639621	2025-08-27 17:03:49.639621	\N	\N	5000	uah	\N	\N	0	f	\N	\N	f	\N	\N	link	url	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	0	\N	{}	\N	\N	\N	\N	\N	\N	\N	\N	\N	digital	300
\.


--
-- Data for Name: media_locations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.media_locations (id, product_file_id, url_redirect_id, purchase_id, product_id, consumed_at, platform, location, content_length, unit, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: merchant_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.merchant_accounts (id, user_id, acquirer_id, acquirer_merchant_id, charge_processor_id, charge_processor_merchant_id, json_data, created_at, updated_at, deleted_at, charge_processor_verified_at, country, currency, charge_processor_deleted_at, charge_processor_alive_at) FROM stdin;
\.


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes) FROM stdin;
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes) FROM stdin;
\.


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oauth_applications (id, name, uid, secret, redirect_uri, created_at, updated_at, owner_id, owner_type, affiliate_basis_points, deleted_at, scopes, confidential) FROM stdin;
\.


--
-- Data for Name: offer_codes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.offer_codes (id, link_id, name, amount_cents, max_purchase_count, deleted_at, created_at, updated_at, amount_percentage, user_id, currency_type, code, universal, valid_at, expires_at, minimum_quantity, duration_in_months, minimum_amount_cents, flags) FROM stdin;
\.


--
-- Data for Name: offer_codes_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.offer_codes_products (id, offer_code_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_purchases (id, order_id, purchase_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, purchaser_id, created_at, updated_at, flags, review_reminder_scheduled_at) FROM stdin;
\.


--
-- Data for Name: payment_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payment_options (id, subscription_id, price_id, created_at, updated_at, deleted_at, flags, product_installment_plan_id) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payments (id, user_id, state, created_at, updated_at, txn_id, processor_fee_cents, correlation_id, processor, amount_cents, payment_address, payout_period_end_date, bank_account_id, amount_cents_in_local_currency, stripe_connect_account_id, stripe_transfer_id, stripe_internal_transfer_id, currency, flags, json_data, failure_reason, processor_reversing_payout_id) FROM stdin;
\.


--
-- Data for Name: payments_balances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.payments_balances (id, payment_id, balance_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_email_blasts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.post_email_blasts (id, post_id, seller_id, requested_at, started_at, first_email_delivered_at, last_email_delivered_at, delivery_count, created_at, updated_at, completed_at) FROM stdin;
\.


--
-- Data for Name: preorder_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.preorder_links (id, link_id, state, release_at, url, custom_filetype, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: preorders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.preorders (id, preorder_link_id, seller_id, purchaser_id, state, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prices (id, link_id, price_cents, currency, recurrence, created_at, updated_at, deleted_at, flags, variant_id, suggested_price_cents) FROM stdin;
1	1	5000	uah	\N	2025-08-27 12:52:00.419046	2025-08-27 12:52:00.419046	\N	0	\N	\N
2	2	2500	uah	\N	2025-08-27 15:39:51.476022	2025-08-27 15:39:51.476022	\N	0	\N	\N
3	3	5000	uah	\N	2025-08-27 15:39:52.091162	2025-08-27 15:39:52.091162	\N	0	\N	\N
4	4	2500	uah	\N	2025-08-27 16:46:09.729535	2025-08-27 16:46:09.729535	\N	0	\N	\N
5	5	5000	uah	\N	2025-08-27 17:03:49.658738	2025-08-27 17:03:49.658738	\N	0	\N	\N
\.


--
-- Data for Name: processor_payment_intents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.processor_payment_intents (id, purchase_id, intent_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_cached_values; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_cached_values (id, product_id, expired, successful_sales_count, remaining_for_sale_count, monthly_recurring_revenue, revenue_pending, created_at, updated_at, total_usd_cents) FROM stdin;
\.


--
-- Data for Name: product_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_files (id, link_id, url, filetype, filegroup, size, bitrate, framerate, pagelength, duration, width, height, flags, json_data, deleted_at, created_at, updated_at, "position", installment_id, display_name, deleted_from_cdn_at, description, folder_id, stampable_pdf) FROM stdin;
\.


--
-- Data for Name: product_files_archives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_files_archives (id, deleted_at, link_id, installment_id, product_files_archive_state, created_at, updated_at, url, deleted_from_cdn_at, variant_id, digest, folder_id) FROM stdin;
\.


--
-- Data for Name: product_files_files_archives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_files_files_archives (id, product_file_id, product_files_archive_id) FROM stdin;
\.


--
-- Data for Name: product_folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_folders (id, product_id, name, "position", created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: product_installment_plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_installment_plans (id, link_id, number_of_installments, recurrence, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: product_integrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_integrations (id, product_id, integration_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_review_responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_review_responses (id, user_id, product_review_id, message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_review_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_review_stats (id, link_id, reviews_count, average_rating, ratings_of_one_count, ratings_of_two_count, ratings_of_three_count, ratings_of_four_count, ratings_of_five_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_review_videos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_review_videos (id, product_review_id, approval_status, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_reviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_reviews (id, purchase_id, rating, created_at, updated_at, link_id, message, has_message, deleted_at) FROM stdin;
\.


--
-- Data for Name: product_taggings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_taggings (id, tag_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: public_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.public_files (id, seller_id, resource_type, resource_id, public_id, display_name, original_file_name, file_type, file_group, deleted_at, scheduled_for_deletion_at, json_data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: purchase_custom_field_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_custom_field_files (id, url, purchase_custom_field_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: purchase_custom_fields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_custom_fields (id, purchase_id, field_type, name, value, created_at, updated_at, bundle_product_id, custom_field_id, flags) FROM stdin;
\.


--
-- Data for Name: purchase_early_fraud_warnings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_early_fraud_warnings (id, purchase_id, processor_id, dispute_id, refund_id, fraud_type, actionable, charge_risk_level, processor_created_at, resolution, resolved_at, created_at, updated_at, resolution_message, charge_id) FROM stdin;
\.


--
-- Data for Name: purchase_integrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_integrations (id, purchase_id, integration_id, deleted_at, discord_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: purchase_offer_code_discounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_offer_code_discounts (id, purchase_id, offer_code_id, offer_code_amount, offer_code_is_percent, pre_discount_minimum_price_cents, created_at, updated_at, duration_in_months) FROM stdin;
\.


--
-- Data for Name: purchase_refund_policies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_refund_policies (id, purchase_id, title, fine_print, created_at, updated_at, max_refund_period_in_days) FROM stdin;
\.


--
-- Data for Name: purchase_sales_tax_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_sales_tax_infos (id, purchase_id, elected_country_code, card_country_code, ip_country_code, country_code, postal_code, ip_address, business_vat_id, state_code) FROM stdin;
\.


--
-- Data for Name: purchase_taxjar_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_taxjar_infos (id, purchase_id, combined_tax_rate, county_tax_rate, city_tax_rate, state_tax_rate, jurisdiction_state, jurisdiction_county, jurisdiction_city, created_at, updated_at, gst_tax_rate, pst_tax_rate, qst_tax_rate) FROM stdin;
\.


--
-- Data for Name: purchase_wallet_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_wallet_types (id, purchase_id, wallet_type) FROM stdin;
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchases (id, seller_id, created_at, updated_at, fee_cents, link_id, email, price_cents, displayed_price_cents, displayed_price_currency_type, rate_converted_to_usd, street_address, city, state, zip_code, country, full_name, credit_card_id, purchaser_id, purchaser_type, session_id, ip_address, is_mobile, stripe_refunded, stripe_transaction_id, stripe_fingerprint, stripe_card_id, can_contact, referrer, stripe_status, variants, chargeback_date, webhook_failed, failed, card_type, card_visual, purchase_state, processor_fee_cents, succeeded_at, card_country, stripe_error_code, browser_guid, error_code, card_bin, custom_fields, ip_country, ip_state, purchase_success_balance_id, purchase_chargeback_balance_id, purchase_refund_balance_id, flags, offer_code_id, subscription_id, preorder_id, card_expiry_month, card_expiry_year, tax_cents, affiliate_credit_cents, credit_card_zipcode, json_data, card_data_handling_mode, charge_processor_id, total_transaction_cents, gumroad_tax_cents, zip_tax_rate_id, quantity, merchant_account_id, shipping_cents, affiliate_id, processor_fee_cents_currency, stripe_partially_refunded, paypal_order_id, rental_expired, processor_payment_intent_id, processor_setup_intent_id, price_id, recommended_by, deleted_at) FROM stdin;
\.


--
-- Data for Name: purchasing_power_parity_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchasing_power_parity_infos (id, purchase_id, factor, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: recommended_purchase_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recommended_purchase_infos (id, created_at, updated_at, purchase_id, recommended_link_id, recommended_by_link_id, recommendation_type, flags, discover_fee_per_thousand, recommender_model_name) FROM stdin;
\.


--
-- Data for Name: recurring_services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recurring_services (id, created_at, updated_at, user_id, type, price_cents, recurrence, failed_at, cancelled_at, state, json_data) FROM stdin;
\.


--
-- Data for Name: refund_policies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.refund_policies (id, seller_id, product_id, title, fine_print, created_at, updated_at, max_refund_period_in_days) FROM stdin;
2	8	\N	\N	\N	2025-08-27 15:35:59.811781	2025-08-27 15:35:59.811781	30
\.


--
-- Data for Name: refunds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.refunds (id, amount_cents, purchase_id, created_at, updated_at, refunding_user_id, creator_tax_cents, gumroad_tax_cents, total_transaction_cents, json_data, link_id, status, processor_refund_id, fee_cents, flags, seller_id) FROM stdin;
\.


--
-- Data for Name: resource_subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resource_subscriptions (id, oauth_application_id, user_id, resource_name, post_url, created_at, updated_at, deleted_at, content_type) FROM stdin;
\.


--
-- Data for Name: rich_contents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rich_contents (id, entity_id, entity_type, description, created_at, updated_at, deleted_at, title, "position") FROM stdin;
\.


--
-- Data for Name: sales_export_chunks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_export_chunks (id, export_id, purchase_ids, custom_fields, purchases_data, processed, revision, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sales_exports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_exports (id, recipient_id, query, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sales_related_products_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_related_products_infos (id, smaller_product_id, larger_product_id, sales_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20111107215928
20111109005838
20111109011928
20111109220139
20111109221003
20111109221929
20111109223341
20111109225157
20111110202009
20111110203904
20111116011538
20111116194231
20111118195144
20111121221801
20111122002403
20111122005722
20111122005846
20111122014046
20111123010637
20111201183301
20111201185846
20111206214227
20111207004122
20111207011513
20111207011813
20111207025721
20111208020626
20111208220204
20111209003710
20111209004152
20111212220615
20111212221158
20111212222310
20111213003155
20111213214129
20111220181954
20111220191412
20111221011759
20120111204623
20120112220152
20120112224613
20120112232019
20120113000140
20120113003204
20120113223706
20120113231359
20120113232255
20120117000944
20120124192926
20120124233751
20120125204636
20120211163119
20120216022958
20120225012853
20120225190810
20120226203341
20120226203405
20120226203453
20120226203517
20120226203552
20120226213809
20120226234156
20120227011227
20120305005646
20120305024409
20120305044807
20120316181713
20120322233754
20120323005150
20120323213708
20120328014142
20120330210442
20120330211428
20120411042752
20120411184339
20120415221152
20120415223410
20120420214602
20120423212135
20120424204521
20120425190921
20120426001332
20120426001450
20120426001920
20120426001944
20120426222422
20120426222453
20120426222532
20120426222619
20120430183904
20120430184136
20120430184313
20120430184408
20120501221923
20120501232218
20120501233604
20120502230858
20120503214002
20120504222635
20120508233443
20120510192114
20120510202146
20120516185425
20120516194950
20120516222956
20120516223533
20120516231444
20120517230515
20120518183456
20120518183521
20120521221732
20120521221756
20120522050227
20120522211546
20120524014628
20120526043012
20120528233016
20120528234055
20120528234113
20120528234130
20120528234200
20120528234240
20120530050147
20120531013446
20120531014554
20120531054131
20120531180320
20120531212313
20120601004004
20120601235856
20120605011017
20120605012619
20120607044009
20120607044631
20120611194653
20120612012558
20120614000343
20120614180000
20120614215205
20120614220545
20120615195934
20120615200410
20120615230235
20120620212331
20120620233206
20120627004427
20120627225210
20120628181932
20120628221758
20120702195405
20120703005223
20120703060331
20120703062941
20120703181959
20120706001847
20120706001915
20120706013215
20120710062458
20120711045354
20120713193957
20120718174747
20120718175028
20120718175134
20120718175207
20120718175247
20120718175328
20120718175414
20120718175453
20120718175531
20120720235047
20120725030749
20120725195558
20120731045716
20120803001308
20120803235629
20120813210705
20120813212650
20120813222525
20120814044454
20120815194340
20120816014041
20120816213321
20120816223942
20120817004932
20120817014544
20120820214717
20120821011734
20120827162606
20120830210601
20120911185928
20120911235443
20120912011119
20120912185136
20120913183233
20120914010510
20120914215239
20120917232121
20120919234302
20120920210353
20120921000018
20120921003128
20120921184518
20120921190155
20120921224506
20120922005048
20120924203422
20120927010244
20120927071206
20120927080346
20120928012423
20120928045005
20120928211939
20120928230933
20121003034726
20121003035127
20121003035232
20121003035320
20121004173944
20121004174019
20121004174142
20121004175839
20121004222417
20121004223825
20121005003936
20121005010456
20121005041429
20121009015308
20121011224111
20121016054654
20121018032034
20121018174416
20121018221916
20121018222048
20121018222140
20121018222852
20121019004516
20121019231317
20121025203207
20121025212302
20121029235025
20121029235109
20121030215656
20121031180805
20121105203548
20121106231436
20121107004632
20121108005438
20121110000812
20121113061128
20121113194639
20121113220300
20121115020045
20121115033310
20121115033456
20121115040149
20121115040801
20121115041415
20121115041918
20121115042531
20121115184907
20121115185246
20121115192149
20121115192157
20121120001642
20121127215553
20121128061117
20121128065528
20121129184816
20121129193009
20121130222908
20121203174115
20121203174722
20121206083254
20121211225739
20121212164255
20121221190001
20121227045239
20121231043404
20130104072633
20130105013235
20130108210059
20130109001636
20130109002024
20130109002248
20130109002305
20130110043951
20130114225338
20130116020240
20130117014416
20130117015306
20130117015615
20130119005540
20130124005549
20130124024615
20130124185954
20130125190448
20130129053932
20130129062643
20130131044353
20130205235701
20130206224735
20130209224715
20130211200121
20130211200149
20130211200245
20130211200402
20130218211025
20130218221821
20130219014757
20130219215825
20130220170734
20130222060954
20130223002446
20130224224840
20130226051039
20130227221245
20130228225328
20130301205826
20130304235024
20130315002301
20130322184037
20130324192344
20130331010919
20130409210205
20130409211227
20130409211234
20130410034200
20130410194734
20130415204908
20130417235936
20130419202453
20130419202454
20130419202455
20130419202456
20130419202457
20130428022915
20130430222410
20130508030638
20130513235232
20130514223138
20130515005212
20130516174229
20130517003958
20130522000413
20130524233006
20130527194229
20130529185015
20130531172854
20130531183449
20130531212242
20130531220410
20130531220647
20130531221758
20130531231743
20130607185059
20130610232658
20130612205213
20130612230657
20130618031038
20130618031049
20130625000244
20130625001834
20130626020421
20130628203022
20130717181612
20130717234545
20130718052437
20130718214055
20130719205215
20130722063333
20130722195210
20130730185223
20130731034033
20130801203354
20130904230941
20130910180507
20130920180213
20130924001509
20130930181714
20131008193413
20131008204429
20131010184403
20131016074628
20131016075111
20131023021154
20131023210534
20131025214853
20131104184424
20131105221317
20131114070727
20131115164302
20131115164420
20131204033717
20131205023523
20131209172904
20131209234409
20140107031233
20140117210119
20140120021811
20140130003625
20140204042121
20140210055049
20140212002303
20140218061738
20140311222528
20140320192121
20140321232012
20140326164256
20140328203457
20140401180437
20140407214534
20140507025758
20140507034709
20140526175953
20140528153153
20140528212240
20140528235035
20140604015423
20140605195555
20140610022228
20140619000635
20140624205931
20140624210443
20140624211118
20140630203638
20140703212413
20140707165710
20140707165730
20140715225046
20140717232212
20140718003800
20140722233234
20140724201402
20140725195455
20140730235200
20140807201229
20140822200030
20140902220133
20140910202429
20140911204600
20140917180234
20141007071105
20141008215224
20141010065413
20141028183040
20141031182759
20141120190256
20141122174615
20141125013556
20141125102727
20141203200306
20141208215925
20141215091009
20141218034833
20141218034906
20141218034930
20150106182647
20150114194817
20150115000000
20150119235023
20150119235522
20150128014826
20150128162110
20150128193618
20150128210138
20150129045401
20150202000000
20150203184911
20150206022753
20150211000000
20150220195633
20150309165638
20150309165827
20150310211530
20150316205500
20150316206000
20150317214940
20150322212519
20150329165612
20150330045333
20150330045349
20150331074645
20150402215254
20150416000000
20150416052056
20150429175645
20150430233010
20150501185757
20150504050000
20150505211933
20150506234022
20150513164427
20150513231714
20150514183650
20150519180244
20150520185631
20150520200000
20150520200001
20150525200251
20150527232652
20150528000824
20150528180752
20150601000000
20150605000000
20150608000000
20150608001919
20150615223017
20150616174834
20150616175837
20150616225303
20150617000000
20150619185755
20150623223829
20150623224847
20150624000000
20150625100000
20150706100000
20150709181910
20150709201644
20150721004604
20150723011703
20150728160357
20150728164700
20150729183520
20150729222603
20150729324908
20150730230100
20150804000000
20150804000001
20150804000002
20150805170243
20150810000000
20150812000000
20150814212030
20150818004412
20150818073723
20150820001818
20150909000000
20150909000001
20150913230710
20150915174708
20150916014404
20150917174836
20150921173816
20150922003020
20150928999999
20150929000001
20150929000002
20151001225321
20151005000000
20151007000000
20151007212137
20151008033909
20151008034224
20151013211002
20151014232700
20151015204754
20151016000000
20151016222520
20151016233313
20151018081606
20151019000000
20151020214443
20151021013944
20151022194039
20151027195941
20151028153410
20151029185746
20151030170023
20151102000000
20151104000000
20151105000003
20151109202709
20151111000001
20151125215405
20151128025657
20151203173638
20151207191059
20151208102051
20151208202555
20151219024411
20151221210133
20160105231848
20160108192913
20160120205707
20170125203547
20170222073047
20170405111708
20170417140253
20170418052305
20170511105947
20170511111723
20170718061532
20171115105042
20171130080044
20171218105118
20180322091933
20180530162002
20180627111725
20181009173358
20181009174700
20181009184808
20181026094910
20181031091727
20181120060941
20181126155352
20181126170410
20181126172157
20181207212703
20181218072620
20190110094142
20190112220320
20190127011053
20190127012512
20190307043559
20190318023359
20190402003310
20190413210021
20190425220322
20190427161332
20190427212700
20190504212349
20190513150807
20190520204751
20190521161425
20190528172432
20190528190659
20190601144211
20190601144310
20190603183838
20190608225729
20190613024006
20190613024033
20190715141316
20190724010533
20190725194234
20190803211425
20190808124455
20190906144207
20190906144208
20190906151752
20190910183250
20190910183443
20190910183718
20190911184143
20190916230459
20190930000937
20191006031318
20191006034047
20191014230105
20191014233812
20191025150241
20191031095419
20191031114536
20191101163724
20191101194142
20191102103149
20191105224621
20191119061033
20191121171504
20191122205121
20191126120036
20191127061350
20191201174402
20200110072114
20200111113222
20200203195840
20200226180434
20200330184434
20200512043527
20200513124526
20200514132135
20200514132253
20200525223103
20200615140849
20200618215815
20200620103947
20200713002040
20200721210221
20200726140318
20200814224423
20200821142223
20200830200804
20200904153310
20200921213213
20200927050534
20201001091435
20201008081331
20201010080412
20201017221238
20201023151726
20201024165507
20201026060716
20201103221330
20201110060001
20201118135156
20201203030128
20201207034544
20201207040118
20201214172042
20201221053736
20201221103409
20201221121547
20201221130000
20201223160647
20201228043940
20210101171009
20210103203438
20210106033416
20210106035128
20210121062551
20210215094712
20210215094713
20210219002017
20210224145735
20210225132913
20210303113039
20210306103539
20210323175710
20210324121415
20210402124642
20210405121212
20210405195451
20210413120934
20210426172859
20210502153119
20210502193415
20210502195458
20210503141445
20210505194727
20210510195127
20210511062447
20210511080203
20210519182305
20210520070731
20210524125845
20210529190819
20210530215102
20210603164813
20210605062909
20210609090425
20210611004441
20210618101147
20210618181618
20210620233525
20210621081510
20210622061943
20210622064046
20210623231346
20210624025201
20210624093649
20210624101100
20210624104755
20210625121544
20210713094050
20210716062630
20210720171856
20210722183722
20210723152944
20210723170128
20210725083553
20210728154434
20210728192116
20210804093658
20210811063931
20210811141027
20210811155201
20210811155205
20210819034447
20210824191719
20210831170318
20210901054745
20210902085559
20210910115450
20210920213746
20210921040636
20210922054233
20210923103544
20210924172723
20210927134712
20211006125152
20211008190755
20211013114048
20211020222413
20211023222329
20211110051320
20211115120503
20211129142053
20211213122919
20211214112715
20211221202333
20211222010343
20220103095839
20220110203052
20220201101203
20220201231036
20220210162200
20220211203706
20220218020712
20220222171855
20220222192027
20220223153011
20220302222428
20220303121239
20220303123204
20220308192852
20220318072611
20220318214047
20220322122601
20220322124013
20220329131939
20220413003135
20220415204825
20220419225846
20220420191548
20220420204744
20220421141928
20220429180649
20220429193757
20220430002128
20220430143223
20220503031619
20220511094715
20220513062810
20220516205519
20220518034006
20220608012107
20220620150418
20220626140322
20220712175710
20220723200147
20220726011222
20220729201912
20220830182631
20220907151951
20220907152005
20220913190940
20220921065100
20221003082314
20221011114604
20221012115921
20221017161900
20221019103316
20221103083945
20221107074039
20221107130525
20221121182709
20221125144458
20221128145639
20230104184824
20230116193007
20230120075219
20230121043012
20230123055438
20230125154843
20230125154851
20230125154900
20230125154905
20230125164938
20230126145540
20230127125845
20230203130729
20230211144911
20230216144650
20230227210525
20230302132622
20230303073007
20230306165304
20230310211434
20230316123640
20230317210227
20230320184956
20230320185003
20230322212701
20230327174823
20230330021302
20230404170250
20230404182723
20230404183153
20230404185041
20230411194853
20230412221512
20230412221903
20230412221958
20230414060233
20230420155753
20230420160357
20230502015838
20230502051135
20230503202309
20230504184554
20230506201836
20230509105457
20230510160658
20230512132813
20230516003056
20230517152234
20230519055629
20230523203442
20230524193841
20230530230438
20230602014951
20230605234115
20230606002249
20230607141143
20230612153224
20230612224821
20230616124032
20230617003555
20230622131832
20230622180003
20230622201742
20230629014321
20230706124923
20230707223804
20230708062915
20230709185752
20230711202046
20230716005121
20230719131833
20230719132348
20230719161044
20230720171507
20230724164038
20230724184252
20230803010349
20230803151640
20230803151649
20230821194317
20230825141116
20230828063848
20230903162345
20230905142104
20230912033854
20230916144954
20230926133822
20231002212026
20231002214315
20231003201734
20231003202428
20231011032248
20231016051957
20231017001012
20231021143022
20231025113632
20231025175124
20231031032827
20231031174049
20231101082733
20231101092721
20231114174034
20231115001459
20231117091724
20231117094332
20231119164304
20231119164327
20231119173129
20231119190039
20231119190051
20231120184536
20231120215114
20231123103858
20231123113306
20231128083139
20231128094242
20231205052835
20231205052856
20231217195245
20231219083048
20231219084500
20231228165212
20231228165738
20231228200056
20231231000023
20240115190703
20240121160328
20240122125452
20240125071935
20240126182800
20240127222215
20240131143308
20240203193839
20240206105114
20240206111225
20240206135412
20240206145545
20240208204727
20240214064403
20240218085253
20240218091437
20240222000604
20240222233850
20240227023200
20240228162247
20240301123315
20240301123339
20240305161742
20240319164216
20240323103102
20240324013211
20240329142630
20240402134432
20240408073222
20240409134857
20240409154638
20240410225020
20240422093212
20240423133545
20240423185410
20240423190023
20240425095407
20240425113841
20240430134831
20240502183124
20240503060350
20240507135935
20240507141925
20240512134634
20240528131710
20240528200957
20240528201330
20240609161156
20240613121849
20240615052751
20240616210250
20240617133026
20240619073817
20240620200757
20240626144207
20240626150102
20240626160241
20240703095722
20240706183408
20240711191508
20240712150014
20240716153656
20240717232811
20240724013512
20240725140931
20240725195151
20240726164920
20240730154256
20240802152405
20240803055758
20240803162416
20240804195838
20240805153028
20240808230004
20240816035957
20240819015410
20240823204443
20240826185245
20240830231925
20240918134011
20240923045553
20240926112759
20240928021005
20240928021009
20240929142017
20241008140243
20241014141423
20241021182309
20241021212931
20241031173126
20241102102125
20241126194353
20241206205100
20241209191839
20241215185121
20250101092549
20250103124729
20250103130628
20250103131741
20250103145344
20250103191249
20250115144823
20250116082729
20250120143213
20250122100830
20250124140005
20250131062035
20250210153633
20250211173413
20250213174713
20250217220151
20250217233404
20250225090016
20250225091231
20250225092546
20250225094113
20250317100111
20250317105857
20250328062708
20250330065025
20250331001118
20250331004347
20250402175205
20250406055017
20250416203854
20250425212934
\.


--
-- Data for Name: self_service_affiliate_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.self_service_affiliate_products (id, seller_id, product_id, enabled, affiliate_basis_points, destination_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: seller_profile_sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.seller_profile_sections (id, seller_id, header, created_at, updated_at, flags, json_data, type, product_id) FROM stdin;
\.


--
-- Data for Name: seller_profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.seller_profiles (id, seller_id, highlight_color, background_color, font, created_at, updated_at, json_data) FROM stdin;
\.


--
-- Data for Name: sent_abandoned_cart_emails; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sent_abandoned_cart_emails (id, cart_id, installment_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sent_email_infos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sent_email_infos (id, key, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sent_post_emails; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sent_post_emails (id, post_id, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: service_charges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_charges (id, created_at, updated_at, user_id, recurring_service_id, charge_cents, charge_cents_currency, state, succeeded_at, credit_card_id, card_expiry_month, card_expiry_year, card_data_handling_mode, card_bin, card_type, card_country, card_zip_code, card_visual, charge_processor_id, charge_processor_fee_cents, charge_processor_fee_cents_currency, charge_processor_transaction_id, charge_processor_fingerprint, charge_processor_card_id, charge_processor_status, charge_processor_error_code, charge_processor_refunded, chargeback_date, json_data, error_code, merchant_account_id, browser_guid, ip_address, ip_country, ip_state, session_id, flags, discount_code, processor_payment_intent_id) FROM stdin;
\.


--
-- Data for Name: shipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shipments (id, purchase_id, ship_state, shipped_at, created_at, updated_at, tracking_number, carrier, tracking_url) FROM stdin;
\.


--
-- Data for Name: shipping_destinations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shipping_destinations (id, link_id, user_id, country_code, one_item_rate_cents, multiple_items_rate_cents, flags, json_data, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: signup_events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.signup_events (id, visit_id, ip_address, user_id, created_at, updated_at, referrer, parent_referrer, language, browser, is_mobile, email, view_url, fingerprint, ip_country, ip_longitude, ip_latitude, is_modal, browser_fingerprint, browser_plugins, browser_guid, referrer_domain, ip_state, active_test_path_assignments, event_name, link_id, purchase_id, price_cents, credit_card_id, card_type, card_visual, purchase_state, billing_zip, chargeback, refunded) FROM stdin;
\.


--
-- Data for Name: skus_variants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.skus_variants (id, variant_id, sku_id) FROM stdin;
\.


--
-- Data for Name: staff_picked_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.staff_picked_products (id, product_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: stamped_pdfs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stamped_pdfs (id, url_redirect_id, product_file_id, url, created_at, updated_at, deleted_at, deleted_from_cdn_at) FROM stdin;
\.


--
-- Data for Name: stripe_apple_pay_domains; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stripe_apple_pay_domains (id, user_id, domain, stripe_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subscription_events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subscription_events (id, subscription_id, event_type, occurred_at, created_at, updated_at, seller_id) FROM stdin;
\.


--
-- Data for Name: subscription_plan_changes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subscription_plan_changes (id, subscription_id, base_variant_id, recurrence, perceived_price_cents, deleted_at, created_at, updated_at, quantity, flags, effective_on, notified_subscriber_at) FROM stdin;
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subscriptions (id, link_id, user_id, cancelled_at, failed_at, created_at, updated_at, flags, user_requested_cancellation_at, charge_occurrence_count, ended_at, last_payment_option_id, credit_card_id, deactivated_at, free_trial_ends_at, seller_id, token, token_expires_at) FROM stdin;
\.


--
-- Data for Name: subtitle_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subtitle_files (id, url, language, created_at, updated_at, product_file_id, deleted_at, size, deleted_from_cdn_at) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, name, created_at, updated_at, humanized_name, flagged_at) FROM stdin;
\.


--
-- Data for Name: taxonomies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taxonomies (id, parent_id, slug) FROM stdin;
\.


--
-- Data for Name: taxonomy_hierarchies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taxonomy_hierarchies (ancestor_id, descendant_id, generations) FROM stdin;
\.


--
-- Data for Name: taxonomy_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taxonomy_stats (id, taxonomy_id, creators_count, products_count, sales_count, created_at, updated_at, recent_sales_count) FROM stdin;
\.


--
-- Data for Name: team_invitations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.team_invitations (id, seller_id, email, role, created_at, updated_at, expires_at, accepted_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: team_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.team_memberships (id, seller_id, user_id, role, last_accessed_at, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: third_party_analytics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.third_party_analytics (id, user_id, link_id, analytics_code, deleted_at, created_at, updated_at, name, location) FROM stdin;
\.


--
-- Data for Name: thumbnails; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thumbnails (id, product_id, deleted_at, guid, created_at, updated_at, unsplash_url) FROM stdin;
\.


--
-- Data for Name: tips; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tips (id, purchase_id, value_cents, created_at, updated_at, value_usd_cents) FROM stdin;
\.


--
-- Data for Name: top_sellers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.top_sellers (id, user_id, sales_usd, sales_count, rank, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tos_agreements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tos_agreements (id, user_id, ip, created_at) FROM stdin;
\.


--
-- Data for Name: transcoded_videos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transcoded_videos (id, link_id, original_video_key, transcoded_video_key, job_id, state, created_at, updated_at, product_file_id, flags, deleted_from_cdn_at, deleted_at, last_accessed_at, streamable_type, streamable_id) FROM stdin;
\.


--
-- Data for Name: upsell_purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upsell_purchases (id, upsell_id, purchase_id, selected_product_id, upsell_variant_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: upsell_variants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upsell_variants (id, upsell_id, selected_variant_id, offered_variant_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: upsells; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upsells (id, seller_id, product_id, variant_id, offer_code_id, name, cross_sell, text, description, deleted_at, created_at, updated_at, universal, flags) FROM stdin;
\.


--
-- Data for Name: upsells_selected_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upsells_selected_products (id, upsell_id, selected_product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: url_redirects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.url_redirects (id, uses, expires_at, created_at, updated_at, purchase_id, token, link_id, flags, installment_id, subscription_id, preorder_id, imported_customer_id, rental_first_viewed_at) FROM stdin;
\.


--
-- Data for Name: user_compliance_info; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_compliance_info (id, user_id, full_name, street_address, city, state, zip_code, country, telephone_number, vertical, is_business, has_sold_before, individual_tax_id, json_data, flags, created_at, updated_at, business_name, business_street_address, business_city, business_state, business_zip_code, business_country, business_type, business_tax_id, birthday, deleted_at, dba, verticals, first_name, last_name, stripe_identity_document_id) FROM stdin;
\.


--
-- Data for Name: user_compliance_info_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_compliance_info_requests (id, created_at, updated_at, user_id, field_needed, due_at, state, provided_at, json_data, flags) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, google_uid, username, user_risk_state, external_id, name, provider, confirmed_at, confirmation_token, confirmation_sent_at, unconfirmed_email, tier_state, flags, locale, timezone, currency_type, recommendation_type, facebook_meta_tag, google_analytics_id, support_email, bio, profile_picture_url, country, verified, payment_notification, facebook_uid, twitter_user_id, twitter_handle, twitter_oauth_token, twitter_oauth_secret, facebook_id, purchasing_power_parity_limit, kindle_email, payment_address, deleted_at, account_created_ip, notification_endpoint, json_data, tos_violation_reason, google_analytics_domains, facebook_pixel_id, split_payment_by_cents, last_active_sessions_invalidated_at, otp_secret_key, orientation_priority_tag, facebook_access_token, manage_pages, banned_at, weekly_notification, state, city, zip_code, street_address) FROM stdin;
3	test@example.com	$2a$11$aDbFr03VvZ7OPrbycz.JnezMQZATV5ESCRE/ihDnOmi32GGjUzeBG	\N	\N	\N	0	\N	\N	\N	\N	2025-08-26 07:10:57.112256	2025-08-26 07:10:57.112256	\N	\N	not_reviewed	8899095974529	\N	\N	\N	ZpAdZyDwFfguwbNMY7-d	2025-08-26 07:10:57.112584	\N	0	22123376574785	en	Pacific Time (US & Canada)	usd	own_products	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	\N	J7BVDRCF672MRHQCC727LTY2E4EU6GJZ	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	test_final@example.com	$2a$11$ffqGpHFR5yNHbOvvzJv.VOh6BMTXWa6oafDca7RZnleYdrgPrGD0C	\N	\N	\N	0	\N	\N	\N	\N	2025-08-26 12:20:38.027479	2025-08-26 12:20:38.027479	\N	\N	not_reviewed	7968955700359	\N	\N	\N	vjx82xu8Etd4CtK_xdT9	2025-08-26 12:20:38.035353	\N	0	22123376574785	en	Pacific Time (US & Canada)	usd	own_products	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	\N	JD4ARAKW65EJTEROKZHFRXSCXQGKJPKG	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	final_test@example.com	$2a$11$3NPFyrk/l8Opg2hCCAWe7uHEQHs23oovIBncpy3.XCGGiw9lGs09C	\N	\N	\N	0	\N	\N	\N	\N	2025-08-26 12:24:53.887594	2025-08-26 12:24:53.887594	\N	\N	not_reviewed	8634327479571	Final Test User	\N	\N	JymJWcXunjzHF83z4mEA	2025-08-26 12:24:53.887833	\N	0	22123376574785	en	Pacific Time (US & Canada)	usd	own_products	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	\N	TGLMKX5WJTRBS24LWUGDHYQ7Z6LYUHNT	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	miroshnichenko.lalita@gmail.com	$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK	\N	\N	2025-08-27 14:16:01.156384	3	2025-08-26 12:10:08.653646	2025-08-26 07:54:27.92619	::1	::1	2025-08-26 07:12:41.198086	2025-08-27 14:16:01.159966	106384220000990454010	\N	not_reviewed	1418591517294	Лалита Мирошниченко	google_oauth2	2025-08-26 07:12:41.533041	\N	\N	\N	0	22123376836929	uk	Pacific Time (US & Canada)	uah	own_products	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	\N	HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	test_seller@example.com	$2a$11$vzj2kSI79TEIV4uWBYdZAO7THkZE265NyJXzcuaP1m118MaIWGlUK	\N	\N	\N	0	\N	\N	\N	\N	2025-08-27 15:35:59.664609	2025-08-27 15:35:59.664609	\N	\N	not_reviewed	9238446862723	Test Seller	\N	\N	duhrkVbR5GNGJ7M5iXbo	2025-08-27 15:35:59.66494	\N	0	22123376574785	uk	Pacific Time (US & Canada)	uah	own_products	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	\N	V5FQBD4HFQOSMG5WJXIOGIH5MYIH4FKA	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: utm_link_driven_sales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.utm_link_driven_sales (id, utm_link_id, utm_link_visit_id, purchase_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: utm_link_visits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.utm_link_visits (id, utm_link_id, user_id, referrer, ip_address, user_agent, browser_guid, country_code, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: utm_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.utm_links (id, seller_id, title, target_resource_type, target_resource_id, permalink, utm_campaign, utm_medium, utm_source, utm_term, utm_content, first_click_at, last_click_at, total_clicks, unique_clicks, created_at, updated_at, deleted_at, disabled_at, ip_address, browser_guid) FROM stdin;
\.


--
-- Data for Name: variant_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.variant_categories (id, link_id, deleted_at, title, flags) FROM stdin;
1	7	\N	Tier	0
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.versions (id, item_type, item_id, event, whodunnit, object, created_at, remote_ip, request_path, request_uuid, object_changes) FROM stdin;
1	User	3	create	\N	\N	2025-08-26 07:10:57.112256	\N	\N	\N	{"id":[null,3],"email":["","test@example.com"],"encrypted_password":["","$2a$11$aDbFr03VvZ7OPrbycz.JnezMQZATV5ESCRE/ihDnOmi32GGjUzeBG"],"created_at":[null,"2025-08-26T07:10:57Z"],"updated_at":[null,"2025-08-26T07:10:57Z"],"user_risk_state":[null,"not_reviewed"],"external_id":[null,"8899095974529"],"confirmation_token":[null,"ZpAdZyDwFfguwbNMY7-d"],"confirmation_sent_at":[null,"2025-08-26T07:10:57Z"],"flags":[1,22123376574785],"recommendation_type":["trending","own_products"],"json_data":[null,"{}"],"otp_secret_key":[null,"J7BVDRCF672MRHQCC727LTY2E4EU6GJZ"]}
2	RefundPolicy	1	create	\N	\N	2025-08-26 07:10:57.216152	\N	\N	\N	{"id":[null,1],"seller_id":[null,3],"created_at":[null,"2025-08-26T07:10:57Z"],"updated_at":[null,"2025-08-26T07:10:57Z"],"max_refund_period_in_days":[null,30]}
3	User	4	create	\N	\N	2025-08-26 07:12:41.198086	::1	/users/auth/google_oauth2/callback	8c55cf3b-1ac3-404b-9ad0-52cc4d78ca9a	{"id":[null,4],"email":["","miroshnichenko.lalita@gmail.com"],"encrypted_password":["","$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK"],"created_at":[null,"2025-08-26T07:12:41Z"],"updated_at":[null,"2025-08-26T07:12:41Z"],"google_uid":[null,"106384220000990454010"],"user_risk_state":[null,"not_reviewed"],"external_id":[null,"1418591517294"],"name":[null,"Лалита Мирошниченко"],"provider":[null,"google_oauth2"],"flags":[1,22123376574785],"recommendation_type":["trending","own_products"],"json_data":[null,"{}"],"otp_secret_key":[null,"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY"]}
4	RefundPolicy	2	create	\N	\N	2025-08-26 07:12:41.27557	::1	/users/auth/google_oauth2/callback	8c55cf3b-1ac3-404b-9ad0-52cc4d78ca9a	{"id":[null,2],"seller_id":[null,4],"created_at":[null,"2025-08-26T07:12:41Z"],"updated_at":[null,"2025-08-26T07:12:41Z"],"max_refund_period_in_days":[null,30]}
5	User	4	update	\N	{"id":4,"email":"miroshnichenko.lalita@gmail.com","encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":0,"current_sign_in_at":null,"last_sign_in_at":null,"current_sign_in_ip":null,"last_sign_in_ip":null,"created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T07:12:41Z","google_uid":"106384220000990454010","username":null,"user_risk_state":"not_reviewed","external_id":"1418591517294","name":"Лалита Мирошниченко","provider":"google_oauth2","confirmed_at":null,"confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376574785,"locale":"en","timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"usd","recommendation_type":"own_products","facebook_meta_tag":null,"google_analytics_id":null,"support_email":null,"bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"kindle_email":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-26 07:12:41.465042	::1	/users/auth/google_oauth2/callback	8c55cf3b-1ac3-404b-9ad0-52cc4d78ca9a	\N
6	User	4	update	\N	{"id":4,"email":"miroshnichenko.lalita@gmail.com","encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":0,"current_sign_in_at":null,"last_sign_in_at":null,"current_sign_in_ip":null,"last_sign_in_ip":null,"created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T07:12:41Z","google_uid":"106384220000990454010","username":null,"user_risk_state":"not_reviewed","external_id":"1418591517294","name":"Лалита Мирошниченко","provider":"google_oauth2","confirmed_at":null,"confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376574785,"locale":"en","timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"usd","recommendation_type":"own_products","facebook_meta_tag":null,"google_analytics_id":null,"support_email":null,"bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"kindle_email":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-26 07:12:41.533358	::1	/users/auth/google_oauth2/callback	8c55cf3b-1ac3-404b-9ad0-52cc4d78ca9a	{"updated_at":["2025-08-26T07:12:41Z","2025-08-26T07:12:41Z"],"confirmed_at":[null,"2025-08-26T07:12:41Z"]}
7	User	4	update	\N	{"id":4,"email":"miroshnichenko.lalita@gmail.com","encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":0,"current_sign_in_at":null,"last_sign_in_at":null,"current_sign_in_ip":null,"last_sign_in_ip":null,"created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T07:12:41Z","google_uid":"106384220000990454010","username":null,"user_risk_state":"not_reviewed","external_id":"1418591517294","name":"Лалита Мирошниченко","provider":"google_oauth2","confirmed_at":"2025-08-26T07:12:41Z","confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376574785,"locale":"en","timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"usd","recommendation_type":"own_products","facebook_meta_tag":null,"google_analytics_id":null,"support_email":null,"bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"kindle_email":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-26 07:12:41.600074	::1	/users/auth/google_oauth2/callback	8c55cf3b-1ac3-404b-9ad0-52cc4d78ca9a	{"updated_at":["2025-08-26T07:12:41Z","2025-08-26T07:12:41Z"],"flags":[22123376574785,22123376836929]}
8	User	4	update	\N	{"id":4,"email":"miroshnichenko.lalita@gmail.com","encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":0,"current_sign_in_at":null,"last_sign_in_at":null,"current_sign_in_ip":null,"last_sign_in_ip":null,"created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T07:12:41Z","google_uid":"106384220000990454010","username":null,"user_risk_state":"not_reviewed","external_id":"1418591517294","name":"Лалита Мирошниченко","provider":"google_oauth2","confirmed_at":"2025-08-26T07:12:41Z","confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376836929,"locale":"en","timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"usd","recommendation_type":"own_products","facebook_meta_tag":null,"google_analytics_id":null,"support_email":null,"bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"kindle_email":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-26 07:12:42.204516	::1	/users/auth/google_oauth2/callback	8c55cf3b-1ac3-404b-9ad0-52cc4d78ca9a	{"sign_in_count":[0,1],"current_sign_in_at":[null,"2025-08-26T07:12:42Z"],"last_sign_in_at":[null,"2025-08-26T07:12:42Z"],"current_sign_in_ip":[null,"::1"],"last_sign_in_ip":[null,"::1"],"updated_at":["2025-08-26T07:12:41Z","2025-08-26T07:12:42Z"]}
9	User	4	update	\N	{"name":"Лалита Мирошниченко","facebook_meta_tag":null,"google_analytics_id":null,"username":null,"email":"miroshnichenko.lalita@gmail.com","support_email":null,"encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","kindle_email":null,"id":4,"reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":1,"current_sign_in_at":"2025-08-26T07:12:42Z","last_sign_in_at":"2025-08-26T07:12:42Z","current_sign_in_ip":"::1","last_sign_in_ip":"::1","created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T07:12:42Z","google_uid":"106384220000990454010","user_risk_state":"not_reviewed","external_id":"1418591517294","provider":"google_oauth2","confirmed_at":"2025-08-26T07:12:41Z","confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376836929,"locale":"en","timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"usd","recommendation_type":"own_products","bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-26 07:54:27.926526	::1	/users/auth/google_oauth2/callback	967c1ef4-35d9-40c7-9d2b-660fd8d83dd8	{"sign_in_count":[1,2],"current_sign_in_at":["2025-08-26T07:12:42Z","2025-08-26T07:54:27Z"],"updated_at":["2025-08-26T07:12:42Z","2025-08-26T07:54:27Z"]}
10	User	4	update	\N	{"name":"Лалита Мирошниченко","facebook_meta_tag":null,"google_analytics_id":null,"username":null,"email":"miroshnichenko.lalita@gmail.com","support_email":null,"encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","kindle_email":null,"id":4,"reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":2,"current_sign_in_at":"2025-08-26T07:54:27Z","last_sign_in_at":"2025-08-26T07:12:42Z","current_sign_in_ip":"::1","last_sign_in_ip":"::1","created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T07:54:27Z","google_uid":"106384220000990454010","user_risk_state":"not_reviewed","external_id":"1418591517294","provider":"google_oauth2","confirmed_at":"2025-08-26T07:12:41Z","confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376836929,"locale":"en","timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"usd","recommendation_type":"own_products","bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-26 12:10:08.654357	::1	/users/auth/google_oauth2/callback	a92702d4-e667-41c9-8654-b9734719400b	{"sign_in_count":[2,3],"current_sign_in_at":["2025-08-26T07:54:27Z","2025-08-26T12:10:08Z"],"last_sign_in_at":["2025-08-26T07:12:42Z","2025-08-26T07:54:27Z"],"updated_at":["2025-08-26T07:54:27Z","2025-08-26T12:10:08Z"]}
11	Link	1	create	4	\N	2025-08-26 12:10:39.962127	::1	/links	0957c79b-c37a-4016-8d5f-4fa1f88d015f	{"id":[null,1],"user_id":[null,4],"name":[null,"test"],"unique_permalink":[null,"a"],"created_at":[null,"2025-08-26T12:10:39Z"],"updated_at":[null,"2025-08-26T12:10:39Z"],"purchase_disabled_at":[null,"2025-08-26T12:10:39Z"],"price_cents":[null,0],"customizable_price":[null,true],"draft":[false,true],"flags":[0,65536],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
12	BasePrice	1	create	4	\N	2025-08-26 12:10:40.034298	::1	/links	0957c79b-c37a-4016-8d5f-4fa1f88d015f	{"id":[null,1],"link_id":[null,1],"created_at":[null,"2025-08-26T12:10:40Z"],"updated_at":[null,"2025-08-26T12:10:40Z"]}
13	User	5	create	\N	\N	2025-08-26 12:20:38.027479	\N	\N	\N	{"id":[null,5],"email":["","test_final@example.com"],"encrypted_password":["","$2a$11$ffqGpHFR5yNHbOvvzJv.VOh6BMTXWa6oafDca7RZnleYdrgPrGD0C"],"created_at":[null,"2025-08-26T12:20:38Z"],"updated_at":[null,"2025-08-26T12:20:38Z"],"user_risk_state":[null,"not_reviewed"],"external_id":[null,"7968955700359"],"confirmation_token":[null,"vjx82xu8Etd4CtK_xdT9"],"confirmation_sent_at":[null,"2025-08-26T12:20:38Z"],"flags":[1,22123376574785],"recommendation_type":["trending","own_products"],"json_data":[null,"{}"],"otp_secret_key":[null,"JD4ARAKW65EJTEROKZHFRXSCXQGKJPKG"]}
14	RefundPolicy	3	create	\N	\N	2025-08-26 12:20:38.502972	\N	\N	\N	{"id":[null,3],"seller_id":[null,5],"created_at":[null,"2025-08-26T12:20:38Z"],"updated_at":[null,"2025-08-26T12:20:38Z"],"max_refund_period_in_days":[null,30]}
15	Link	2	create	\N	\N	2025-08-26 12:20:40.216727	\N	\N	\N	{"id":[null,2],"user_id":[null,5],"name":[null,"Test Product"],"unique_permalink":[null,"m"],"created_at":[null,"2025-08-26T12:20:40Z"],"updated_at":[null,"2025-08-26T12:20:40Z"],"price_cents":[null,1000],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
16	BasePrice	2	create	\N	\N	2025-08-26 12:20:40.229635	\N	\N	\N	{"id":[null,2],"link_id":[null,2],"price_cents":[0,1000],"created_at":[null,"2025-08-26T12:20:40Z"],"updated_at":[null,"2025-08-26T12:20:40Z"]}
17	User	6	create	\N	\N	2025-08-26 12:24:53.887594	\N	\N	\N	{"id":[null,6],"email":["","final_test@example.com"],"encrypted_password":["","$2a$11$3NPFyrk/l8Opg2hCCAWe7uHEQHs23oovIBncpy3.XCGGiw9lGs09C"],"created_at":[null,"2025-08-26T12:24:53Z"],"updated_at":[null,"2025-08-26T12:24:53Z"],"user_risk_state":[null,"not_reviewed"],"external_id":[null,"8634327479571"],"name":[null,"Final Test User"],"confirmation_token":[null,"JymJWcXunjzHF83z4mEA"],"confirmation_sent_at":[null,"2025-08-26T12:24:53Z"],"flags":[1,22123376574785],"recommendation_type":["trending","own_products"],"json_data":[null,"{}"],"otp_secret_key":[null,"TGLMKX5WJTRBS24LWUGDHYQ7Z6LYUHNT"]}
18	RefundPolicy	4	create	\N	\N	2025-08-26 12:24:54.025288	\N	\N	\N	{"id":[null,4],"seller_id":[null,6],"created_at":[null,"2025-08-26T12:24:54Z"],"updated_at":[null,"2025-08-26T12:24:54Z"],"max_refund_period_in_days":[null,30]}
19	Link	3	create	\N	\N	2025-08-26 12:24:54.977088	\N	\N	\N	{"id":[null,3],"user_id":[null,6],"name":[null,"Final Test Product"],"unique_permalink":[null,"t"],"description":[null,"Test product for schema verification"],"created_at":[null,"2025-08-26T12:24:54Z"],"updated_at":[null,"2025-08-26T12:24:54Z"],"price_cents":[null,2500],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
20	BasePrice	3	create	\N	\N	2025-08-26 12:24:55.006288	\N	\N	\N	{"id":[null,3],"link_id":[null,3],"price_cents":[0,2500],"created_at":[null,"2025-08-26T12:24:55Z"],"updated_at":[null,"2025-08-26T12:24:55Z"]}
21	Link	4	create	4	\N	2025-08-26 12:30:45.40686	::1	/links	77e7ec77-ef36-4baa-8092-20ba144ab60f	{"id":[null,4],"user_id":[null,4],"name":[null,"тест "],"unique_permalink":[null,"tw"],"created_at":[null,"2025-08-26T12:30:45Z"],"updated_at":[null,"2025-08-26T12:30:45Z"],"purchase_disabled_at":[null,"2025-08-26T12:30:45Z"],"price_cents":[null,0],"customizable_price":[null,true],"draft":[false,true],"flags":[0,65536],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
22	BasePrice	4	create	4	\N	2025-08-26 12:30:45.4186	::1	/links	77e7ec77-ef36-4baa-8092-20ba144ab60f	{"id":[null,4],"link_id":[null,4],"created_at":[null,"2025-08-26T12:30:45Z"],"updated_at":[null,"2025-08-26T12:30:45Z"]}
23	Link	5	create	4	\N	2025-08-26 12:31:14.003591	::1	/links	5d3cf9c2-e0d1-4a07-812a-2a69f3353ebe	{"id":[null,5],"user_id":[null,4],"name":[null,"тест "],"unique_permalink":[null,"b"],"created_at":[null,"2025-08-26T12:31:14Z"],"updated_at":[null,"2025-08-26T12:31:14Z"],"purchase_disabled_at":[null,"2025-08-26T12:31:13Z"],"price_cents":[null,0],"customizable_price":[null,true],"draft":[false,true],"flags":[0,65536],"json_data":[null,"{}"],"native_type":["digital","course"],"discover_fee_per_thousand":[100,300]}
24	BasePrice	5	create	4	\N	2025-08-26 12:31:14.01541	::1	/links	5d3cf9c2-e0d1-4a07-812a-2a69f3353ebe	{"id":[null,5],"link_id":[null,5],"created_at":[null,"2025-08-26T12:31:14Z"],"updated_at":[null,"2025-08-26T12:31:14Z"]}
25	Link	6	create	4	\N	2025-08-26 12:31:24.30515	::1	/links	179f8ac9-6eac-438b-af4e-97a1116c3058	{"id":[null,6],"user_id":[null,4],"name":[null,"тест"],"unique_permalink":[null,"f"],"created_at":[null,"2025-08-26T12:31:24Z"],"updated_at":[null,"2025-08-26T12:31:24Z"],"purchase_disabled_at":[null,"2025-08-26T12:31:24Z"],"price_cents":[null,0],"customizable_price":[null,true],"draft":[false,true],"flags":[0,65536],"json_data":[null,"{\\"custom_attributes\\":[{\\"name\\":\\"Pages\\",\\"value\\":\\"\\"}]}"],"native_type":["digital","ebook"],"discover_fee_per_thousand":[100,300]}
26	BasePrice	6	create	4	\N	2025-08-26 12:31:24.317388	::1	/links	179f8ac9-6eac-438b-af4e-97a1116c3058	{"id":[null,6],"link_id":[null,6],"created_at":[null,"2025-08-26T12:31:24Z"],"updated_at":[null,"2025-08-26T12:31:24Z"]}
27	Link	7	create	4	\N	2025-08-26 12:31:49.840099	::1	/links	e28db46f-f090-4cba-aca3-44e938f34e78	{"id":[null,7],"user_id":[null,4],"name":[null,"тест"],"unique_permalink":[null,"bo"],"created_at":[null,"2025-08-26T12:31:49Z"],"updated_at":[null,"2025-08-26T12:31:49Z"],"purchase_disabled_at":[null,"2025-08-26T12:31:49Z"],"price_cents":[null,0],"customizable_price":[null,true],"draft":[false,true],"flags":[0,854018],"subscription_duration":[null,0],"json_data":[null,"{}"],"native_type":["digital","membership"],"discover_fee_per_thousand":[100,300]}
28	BasePrice	7	create	4	\N	2025-08-26 12:31:49.940995	::1	/links	e28db46f-f090-4cba-aca3-44e938f34e78	{"id":[null,7],"recurrence":[null,"monthly"],"created_at":[null,"2025-08-26T12:31:49Z"],"updated_at":[null,"2025-08-26T12:31:49Z"],"variant_id":[null,1]}
29	BasePrice	8	create	4	\N	2025-08-26 12:31:49.983738	::1	/links	e28db46f-f090-4cba-aca3-44e938f34e78	{"id":[null,8],"link_id":[null,7],"recurrence":[null,"monthly"],"created_at":[null,"2025-08-26T12:31:49Z"],"updated_at":[null,"2025-08-26T12:31:49Z"]}
30	Link	8	create	4	\N	2025-08-26 12:32:04.421681	::1	/links	98e9a829-1023-4c9c-a5cb-90bf7ab849c6	{"id":[null,8],"user_id":[null,4],"name":[null,"0"],"unique_permalink":[null,"e"],"created_at":[null,"2025-08-26T12:32:04Z"],"updated_at":[null,"2025-08-26T12:32:04Z"],"purchase_disabled_at":[null,"2025-08-26T12:32:04Z"],"price_cents":[null,0],"customizable_price":[null,true],"draft":[false,true],"flags":[0,33619968],"json_data":[null,"{}"],"native_type":["digital","bundle"],"discover_fee_per_thousand":[100,300]}
31	BasePrice	9	create	4	\N	2025-08-26 12:32:04.428729	::1	/links	98e9a829-1023-4c9c-a5cb-90bf7ab849c6	{"id":[null,9],"link_id":[null,8],"created_at":[null,"2025-08-26T12:32:04Z"],"updated_at":[null,"2025-08-26T12:32:04Z"]}
32	Link	9	create	4	\N	2025-08-26 12:32:26.626577	::1	/links	c132aabb-9ba2-4a11-b6d1-b47f46e4a09e	{"id":[null,9],"user_id":[null,4],"name":[null,"0"],"unique_permalink":[null,"k"],"created_at":[null,"2025-08-26T12:32:26Z"],"updated_at":[null,"2025-08-26T12:32:26Z"],"purchase_disabled_at":[null,"2025-08-26T12:32:26Z"],"price_cents":[null,0],"customizable_price":[null,true],"draft":[false,true],"flags":[0,33619968],"json_data":[null,"{}"],"native_type":["digital","bundle"],"discover_fee_per_thousand":[100,300]}
33	BasePrice	10	create	4	\N	2025-08-26 12:32:26.640384	::1	/links	c132aabb-9ba2-4a11-b6d1-b47f46e4a09e	{"id":[null,10],"link_id":[null,9],"created_at":[null,"2025-08-26T12:32:26Z"],"updated_at":[null,"2025-08-26T12:32:26Z"]}
34	User	4	update	\N	{"currency_type":"usd","name":"Лалита Мирошниченко","facebook_meta_tag":null,"google_analytics_id":null,"username":null,"email":"miroshnichenko.lalita@gmail.com","support_email":null,"encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","kindle_email":null,"id":4,"reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":3,"current_sign_in_at":"2025-08-26T12:10:08Z","last_sign_in_at":"2025-08-26T07:54:27Z","current_sign_in_ip":"::1","last_sign_in_ip":"::1","created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T12:10:08Z","google_uid":"106384220000990454010","user_risk_state":"not_reviewed","external_id":"1418591517294","provider":"google_oauth2","confirmed_at":"2025-08-26T07:12:41Z","confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376836929,"locale":"en","timezone":"Pacific Time (US \\u0026 Canada)","recommendation_type":"own_products","bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-26 14:15:23.401595	\N	\N	\N	{"updated_at":["2025-08-26T12:10:08Z","2025-08-26T14:15:23Z"],"currency_type":["usd","uah"]}
35	User	4	update	\N	{"locale":"en","name":"Лалита Мирошниченко","facebook_meta_tag":null,"google_analytics_id":null,"username":null,"email":"miroshnichenko.lalita@gmail.com","support_email":null,"encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","kindle_email":null,"id":4,"reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":3,"current_sign_in_at":"2025-08-26T12:10:08Z","last_sign_in_at":"2025-08-26T07:54:27Z","current_sign_in_ip":"::1","last_sign_in_ip":"::1","created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T14:15:23Z","google_uid":"106384220000990454010","user_risk_state":"not_reviewed","external_id":"1418591517294","provider":"google_oauth2","confirmed_at":"2025-08-26T07:12:41Z","confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376836929,"timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"uah","recommendation_type":"own_products","bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-26 14:21:37.468874	\N	\N	\N	{"updated_at":["2025-08-26T14:15:23Z","2025-08-26T14:21:37Z"],"locale":["en","uk"]}
36	BasePrice	1	update	\N	{"link_id":1,"price_cents":0,"suggested_price_cents":null,"flags":0,"id":1,"currency":"usd","recurrence":null,"created_at":"2025-08-26T12:10:40Z","updated_at":"2025-08-26T12:10:40Z","deleted_at":null,"variant_id":null}	2025-08-26 17:50:43.951474	\N	\N	\N	{"price_cents":[0,2500],"updated_at":["2025-08-26T12:10:40Z","2025-08-26T17:50:43Z"]}
37	Link	1	update	\N	{"user_id":4,"price_currency_type":"usd","custom_permalink":null,"purchase_type":0,"id":1,"name":"test","unique_permalink":"a","preview_url":null,"description":null,"created_at":"2025-08-26T12:10:39Z","updated_at":"2025-08-26T12:10:39Z","purchase_disabled_at":"2025-08-26T12:10:39Z","deleted_at":null,"price_cents":0,"customizable_price":true,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":true,"flags":65536,"subscription_duration":null,"json_data":"{}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"digital","discover_fee_per_thousand":300}	2025-08-26 17:50:44.730629	\N	\N	\N	{"updated_at":["2025-08-26T12:10:39Z","2025-08-26T17:50:44Z"],"price_currency_type":["usd","uah"]}
38	Link	10	create	\N	\N	2025-08-26 17:58:22.743017	\N	\N	\N	{"id":[null,10],"user_id":[null,4],"name":[null,"Український продукт 1"],"unique_permalink":[null,"x"],"created_at":[null,"2025-08-26T17:58:22Z"],"updated_at":[null,"2025-08-26T17:58:22Z"],"price_cents":[null,5000],"price_currency_type":["usd","uah"],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
39	BasePrice	11	create	\N	\N	2025-08-26 17:58:22.761871	\N	\N	\N	{"id":[null,11],"link_id":[null,10],"price_cents":[0,5000],"currency":["usd","uah"],"created_at":[null,"2025-08-26T17:58:22Z"],"updated_at":[null,"2025-08-26T17:58:22Z"]}
40	Link	11	create	\N	\N	2025-08-26 17:58:23.189573	\N	\N	\N	{"id":[null,11],"user_id":[null,4],"name":[null,"Український продукт 2"],"unique_permalink":[null,"xc"],"created_at":[null,"2025-08-26T17:58:23Z"],"updated_at":[null,"2025-08-26T17:58:23Z"],"price_cents":[null,10000],"price_currency_type":["usd","uah"],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
41	BasePrice	12	create	\N	\N	2025-08-26 17:58:23.1931	\N	\N	\N	{"id":[null,12],"link_id":[null,11],"price_cents":[0,10000],"currency":["usd","uah"],"created_at":[null,"2025-08-26T17:58:23Z"],"updated_at":[null,"2025-08-26T17:58:23Z"]}
42	Link	12	create	\N	\N	2025-08-26 17:58:23.248918	\N	\N	\N	{"id":[null,12],"user_id":[null,4],"name":[null,"Український продукт 3"],"unique_permalink":[null,"br"],"created_at":[null,"2025-08-26T17:58:23Z"],"updated_at":[null,"2025-08-26T17:58:23Z"],"price_cents":[null,15000],"price_currency_type":["usd","uah"],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
43	BasePrice	13	create	\N	\N	2025-08-26 17:58:23.255767	\N	\N	\N	{"id":[null,13],"link_id":[null,12],"price_cents":[0,15000],"currency":["usd","uah"],"created_at":[null,"2025-08-26T17:58:23Z"],"updated_at":[null,"2025-08-26T17:58:23Z"]}
44	BasePrice	14	create	\N	\N	2025-08-26 18:13:58.346622	\N	\N	\N	{"id":[null,14],"link_id":[null,4],"price_cents":[0,2500],"currency":["usd","uah"],"created_at":[null,"2025-08-26T18:13:58Z"],"updated_at":[null,"2025-08-26T18:13:58Z"]}
45	Link	4	update	\N	{"user_id":4,"price_currency_type":"usd","purchase_type":0,"custom_permalink":null,"id":4,"name":"тест ","unique_permalink":"tw","preview_url":null,"description":null,"created_at":"2025-08-26T12:30:45Z","updated_at":"2025-08-26T12:30:45Z","purchase_disabled_at":"2025-08-26T12:30:45Z","deleted_at":null,"price_cents":0,"customizable_price":true,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":true,"flags":65536,"subscription_duration":null,"json_data":"{}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"digital","discover_fee_per_thousand":300}	2025-08-26 18:13:58.818618	\N	\N	\N	{"updated_at":["2025-08-26T12:30:45Z","2025-08-26T18:13:58Z"],"price_currency_type":["usd","uah"]}
46	BasePrice	15	create	\N	\N	2025-08-26 18:13:58.84162	\N	\N	\N	{"id":[null,15],"link_id":[null,5],"price_cents":[0,2500],"currency":["usd","uah"],"created_at":[null,"2025-08-26T18:13:58Z"],"updated_at":[null,"2025-08-26T18:13:58Z"]}
47	Link	5	update	\N	{"user_id":4,"price_currency_type":"usd","purchase_type":0,"custom_permalink":null,"id":5,"name":"тест ","unique_permalink":"b","preview_url":null,"description":null,"created_at":"2025-08-26T12:31:14Z","updated_at":"2025-08-26T12:31:14Z","purchase_disabled_at":"2025-08-26T12:31:13Z","deleted_at":null,"price_cents":0,"customizable_price":true,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":true,"flags":65536,"subscription_duration":null,"json_data":"{}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"course","discover_fee_per_thousand":300}	2025-08-26 18:13:58.87454	\N	\N	\N	{"updated_at":["2025-08-26T12:31:14Z","2025-08-26T18:13:58Z"],"price_currency_type":["usd","uah"]}
48	BasePrice	16	create	\N	\N	2025-08-26 18:13:58.887781	\N	\N	\N	{"id":[null,16],"link_id":[null,6],"price_cents":[0,2500],"currency":["usd","uah"],"created_at":[null,"2025-08-26T18:13:58Z"],"updated_at":[null,"2025-08-26T18:13:58Z"]}
49	Link	6	update	\N	{"user_id":4,"price_currency_type":"usd","purchase_type":0,"custom_permalink":null,"id":6,"name":"тест","unique_permalink":"f","preview_url":null,"description":null,"created_at":"2025-08-26T12:31:24Z","updated_at":"2025-08-26T12:31:24Z","purchase_disabled_at":"2025-08-26T12:31:24Z","deleted_at":null,"price_cents":0,"customizable_price":true,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":true,"flags":65536,"subscription_duration":null,"json_data":"{\\"custom_attributes\\":[{\\"name\\":\\"Pages\\",\\"value\\":\\"\\"}]}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"ebook","discover_fee_per_thousand":300}	2025-08-26 18:13:58.921193	\N	\N	\N	{"updated_at":["2025-08-26T12:31:24Z","2025-08-26T18:13:58Z"],"price_currency_type":["usd","uah"]}
50	Link	7	update	\N	{"user_id":4,"price_currency_type":"usd","purchase_type":0,"price_cents":0,"custom_permalink":null,"id":7,"name":"тест","unique_permalink":"bo","preview_url":null,"description":null,"created_at":"2025-08-26T12:31:49Z","updated_at":"2025-08-26T12:31:49Z","purchase_disabled_at":"2025-08-26T12:31:49Z","deleted_at":null,"customizable_price":true,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":true,"flags":854018,"subscription_duration":0,"json_data":"{}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"membership","discover_fee_per_thousand":300}	2025-08-26 18:13:58.95443	\N	\N	\N	{"updated_at":["2025-08-26T12:31:49Z","2025-08-26T18:13:58Z"],"price_cents":[0,2500],"price_currency_type":["usd","uah"]}
51	BasePrice	17	create	\N	\N	2025-08-26 18:13:58.984365	\N	\N	\N	{"id":[null,17],"link_id":[null,8],"price_cents":[0,2500],"currency":["usd","uah"],"created_at":[null,"2025-08-26T18:13:58Z"],"updated_at":[null,"2025-08-26T18:13:58Z"]}
52	Link	8	update	\N	{"user_id":4,"price_currency_type":"usd","purchase_type":0,"custom_permalink":null,"id":8,"name":"0","unique_permalink":"e","preview_url":null,"description":null,"created_at":"2025-08-26T12:32:04Z","updated_at":"2025-08-26T12:32:04Z","purchase_disabled_at":"2025-08-26T12:32:04Z","deleted_at":null,"price_cents":0,"customizable_price":true,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":true,"flags":33619968,"subscription_duration":null,"json_data":"{}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"bundle","discover_fee_per_thousand":300}	2025-08-26 18:13:59.012485	\N	\N	\N	{"updated_at":["2025-08-26T12:32:04Z","2025-08-26T18:13:59Z"],"price_currency_type":["usd","uah"]}
53	BasePrice	18	create	\N	\N	2025-08-26 18:13:59.022381	\N	\N	\N	{"id":[null,18],"link_id":[null,9],"price_cents":[0,2500],"currency":["usd","uah"],"created_at":[null,"2025-08-26T18:13:59Z"],"updated_at":[null,"2025-08-26T18:13:59Z"]}
54	Link	9	update	\N	{"user_id":4,"price_currency_type":"usd","purchase_type":0,"custom_permalink":null,"id":9,"name":"0","unique_permalink":"k","preview_url":null,"description":null,"created_at":"2025-08-26T12:32:26Z","updated_at":"2025-08-26T12:32:26Z","purchase_disabled_at":"2025-08-26T12:32:26Z","deleted_at":null,"price_cents":0,"customizable_price":true,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":true,"flags":33619968,"subscription_duration":null,"json_data":"{}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"bundle","discover_fee_per_thousand":300}	2025-08-26 18:13:59.053197	\N	\N	\N	{"updated_at":["2025-08-26T12:32:26Z","2025-08-26T18:13:59Z"],"price_currency_type":["usd","uah"]}
55	Link	7	update	\N	{"user_id":4,"purchase_type":0,"price_cents":2500,"price_currency_type":"uah","custom_permalink":null,"id":7,"name":"тест","unique_permalink":"bo","preview_url":null,"description":null,"created_at":"2025-08-26T12:31:49Z","updated_at":"2025-08-26T18:13:58Z","purchase_disabled_at":"2025-08-26T12:31:49Z","deleted_at":null,"customizable_price":true,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":true,"flags":854018,"subscription_duration":0,"json_data":"{}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"membership","discover_fee_per_thousand":300}	2025-08-26 18:30:34.220026	\N	\N	\N	{"updated_at":["2025-08-26T18:13:58Z","2025-08-26T18:30:34Z"],"price_cents":[2500,5000]}
56	User	7	create	\N	\N	2025-08-27 12:51:59.410107	\N	\N	\N	{"id":[null,7],"email":["","migration_test@example.com"],"encrypted_password":["","$2a$11$0GgH8NmntB/HRb9YZPtN6.m67FuYc.PGPKYLZbIL2lMOQfMStBr0K"],"created_at":[null,"2025-08-27T12:51:59Z"],"updated_at":[null,"2025-08-27T12:51:59Z"],"user_risk_state":[null,"not_reviewed"],"external_id":[null,"1481300609126"],"confirmation_token":[null,"Bfsg1kcLynb7_yXBcV9_"],"confirmation_sent_at":[null,"2025-08-27T12:51:59Z"],"flags":[1,22123376574785],"locale":["en","uk"],"currency_type":["usd","uah"],"recommendation_type":["trending","own_products"],"json_data":[null,"{}"],"otp_secret_key":[null,"UFUSDHYWAMFP57BUG6PS4B2Y5SZOMN3I"]}
57	RefundPolicy	1	create	\N	\N	2025-08-27 12:51:59.495234	\N	\N	\N	{"id":[null,1],"seller_id":[null,7],"created_at":[null,"2025-08-27T12:51:59Z"],"updated_at":[null,"2025-08-27T12:51:59Z"],"max_refund_period_in_days":[null,30]}
58	Link	1	create	\N	\N	2025-08-27 12:52:00.207657	\N	\N	\N	{"id":[null,1],"user_id":[null,7],"name":[null,"Migration Test Product"],"unique_permalink":[null,"f"],"created_at":[null,"2025-08-27T12:52:00Z"],"updated_at":[null,"2025-08-27T12:52:00Z"],"price_cents":[null,5000],"price_currency_type":["usd","uah"],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
59	BasePrice	1	create	\N	\N	2025-08-27 12:52:00.419046	\N	\N	\N	{"id":[null,1],"link_id":[null,1],"price_cents":[0,5000],"currency":["usd","uah"],"created_at":[null,"2025-08-27T12:52:00Z"],"updated_at":[null,"2025-08-27T12:52:00Z"]}
60	Link	1	destroy	\N	{"id":1,"user_id":7,"name":"Migration Test Product","unique_permalink":"f","preview_url":null,"description":null,"purchase_type":0,"created_at":"2025-08-27T12:52:00Z","updated_at":"2025-08-27T12:52:00Z","purchase_disabled_at":null,"deleted_at":null,"price_cents":5000,"price_currency_type":"uah","customizable_price":null,"max_purchase_count":null,"bad_card_counter":0,"require_shipping":false,"last_partner_sync":null,"preview_oembed":null,"showcaseable":false,"custom_receipt":null,"custom_filetype":null,"filetype":"link","filegroup":"url","size":null,"bitrate":null,"framerate":null,"pagelength":null,"duration":null,"width":null,"height":null,"custom_permalink":null,"common_color":null,"suggested_price_cents":null,"banned_at":null,"risk_score":null,"risk_score_updated_at":null,"draft":false,"flags":0,"subscription_duration":null,"json_data":"{}","external_mapping_id":null,"affiliate_application_id":null,"rental_price_cents":null,"duration_in_months":null,"migrated_to_tiered_pricing_at":null,"free_trial_duration_unit":null,"free_trial_duration_amount":null,"content_updated_at":null,"taxonomy_id":null,"native_type":"digital","discover_fee_per_thousand":300}	2025-08-27 12:52:01.922199	\N	\N	\N	{"id":[1,null],"user_id":[7,null],"name":["Migration Test Product",null],"unique_permalink":["f",null],"preview_url":[null,null],"description":[null,null],"purchase_type":[0,null],"created_at":["2025-08-27T12:52:00Z",null],"updated_at":["2025-08-27T12:52:00Z",null],"purchase_disabled_at":[null,null],"deleted_at":[null,null],"price_cents":[5000,null],"price_currency_type":["uah",null],"customizable_price":[null,null],"max_purchase_count":[null,null],"bad_card_counter":[0,null],"require_shipping":[false,null],"last_partner_sync":[null,null],"preview_oembed":[null,null],"showcaseable":[false,null],"custom_receipt":[null,null],"custom_filetype":[null,null],"filetype":["link",null],"filegroup":["url",null],"size":[null,null],"bitrate":[null,null],"framerate":[null,null],"pagelength":[null,null],"duration":[null,null],"width":[null,null],"height":[null,null],"custom_permalink":[null,null],"common_color":[null,null],"suggested_price_cents":[null,null],"banned_at":[null,null],"risk_score":[null,null],"risk_score_updated_at":[null,null],"draft":[false,null],"flags":[0,null],"subscription_duration":[null,null],"json_data":["{}",null],"external_mapping_id":[null,null],"affiliate_application_id":[null,null],"rental_price_cents":[null,null],"duration_in_months":[null,null],"migrated_to_tiered_pricing_at":[null,null],"free_trial_duration_unit":[null,null],"free_trial_duration_amount":[null,null],"content_updated_at":[null,null],"taxonomy_id":[null,null],"native_type":["digital",null],"discover_fee_per_thousand":[300,null]}
61	User	7	destroy	\N	{"id":7,"email":"migration_test@example.com","encrypted_password":"$2a$11$0GgH8NmntB/HRb9YZPtN6.m67FuYc.PGPKYLZbIL2lMOQfMStBr0K","reset_password_token":null,"reset_password_sent_at":null,"remember_created_at":null,"sign_in_count":0,"current_sign_in_at":null,"last_sign_in_at":null,"current_sign_in_ip":null,"last_sign_in_ip":null,"created_at":"2025-08-27T12:51:59Z","updated_at":"2025-08-27T12:51:59Z","google_uid":null,"username":null,"user_risk_state":"not_reviewed","external_id":"1481300609126","name":null,"provider":null,"confirmed_at":null,"confirmation_token":"Bfsg1kcLynb7_yXBcV9_","confirmation_sent_at":"2025-08-27T12:51:59Z","unconfirmed_email":null,"tier_state":0,"flags":22123376574785,"locale":"uk","timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"uah","recommendation_type":"own_products","facebook_meta_tag":null,"google_analytics_id":null,"support_email":null,"bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"kindle_email":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"UFUSDHYWAMFP57BUG6PS4B2Y5SZOMN3I","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-27 12:52:02.018306	\N	\N	\N	{"id":[7,null],"email":["migration_test@example.com",null],"encrypted_password":["$2a$11$0GgH8NmntB/HRb9YZPtN6.m67FuYc.PGPKYLZbIL2lMOQfMStBr0K",null],"reset_password_token":[null,null],"reset_password_sent_at":[null,null],"remember_created_at":[null,null],"sign_in_count":[0,null],"current_sign_in_at":[null,null],"last_sign_in_at":[null,null],"current_sign_in_ip":[null,null],"last_sign_in_ip":[null,null],"created_at":["2025-08-27T12:51:59Z",null],"updated_at":["2025-08-27T12:51:59Z",null],"google_uid":[null,null],"username":[null,null],"user_risk_state":["not_reviewed",null],"external_id":["1481300609126",null],"name":[null,null],"provider":[null,null],"confirmed_at":[null,null],"confirmation_token":["Bfsg1kcLynb7_yXBcV9_",null],"confirmation_sent_at":["2025-08-27T12:51:59Z",null],"unconfirmed_email":[null,null],"tier_state":[0,null],"flags":[22123376574785,null],"locale":["uk",null],"timezone":["Pacific Time (US \\u0026 Canada)",null],"currency_type":["uah",null],"recommendation_type":["own_products",null],"facebook_meta_tag":[null,null],"google_analytics_id":[null,null],"support_email":[null,null],"bio":[null,null],"profile_picture_url":[null,null],"country":[null,null],"verified":[null,null],"payment_notification":[true,null],"facebook_uid":[null,null],"twitter_user_id":[null,null],"twitter_handle":[null,null],"twitter_oauth_token":[null,null],"twitter_oauth_secret":[null,null],"facebook_id":[null,null],"purchasing_power_parity_limit":[null,null],"kindle_email":[null,null],"payment_address":[null,null],"deleted_at":[null,null],"account_created_ip":[null,null],"notification_endpoint":[null,null],"json_data":["{}",null],"tos_violation_reason":[null,null],"google_analytics_domains":[null,null],"facebook_pixel_id":[null,null],"split_payment_by_cents":[null,null],"last_active_sessions_invalidated_at":[null,null],"otp_secret_key":["UFUSDHYWAMFP57BUG6PS4B2Y5SZOMN3I",null],"orientation_priority_tag":[null,null],"facebook_access_token":[null,null],"manage_pages":[null,null],"banned_at":[null,null],"weekly_notification":[null,null],"state":[null,null],"city":[null,null],"zip_code":[null,null],"street_address":[null,null]}
62	RefundPolicy	1	destroy	\N	{"id":1,"seller_id":7,"product_id":null,"title":null,"fine_print":null,"created_at":"2025-08-27T12:51:59Z","updated_at":"2025-08-27T12:51:59Z","max_refund_period_in_days":30}	2025-08-27 12:52:02.074584	\N	\N	\N	{"id":[1,null],"seller_id":[7,null],"product_id":[null,null],"title":[null,null],"fine_print":[null,null],"created_at":["2025-08-27T12:51:59Z",null],"updated_at":["2025-08-27T12:51:59Z",null],"max_refund_period_in_days":[30,null]}
63	User	4	update	\N	{"remember_created_at":null,"id":4,"email":"miroshnichenko.lalita@gmail.com","encrypted_password":"$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK","reset_password_token":null,"reset_password_sent_at":null,"sign_in_count":3,"current_sign_in_at":"2025-08-26T12:10:08Z","last_sign_in_at":"2025-08-26T07:54:27Z","current_sign_in_ip":"::1","last_sign_in_ip":"::1","created_at":"2025-08-26T07:12:41Z","updated_at":"2025-08-26T14:21:37Z","google_uid":"106384220000990454010","username":null,"user_risk_state":"not_reviewed","external_id":"1418591517294","name":"Лалита Мирошниченко","provider":"google_oauth2","confirmed_at":"2025-08-26T07:12:41Z","confirmation_token":null,"confirmation_sent_at":null,"unconfirmed_email":null,"tier_state":0,"flags":22123376836929,"locale":"uk","timezone":"Pacific Time (US \\u0026 Canada)","currency_type":"uah","recommendation_type":"own_products","facebook_meta_tag":null,"google_analytics_id":null,"support_email":null,"bio":null,"profile_picture_url":null,"country":null,"verified":null,"payment_notification":true,"facebook_uid":null,"twitter_user_id":null,"twitter_handle":null,"twitter_oauth_token":null,"twitter_oauth_secret":null,"facebook_id":null,"purchasing_power_parity_limit":null,"kindle_email":null,"payment_address":null,"deleted_at":null,"account_created_ip":null,"notification_endpoint":null,"json_data":"{}","tos_violation_reason":null,"google_analytics_domains":null,"facebook_pixel_id":null,"split_payment_by_cents":null,"last_active_sessions_invalidated_at":null,"otp_secret_key":"HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY","orientation_priority_tag":null,"facebook_access_token":null,"manage_pages":null,"banned_at":null,"weekly_notification":null,"state":null,"city":null,"zip_code":null,"street_address":null}	2025-08-27 14:16:01.159966	\N	\N	\N	{"remember_created_at":[null,"2025-08-27T14:16:01Z"],"updated_at":["2025-08-26T14:21:37Z","2025-08-27T14:16:01Z"]}
64	User	8	create	\N	\N	2025-08-27 15:35:59.664609	\N	\N	\N	{"id":[null,8],"email":["","test_seller@example.com"],"encrypted_password":["","$2a$11$vzj2kSI79TEIV4uWBYdZAO7THkZE265NyJXzcuaP1m118MaIWGlUK"],"created_at":[null,"2025-08-27T15:35:59Z"],"updated_at":[null,"2025-08-27T15:35:59Z"],"user_risk_state":[null,"not_reviewed"],"external_id":[null,"9238446862723"],"name":[null,"Test Seller"],"confirmation_token":[null,"duhrkVbR5GNGJ7M5iXbo"],"confirmation_sent_at":[null,"2025-08-27T15:35:59Z"],"flags":[1,22123376574785],"locale":["en","uk"],"currency_type":["usd","uah"],"recommendation_type":["trending","own_products"],"json_data":[null,"{}"],"otp_secret_key":[null,"V5FQBD4HFQOSMG5WJXIOGIH5MYIH4FKA"]}
65	RefundPolicy	2	create	\N	\N	2025-08-27 15:35:59.811781	\N	\N	\N	{"id":[null,2],"seller_id":[null,8],"created_at":[null,"2025-08-27T15:35:59Z"],"updated_at":[null,"2025-08-27T15:35:59Z"],"max_refund_period_in_days":[null,30]}
66	Link	2	create	\N	\N	2025-08-27 15:39:51.459407	\N	\N	\N	{"id":[null,2],"user_id":[null,8],"name":[null,"Тестовий цифровий продукт"],"unique_permalink":[null,"y"],"description":[null,"Це тестовий цифровий продукт для перевірки системи"],"created_at":[null,"2025-08-27T15:39:51Z"],"updated_at":[null,"2025-08-27T15:39:51Z"],"price_cents":[null,2500],"price_currency_type":["usd","uah"],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
67	BasePrice	2	create	\N	\N	2025-08-27 15:39:51.476022	\N	\N	\N	{"id":[null,2],"link_id":[null,2],"price_cents":[0,2500],"currency":["usd","uah"],"created_at":[null,"2025-08-27T15:39:51Z"],"updated_at":[null,"2025-08-27T15:39:51Z"]}
68	Link	3	create	\N	\N	2025-08-27 15:39:52.087866	\N	\N	\N	{"id":[null,3],"user_id":[null,8],"name":[null,"Тестовий фізичний товар"],"unique_permalink":[null,"o"],"description":[null,"Це тестовий фізичний товар з доставкою"],"created_at":[null,"2025-08-27T15:39:52Z"],"updated_at":[null,"2025-08-27T15:39:52Z"],"price_cents":[null,5000],"price_currency_type":["usd","uah"],"require_shipping":[false,true],"flags":[0,128],"json_data":[null,"{}"],"native_type":["digital","physical"],"discover_fee_per_thousand":[100,300]}
69	BasePrice	3	create	\N	\N	2025-08-27 15:39:52.091162	\N	\N	\N	{"id":[null,3],"link_id":[null,3],"price_cents":[0,5000],"currency":["usd","uah"],"created_at":[null,"2025-08-27T15:39:52Z"],"updated_at":[null,"2025-08-27T15:39:52Z"]}
70	Link	4	create	\N	\N	2025-08-27 16:46:09.707538	\N	\N	\N	{"id":[null,4],"user_id":[null,8],"name":[null,"Test Product Simple"],"unique_permalink":[null,"z"],"description":[null,"Simple test product"],"created_at":[null,"2025-08-27T16:46:09Z"],"updated_at":[null,"2025-08-27T16:46:09Z"],"price_cents":[null,2500],"price_currency_type":["usd","uah"],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
71	BasePrice	4	create	\N	\N	2025-08-27 16:46:09.729535	\N	\N	\N	{"id":[null,4],"link_id":[null,4],"price_cents":[0,2500],"currency":["usd","uah"],"created_at":[null,"2025-08-27T16:46:09Z"],"updated_at":[null,"2025-08-27T16:46:09Z"]}
72	Link	5	create	\N	\N	2025-08-27 17:03:49.639621	\N	\N	\N	{"id":[null,5],"user_id":[null,4],"name":[null,"Цифровий товар основного користувача"],"unique_permalink":[null,"r"],"description":[null,"Тестовий цифровий товар"],"created_at":[null,"2025-08-27T17:03:49Z"],"updated_at":[null,"2025-08-27T17:03:49Z"],"price_cents":[null,5000],"price_currency_type":["usd","uah"],"json_data":[null,"{}"],"discover_fee_per_thousand":[100,300]}
73	BasePrice	5	create	\N	\N	2025-08-27 17:03:49.658738	\N	\N	\N	{"id":[null,5],"link_id":[null,5],"price_cents":[0,5000],"currency":["usd","uah"],"created_at":[null,"2025-08-27T17:03:49Z"],"updated_at":[null,"2025-08-27T17:03:49Z"]}
\.


--
-- Data for Name: video_files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.video_files (id, record_type, record_id, url, filetype, width, height, duration, bitrate, framerate, size, flags, deleted_at, deleted_from_cdn_at, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: wishlist_followers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wishlist_followers (id, wishlist_id, follower_user_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: wishlist_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wishlist_products (id, wishlist_id, product_id, variant_id, recurrence, quantity, rent, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: wishlists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wishlists (id, user_id, name, deleted_at, created_at, updated_at, followers_last_contacted_at, description, flags, recommendable, follower_count, recent_follower_count) FROM stdin;
\.


--
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workflows (id, name, seller_id, link_id, workflow_type, published_at, deleted_at, created_at, updated_at, base_variant_id, json_data, first_published_at, flags) FROM stdin;
\.


--
-- Data for Name: yearly_stats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.yearly_stats (id, user_id, analytics_data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: zip_tax_rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.zip_tax_rates (id, combined_rate, county_rate, city_rate, state, state_rate, tax_region_code, tax_region_name, zip_code, created_at, updated_at, special_rate, flags, country, user_id, deleted_at, json_data) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: admin_action_call_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_action_call_infos_id_seq', 1, false);


--
-- Name: affiliate_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.affiliate_credits_id_seq', 1, false);


--
-- Name: affiliate_partial_refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.affiliate_partial_refunds_id_seq', 1, false);


--
-- Name: affiliate_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.affiliate_requests_id_seq', 1, false);


--
-- Name: affiliates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.affiliates_id_seq', 2, true);


--
-- Name: affiliates_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.affiliates_links_id_seq', 1, false);


--
-- Name: asset_previews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.asset_previews_id_seq', 1, false);


--
-- Name: audience_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.audience_members_id_seq', 1, false);


--
-- Name: australia_backtax_email_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.australia_backtax_email_infos_id_seq', 1, false);


--
-- Name: backtax_agreements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.backtax_agreements_id_seq', 1, false);


--
-- Name: backtax_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.backtax_collections_id_seq', 1, false);


--
-- Name: balance_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.balance_transactions_id_seq', 1, false);


--
-- Name: balances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.balances_id_seq', 1, false);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bank_accounts_id_seq', 1, false);


--
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.banks_id_seq', 1, false);


--
-- Name: base_variant_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.base_variant_integrations_id_seq', 1, false);


--
-- Name: base_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.base_variants_id_seq', 1, false);


--
-- Name: base_variants_product_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.base_variants_product_files_id_seq', 1, false);


--
-- Name: base_variants_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.base_variants_purchases_id_seq', 1, false);


--
-- Name: blocked_customer_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blocked_customer_objects_id_seq', 1, false);


--
-- Name: bundle_product_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bundle_product_purchases_id_seq', 1, false);


--
-- Name: bundle_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bundle_products_id_seq', 1, false);


--
-- Name: cached_sales_related_products_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cached_sales_related_products_infos_id_seq', 1, false);


--
-- Name: call_availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.call_availabilities_id_seq', 1, false);


--
-- Name: call_limitation_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.call_limitation_infos_id_seq', 1, false);


--
-- Name: calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.calls_id_seq', 1, false);


--
-- Name: cart_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cart_products_id_seq', 1, false);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carts_id_seq', 1, false);


--
-- Name: charge_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.charge_purchases_id_seq', 1, false);


--
-- Name: charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.charges_id_seq', 1, false);


--
-- Name: collaborator_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.collaborator_invitations_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: commission_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commission_files_id_seq', 1, false);


--
-- Name: commissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commissions_id_seq', 1, false);


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.communities_id_seq', 1, false);


--
-- Name: community_chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.community_chat_messages_id_seq', 1, false);


--
-- Name: community_chat_recap_runs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.community_chat_recap_runs_id_seq', 1, false);


--
-- Name: community_chat_recaps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.community_chat_recaps_id_seq', 1, false);


--
-- Name: community_notification_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.community_notification_settings_id_seq', 1, false);


--
-- Name: computed_sales_analytics_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.computed_sales_analytics_days_id_seq', 1, false);


--
-- Name: consumption_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.consumption_events_id_seq', 1, false);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.credit_cards_id_seq', 1, false);


--
-- Name: credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.credits_id_seq', 1, false);


--
-- Name: custom_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.custom_domains_id_seq', 1, false);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 1, false);


--
-- Name: custom_fields_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.custom_fields_products_id_seq', 1, false);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.devices_id_seq', 1, false);


--
-- Name: discover_search_suggestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.discover_search_suggestions_id_seq', 1, false);


--
-- Name: discover_searches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.discover_searches_id_seq', 1, false);


--
-- Name: dispute_evidences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dispute_evidences_id_seq', 1, false);


--
-- Name: disputes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.disputes_id_seq', 1, false);


--
-- Name: dropbox_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dropbox_files_id_seq', 1, false);


--
-- Name: email_info_charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.email_info_charges_id_seq', 1, false);


--
-- Name: email_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.email_infos_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_id_seq', 26, true);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.followers_id_seq', 1, false);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, false);


--
-- Name: gifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.gifts_id_seq', 1, false);


--
-- Name: gumroad_daily_analytics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.gumroad_daily_analytics_id_seq', 1, false);


--
-- Name: imported_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.imported_customers_id_seq', 1, false);


--
-- Name: installment_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.installment_events_id_seq', 1, false);


--
-- Name: installment_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.installment_rules_id_seq', 1, false);


--
-- Name: installments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.installments_id_seq', 1, false);


--
-- Name: integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.integrations_id_seq', 1, false);


--
-- Name: invites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.invites_id_seq', 1, false);


--
-- Name: large_sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.large_sellers_id_seq', 1, false);


--
-- Name: last_read_community_chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.last_read_community_chat_messages_id_seq', 1, false);


--
-- Name: legacy_permalinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.legacy_permalinks_id_seq', 1, false);


--
-- Name: licenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.licenses_id_seq', 1, false);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 5, true);


--
-- Name: media_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.media_locations_id_seq', 1, false);


--
-- Name: merchant_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.merchant_accounts_id_seq', 1, false);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_access_grants_id_seq', 1, false);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 1, false);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oauth_applications_id_seq', 1, false);


--
-- Name: offer_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.offer_codes_id_seq', 1, false);


--
-- Name: offer_codes_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.offer_codes_products_id_seq', 1, false);


--
-- Name: order_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_purchases_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: payment_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payment_options_id_seq', 1, false);


--
-- Name: payments_balances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payments_balances_id_seq', 1, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- Name: post_email_blasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_email_blasts_id_seq', 1, false);


--
-- Name: preorder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.preorder_links_id_seq', 1, false);


--
-- Name: preorders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.preorders_id_seq', 1, false);


--
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prices_id_seq', 5, true);


--
-- Name: processor_payment_intents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.processor_payment_intents_id_seq', 1, false);


--
-- Name: product_cached_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_cached_values_id_seq', 1, false);


--
-- Name: product_files_archives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_files_archives_id_seq', 1, false);


--
-- Name: product_files_files_archives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_files_files_archives_id_seq', 1, false);


--
-- Name: product_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_files_id_seq', 1, false);


--
-- Name: product_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_folders_id_seq', 1, false);


--
-- Name: product_installment_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_installment_plans_id_seq', 1, false);


--
-- Name: product_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_integrations_id_seq', 1, false);


--
-- Name: product_review_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_review_responses_id_seq', 1, false);


--
-- Name: product_review_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_review_stats_id_seq', 1, false);


--
-- Name: product_review_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_review_videos_id_seq', 1, false);


--
-- Name: product_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_reviews_id_seq', 1, false);


--
-- Name: product_taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_taggings_id_seq', 1, false);


--
-- Name: public_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.public_files_id_seq', 1, false);


--
-- Name: purchase_custom_field_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_custom_field_files_id_seq', 1, false);


--
-- Name: purchase_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_custom_fields_id_seq', 1, false);


--
-- Name: purchase_early_fraud_warnings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_early_fraud_warnings_id_seq', 1, false);


--
-- Name: purchase_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_integrations_id_seq', 1, false);


--
-- Name: purchase_offer_code_discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_offer_code_discounts_id_seq', 1, false);


--
-- Name: purchase_refund_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_refund_policies_id_seq', 1, false);


--
-- Name: purchase_sales_tax_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_sales_tax_infos_id_seq', 1, false);


--
-- Name: purchase_taxjar_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_taxjar_infos_id_seq', 1, false);


--
-- Name: purchase_wallet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_wallet_types_id_seq', 1, false);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchases_id_seq', 1, false);


--
-- Name: purchasing_power_parity_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchasing_power_parity_infos_id_seq', 1, false);


--
-- Name: recommended_purchase_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recommended_purchase_infos_id_seq', 1, false);


--
-- Name: recurring_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recurring_services_id_seq', 1, false);


--
-- Name: refund_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.refund_policies_id_seq', 2, true);


--
-- Name: refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.refunds_id_seq', 1, false);


--
-- Name: resource_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.resource_subscriptions_id_seq', 1, false);


--
-- Name: rich_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rich_contents_id_seq', 1, false);


--
-- Name: sales_export_chunks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_export_chunks_id_seq', 1, false);


--
-- Name: sales_exports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_exports_id_seq', 1, false);


--
-- Name: sales_related_products_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_related_products_infos_id_seq', 1, false);


--
-- Name: self_service_affiliate_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.self_service_affiliate_products_id_seq', 1, false);


--
-- Name: seller_profile_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.seller_profile_sections_id_seq', 1, false);


--
-- Name: seller_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.seller_profiles_id_seq', 1, false);


--
-- Name: sent_abandoned_cart_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sent_abandoned_cart_emails_id_seq', 1, false);


--
-- Name: sent_email_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sent_email_infos_id_seq', 1, false);


--
-- Name: sent_post_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sent_post_emails_id_seq', 1, false);


--
-- Name: service_charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.service_charges_id_seq', 1, false);


--
-- Name: shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shipments_id_seq', 1, false);


--
-- Name: shipping_destinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shipping_destinations_id_seq', 1, false);


--
-- Name: signup_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.signup_events_id_seq', 1, false);


--
-- Name: skus_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.skus_variants_id_seq', 1, false);


--
-- Name: staff_picked_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.staff_picked_products_id_seq', 1, false);


--
-- Name: stamped_pdfs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stamped_pdfs_id_seq', 1, false);


--
-- Name: stripe_apple_pay_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stripe_apple_pay_domains_id_seq', 1, false);


--
-- Name: subscription_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subscription_events_id_seq', 1, false);


--
-- Name: subscription_plan_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subscription_plan_changes_id_seq', 1, false);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- Name: subtitle_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subtitle_files_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Name: taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.taxonomies_id_seq', 1, false);


--
-- Name: taxonomy_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.taxonomy_stats_id_seq', 1, false);


--
-- Name: team_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.team_invitations_id_seq', 1, false);


--
-- Name: team_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.team_memberships_id_seq', 1, false);


--
-- Name: third_party_analytics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.third_party_analytics_id_seq', 1, false);


--
-- Name: thumbnails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thumbnails_id_seq', 1, false);


--
-- Name: tips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tips_id_seq', 1, false);


--
-- Name: top_sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.top_sellers_id_seq', 1, false);


--
-- Name: tos_agreements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tos_agreements_id_seq', 1, false);


--
-- Name: transcoded_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transcoded_videos_id_seq', 1, false);


--
-- Name: upsell_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upsell_purchases_id_seq', 1, false);


--
-- Name: upsell_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upsell_variants_id_seq', 1, false);


--
-- Name: upsells_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upsells_id_seq', 1, false);


--
-- Name: upsells_selected_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upsells_selected_products_id_seq', 1, false);


--
-- Name: url_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.url_redirects_id_seq', 1, false);


--
-- Name: user_compliance_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_compliance_info_id_seq', 1, false);


--
-- Name: user_compliance_info_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_compliance_info_requests_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: utm_link_driven_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.utm_link_driven_sales_id_seq', 1, false);


--
-- Name: utm_link_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.utm_link_visits_id_seq', 1, false);


--
-- Name: utm_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.utm_links_id_seq', 1, false);


--
-- Name: variant_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.variant_categories_id_seq', 1, true);


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.versions_id_seq', 73, true);


--
-- Name: video_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.video_files_id_seq', 1, false);


--
-- Name: wishlist_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wishlist_followers_id_seq', 1, false);


--
-- Name: wishlist_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wishlist_products_id_seq', 1, false);


--
-- Name: wishlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wishlists_id_seq', 1, false);


--
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.workflows_id_seq', 1, false);


--
-- Name: yearly_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.yearly_stats_id_seq', 1, false);


--
-- Name: zip_tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.zip_tax_rates_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

