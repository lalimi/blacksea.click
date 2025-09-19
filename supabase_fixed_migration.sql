-- ИСПРАВЛЕННАЯ МИГРАЦИЯ GUMROAD В SUPABASE
-- Правильный порядок: Tables → Alters → Indexes → Constraints
-- Создан автоматически: 2025-08-28 13:06:28 +0300

SET client_min_messages TO WARNING;

-- ==================================
-- ЭТАП 1: СОЗДАНИЕ SEQUENCES
-- ==================================
-- Sequence 1/172: active_storage_attachments_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'active_storage_attachments_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.active_storage_attachments_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 2/172: active_storage_blobs_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'active_storage_blobs_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.active_storage_blobs_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 3/172: active_storage_variant_records_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'active_storage_variant_records_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.active_storage_variant_records_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 4/172: admin_action_call_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'admin_action_call_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.admin_action_call_infos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 5/172: affiliate_credits_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'affiliate_credits_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.affiliate_credits_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 6/172: affiliate_partial_refunds_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'affiliate_partial_refunds_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.affiliate_partial_refunds_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 7/172: affiliate_requests_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'affiliate_requests_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.affiliate_requests_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 8/172: affiliates_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'affiliates_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.affiliates_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 9/172: affiliates_links_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'affiliates_links_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.affiliates_links_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 10/172: asset_previews_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'asset_previews_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.asset_previews_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 11/172: audience_members_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'audience_members_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.audience_members_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 12/172: australia_backtax_email_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'australia_backtax_email_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.australia_backtax_email_infos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 13/172: backtax_agreements_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'backtax_agreements_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.backtax_agreements_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 14/172: backtax_collections_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'backtax_collections_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.backtax_collections_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 15/172: balance_transactions_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'balance_transactions_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.balance_transactions_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 16/172: balances_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'balances_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.balances_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 17/172: bank_accounts_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'bank_accounts_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.bank_accounts_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 18/172: banks_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'banks_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.banks_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 19/172: base_variant_integrations_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'base_variant_integrations_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.base_variant_integrations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 20/172: base_variants_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'base_variants_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.base_variants_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 21/172: base_variants_product_files_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'base_variants_product_files_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.base_variants_product_files_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 22/172: base_variants_purchases_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'base_variants_purchases_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.base_variants_purchases_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 23/172: blocked_customer_objects_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'blocked_customer_objects_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.blocked_customer_objects_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 24/172: bundle_product_purchases_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'bundle_product_purchases_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.bundle_product_purchases_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 25/172: bundle_products_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'bundle_products_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.bundle_products_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 26/172: cached_sales_related_products_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'cached_sales_related_products_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.cached_sales_related_products_infos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 27/172: call_availabilities_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'call_availabilities_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.call_availabilities_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 28/172: call_limitation_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'call_limitation_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.call_limitation_infos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 29/172: calls_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'calls_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.calls_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 30/172: cart_products_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'cart_products_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.cart_products_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 31/172: carts_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'carts_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.carts_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 32/172: charge_purchases_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'charge_purchases_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.charge_purchases_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 33/172: charges_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'charges_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.charges_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 34/172: collaborator_invitations_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'collaborator_invitations_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.collaborator_invitations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 35/172: comments_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'comments_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.comments_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 36/172: commission_files_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'commission_files_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.commission_files_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 37/172: commissions_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'commissions_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.commissions_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 38/172: communities_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'communities_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.communities_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 39/172: community_chat_messages_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'community_chat_messages_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.community_chat_messages_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 40/172: community_chat_recap_runs_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'community_chat_recap_runs_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.community_chat_recap_runs_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 41/172: community_chat_recaps_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'community_chat_recaps_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.community_chat_recaps_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 42/172: community_notification_settings_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'community_notification_settings_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.community_notification_settings_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 43/172: computed_sales_analytics_days_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'computed_sales_analytics_days_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.computed_sales_analytics_days_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 44/172: consumption_events_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'consumption_events_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.consumption_events_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 45/172: credit_cards_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'credit_cards_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.credit_cards_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 46/172: credits_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'credits_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.credits_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 47/172: custom_domains_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'custom_domains_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.custom_domains_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 48/172: custom_fields_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'custom_fields_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.custom_fields_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 49/172: custom_fields_products_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'custom_fields_products_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.custom_fields_products_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 50/172: devices_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'devices_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.devices_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 51/172: discover_search_suggestions_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'discover_search_suggestions_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.discover_search_suggestions_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 52/172: discover_searches_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'discover_searches_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.discover_searches_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 53/172: dispute_evidences_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'dispute_evidences_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.dispute_evidences_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 54/172: disputes_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'disputes_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.disputes_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 55/172: dropbox_files_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'dropbox_files_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.dropbox_files_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 56/172: email_info_charges_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'email_info_charges_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.email_info_charges_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 57/172: email_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'email_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.email_infos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 58/172: events_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'events_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.events_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 59/172: followers_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'followers_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.followers_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 60/172: friendly_id_slugs_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'friendly_id_slugs_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.friendly_id_slugs_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 61/172: gifts_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'gifts_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.gifts_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 62/172: gumroad_daily_analytics_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'gumroad_daily_analytics_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.gumroad_daily_analytics_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 63/172: imported_customers_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'imported_customers_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.imported_customers_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 64/172: installment_events_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'installment_events_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.installment_events_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 65/172: installment_rules_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'installment_rules_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.installment_rules_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 66/172: installments_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'installments_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.installments_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 67/172: integrations_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'integrations_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.integrations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 68/172: invites_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'invites_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.invites_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 69/172: large_sellers_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'large_sellers_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.large_sellers_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 70/172: last_read_community_chat_messages_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'last_read_community_chat_messages_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.last_read_community_chat_messages_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 71/172: legacy_permalinks_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'legacy_permalinks_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.legacy_permalinks_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 72/172: licenses_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'licenses_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.licenses_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 73/172: links_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'links_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.links_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 74/172: media_locations_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'media_locations_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.media_locations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 75/172: merchant_accounts_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'merchant_accounts_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.merchant_accounts_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 76/172: oauth_access_grants_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'oauth_access_grants_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.oauth_access_grants_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 77/172: oauth_access_tokens_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'oauth_access_tokens_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.oauth_access_tokens_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 78/172: oauth_applications_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'oauth_applications_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.oauth_applications_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 79/172: offer_codes_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'offer_codes_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.offer_codes_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 80/172: offer_codes_products_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'offer_codes_products_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.offer_codes_products_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 81/172: order_purchases_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'order_purchases_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.order_purchases_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 82/172: orders_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'orders_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.orders_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 83/172: payment_options_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'payment_options_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.payment_options_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 84/172: payments_balances_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'payments_balances_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.payments_balances_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 85/172: payments_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'payments_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.payments_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 86/172: post_email_blasts_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'post_email_blasts_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.post_email_blasts_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 87/172: preorder_links_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'preorder_links_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.preorder_links_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 88/172: preorders_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'preorders_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.preorders_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 89/172: prices_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'prices_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.prices_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 90/172: processor_payment_intents_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'processor_payment_intents_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.processor_payment_intents_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 91/172: product_cached_values_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_cached_values_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_cached_values_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 92/172: product_files_archives_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_files_archives_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_files_archives_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 93/172: product_files_files_archives_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_files_files_archives_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_files_files_archives_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 94/172: product_files_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_files_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_files_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 95/172: product_folders_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_folders_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_folders_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 96/172: product_installment_plans_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_installment_plans_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_installment_plans_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 97/172: product_integrations_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_integrations_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_integrations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 98/172: product_review_responses_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_review_responses_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_review_responses_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 99/172: product_review_stats_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_review_stats_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_review_stats_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 100/172: product_review_videos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_review_videos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_review_videos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 101/172: product_reviews_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_reviews_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_reviews_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 102/172: product_taggings_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'product_taggings_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.product_taggings_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 103/172: public_files_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'public_files_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.public_files_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 104/172: purchase_custom_field_files_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_custom_field_files_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_custom_field_files_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 105/172: purchase_custom_fields_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_custom_fields_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_custom_fields_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 106/172: purchase_early_fraud_warnings_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_early_fraud_warnings_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_early_fraud_warnings_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 107/172: purchase_integrations_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_integrations_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_integrations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 108/172: purchase_offer_code_discounts_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_offer_code_discounts_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_offer_code_discounts_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 109/172: purchase_refund_policies_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_refund_policies_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_refund_policies_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 110/172: purchase_sales_tax_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_sales_tax_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_sales_tax_infos_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 111/172: purchase_taxjar_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_taxjar_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_taxjar_infos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 112/172: purchase_wallet_types_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchase_wallet_types_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchase_wallet_types_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 113/172: purchases_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchases_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchases_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 114/172: purchasing_power_parity_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'purchasing_power_parity_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.purchasing_power_parity_infos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 115/172: recommended_purchase_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'recommended_purchase_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.recommended_purchase_infos_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 116/172: recurring_services_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'recurring_services_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.recurring_services_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 117/172: refund_policies_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'refund_policies_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.refund_policies_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 118/172: refunds_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'refunds_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.refunds_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 119/172: resource_subscriptions_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'resource_subscriptions_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.resource_subscriptions_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 120/172: rich_contents_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'rich_contents_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.rich_contents_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 121/172: sales_export_chunks_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'sales_export_chunks_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.sales_export_chunks_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 122/172: sales_exports_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'sales_exports_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.sales_exports_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 123/172: sales_related_products_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'sales_related_products_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.sales_related_products_infos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 124/172: self_service_affiliate_products_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'self_service_affiliate_products_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.self_service_affiliate_products_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 125/172: seller_profile_sections_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'seller_profile_sections_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.seller_profile_sections_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 126/172: seller_profiles_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'seller_profiles_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.seller_profiles_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 127/172: sent_abandoned_cart_emails_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'sent_abandoned_cart_emails_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.sent_abandoned_cart_emails_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 128/172: sent_email_infos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'sent_email_infos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.sent_email_infos_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 129/172: sent_post_emails_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'sent_post_emails_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.sent_post_emails_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 130/172: service_charges_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'service_charges_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.service_charges_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 131/172: shipments_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'shipments_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.shipments_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 132/172: shipping_destinations_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'shipping_destinations_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.shipping_destinations_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 133/172: signup_events_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'signup_events_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.signup_events_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 134/172: skus_variants_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'skus_variants_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.skus_variants_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 135/172: staff_picked_products_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'staff_picked_products_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.staff_picked_products_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 136/172: stamped_pdfs_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'stamped_pdfs_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.stamped_pdfs_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 137/172: stripe_apple_pay_domains_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'stripe_apple_pay_domains_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.stripe_apple_pay_domains_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 138/172: subscription_events_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'subscription_events_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.subscription_events_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 139/172: subscription_plan_changes_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'subscription_plan_changes_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.subscription_plan_changes_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 140/172: subscriptions_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'subscriptions_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.subscriptions_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 141/172: subtitle_files_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'subtitle_files_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.subtitle_files_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 142/172: tags_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'tags_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.tags_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 143/172: taxonomies_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'taxonomies_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.taxonomies_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 144/172: taxonomy_stats_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'taxonomy_stats_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.taxonomy_stats_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 145/172: team_invitations_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'team_invitations_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.team_invitations_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 146/172: team_memberships_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'team_memberships_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.team_memberships_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 147/172: third_party_analytics_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'third_party_analytics_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.third_party_analytics_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 148/172: thumbnails_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'thumbnails_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.thumbnails_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 149/172: tips_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'tips_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.tips_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 150/172: top_sellers_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'top_sellers_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.top_sellers_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 151/172: tos_agreements_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'tos_agreements_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.tos_agreements_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 152/172: transcoded_videos_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'transcoded_videos_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.transcoded_videos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 153/172: upsell_purchases_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'upsell_purchases_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.upsell_purchases_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 154/172: upsell_variants_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'upsell_variants_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.upsell_variants_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 155/172: upsells_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'upsells_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.upsells_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 156/172: upsells_selected_products_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'upsells_selected_products_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.upsells_selected_products_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 157/172: url_redirects_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'url_redirects_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.url_redirects_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 158/172: user_compliance_info_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'user_compliance_info_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.user_compliance_info_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 159/172: user_compliance_info_requests_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'user_compliance_info_requests_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.user_compliance_info_requests_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 160/172: users_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'users_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.users_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 161/172: utm_link_driven_sales_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'utm_link_driven_sales_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.utm_link_driven_sales_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 162/172: utm_link_visits_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'utm_link_visits_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.utm_link_visits_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 163/172: utm_links_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'utm_links_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.utm_links_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 164/172: variant_categories_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'variant_categories_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.variant_categories_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 165/172: versions_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'versions_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.versions_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 166/172: video_files_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'video_files_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.video_files_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 167/172: wishlist_followers_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'wishlist_followers_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.wishlist_followers_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 168/172: wishlist_products_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'wishlist_products_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.wishlist_products_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 169/172: wishlists_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'wishlists_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.wishlists_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 170/172: workflows_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'workflows_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.workflows_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 171/172: yearly_stats_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'yearly_stats_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.yearly_stats_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- Sequence 172/172: zip_tax_rates_id_seq
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE sequencename = 'zip_tax_rates_id_seq') THEN
        EXECUTE 'CREATE SEQUENCE public.zip_tax_rates_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;';
    END IF;
END $$;

-- ==================================
-- ЭТАП 2: СОЗДАНИЕ БАЗОВЫХ ТАБЛИЦ
-- ==================================
-- Таблица 1/175: active_storage_attachments
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'active_storage_attachments' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.active_storage_attachments (
id bigint NOT NULL,
name character varying(191) NOT NULL,
record_type character varying(191) NOT NULL,
record_id bigint NOT NULL,
blob_id bigint NOT NULL,
created_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы active_storage_attachments: %', SQLERRM;
END $$;

-- Таблица 2/175: active_storage_blobs
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'active_storage_blobs' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.active_storage_blobs (
id bigint NOT NULL,
key character varying(191) NOT NULL,
filename character varying(191) NOT NULL,
content_type character varying(191),
metadata text,
byte_size bigint NOT NULL,
checksum character varying(191),
created_at timestamp without time zone NOT NULL,
service_name character varying NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы active_storage_blobs: %', SQLERRM;
END $$;

-- Таблица 3/175: active_storage_variant_records
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'active_storage_variant_records' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.active_storage_variant_records (
id bigint NOT NULL,
blob_id bigint NOT NULL,
variation_digest character varying NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы active_storage_variant_records: %', SQLERRM;
END $$;

-- Таблица 4/175: admin_action_call_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'admin_action_call_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.admin_action_call_infos (
id bigint NOT NULL,
controller_name character varying NOT NULL,
action_name character varying NOT NULL,
call_count integer DEFAULT 0 NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы admin_action_call_infos: %', SQLERRM;
END $$;

-- Таблица 5/175: affiliate_credits
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'affiliate_credits' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.affiliate_credits (
id integer NOT NULL,
oauth_application_id integer,
basis_points integer,
amount_cents integer,
affiliate_user_id integer,
seller_id integer,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
purchase_id integer,
link_id integer,
affiliate_credit_success_balance_id integer,
affiliate_credit_chargeback_balance_id integer,
affiliate_credit_refund_balance_id integer,
affiliate_id integer,
fee_cents bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы affiliate_credits: %', SQLERRM;
END $$;

-- Таблица 6/175: affiliate_partial_refunds
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'affiliate_partial_refunds' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.affiliate_partial_refunds (
id integer NOT NULL,
amount_cents integer DEFAULT 0,
purchase_id integer NOT NULL,
total_credit_cents integer DEFAULT 0,
affiliate_user_id integer,
seller_id integer,
affiliate_id integer,
balance_id integer,
affiliate_credit_id integer,
created_at timestamp without time zone,
updated_at timestamp without time zone,
fee_cents bigint DEFAULT 0
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы affiliate_partial_refunds: %', SQLERRM;
END $$;

-- Таблица 7/175: affiliate_requests
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'affiliate_requests' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.affiliate_requests (
id bigint NOT NULL,
seller_id bigint NOT NULL,
name character varying(100) NOT NULL,
email character varying NOT NULL,
promotion_text text NOT NULL,
locale character varying DEFAULT ''en''::character varying NOT NULL,
state character varying,
state_transitioned_at timestamp without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы affiliate_requests: %', SQLERRM;
END $$;

-- Таблица 8/175: affiliates
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'affiliates' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.affiliates (
id integer NOT NULL,
seller_id integer,
affiliate_user_id integer,
affiliate_basis_points integer,
created_at timestamp without time zone,
updated_at timestamp without time zone,
deleted_at timestamp without time zone,
flags integer DEFAULT 0 NOT NULL,
destination_url character varying(2083),
type character varying NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы affiliates: %', SQLERRM;
END $$;

-- Таблица 9/175: affiliates_links
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'affiliates_links' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.affiliates_links (
id integer NOT NULL,
affiliate_id integer,
link_id integer,
created_at timestamp without time zone,
updated_at timestamp without time zone,
affiliate_basis_points integer,
destination_url character varying,
flags bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы affiliates_links: %', SQLERRM;
END $$;

-- Таблица 10/175: ar_internal_metadata
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'ar_internal_metadata' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.ar_internal_metadata (
key character varying NOT NULL,
value character varying,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы ar_internal_metadata: %', SQLERRM;
END $$;

-- Таблица 11/175: asset_previews
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'asset_previews' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.asset_previews (
id bigint NOT NULL,
link_id bigint,
guid character varying,
oembed text,
created_at timestamp without time zone,
updated_at timestamp without time zone,
deleted_at timestamp without time zone,
"position" integer,
unsplash_url character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы asset_previews: %', SQLERRM;
END $$;

-- Таблица 12/175: audience_members
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'audience_members' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.audience_members (
id bigint NOT NULL,
seller_id bigint NOT NULL,
email character varying NOT NULL,
details json,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
customer boolean DEFAULT false NOT NULL,
follower boolean DEFAULT false NOT NULL,
affiliate boolean DEFAULT false NOT NULL,
min_paid_cents integer,
max_paid_cents integer,
min_created_at timestamp without time zone,
max_created_at timestamp without time zone,
min_purchase_created_at timestamp without time zone,
max_purchase_created_at timestamp without time zone,
follower_created_at timestamp without time zone,
min_affiliate_created_at timestamp without time zone,
max_affiliate_created_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы audience_members: %', SQLERRM;
END $$;

-- Таблица 13/175: australia_backtax_email_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'australia_backtax_email_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.australia_backtax_email_infos (
id bigint NOT NULL,
user_id bigint,
email_name character varying,
sent_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы australia_backtax_email_infos: %', SQLERRM;
END $$;

-- Таблица 14/175: backtax_agreements
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'backtax_agreements' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.backtax_agreements (
id bigint NOT NULL,
user_id bigint NOT NULL,
jurisdiction character varying,
signature character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
flags bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы backtax_agreements: %', SQLERRM;
END $$;

-- Таблица 15/175: backtax_collections
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'backtax_collections' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.backtax_collections (
id bigint NOT NULL,
user_id bigint NOT NULL,
backtax_agreement_id bigint NOT NULL,
amount_cents integer,
amount_cents_usd integer,
currency character varying,
stripe_transfer_id character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы backtax_collections: %', SQLERRM;
END $$;

-- Таблица 16/175: balance_transactions
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'balance_transactions' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.balance_transactions (
id integer NOT NULL,
created_at timestamp without time zone,
updated_at timestamp without time zone,
user_id integer,
merchant_account_id integer,
balance_id integer,
purchase_id integer,
dispute_id integer,
refund_id integer,
credit_id integer,
occurred_at timestamp without time zone,
issued_amount_currency character varying,
issued_amount_gross_cents integer,
issued_amount_net_cents integer,
holding_amount_currency character varying,
holding_amount_gross_cents integer,
holding_amount_net_cents integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы balance_transactions: %', SQLERRM;
END $$;

-- Таблица 17/175: balances
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'balances' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.balances (
id integer NOT NULL,
user_id integer,
date date,
amount_cents integer DEFAULT 0,
state character varying,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
merchant_account_id integer DEFAULT 1,
currency character varying DEFAULT ''usd''::character varying,
holding_currency character varying DEFAULT ''usd''::character varying,
holding_amount_cents integer DEFAULT 0
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы balances: %', SQLERRM;
END $$;

-- Таблица 18/175: bank_accounts
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'bank_accounts' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.bank_accounts (
id integer NOT NULL,
user_id integer,
bank_number character varying,
account_number bytea,
state character varying,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
account_number_last_four character varying,
account_holder_full_name character varying,
deleted_at timestamp without time zone,
type character varying DEFAULT ''AchAccount''::character varying,
branch_code character varying,
account_type character varying,
stripe_bank_account_id character varying,
stripe_fingerprint character varying,
stripe_connect_account_id character varying,
country character varying(191),
credit_card_id integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы bank_accounts: %', SQLERRM;
END $$;

-- Таблица 19/175: banks
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'banks' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.banks (
id integer NOT NULL,
routing_number character varying,
name character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы banks: %', SQLERRM;
END $$;

-- Таблица 20/175: base_variant_integrations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'base_variant_integrations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.base_variant_integrations (
id bigint NOT NULL,
base_variant_id bigint NOT NULL,
integration_id bigint NOT NULL,
deleted_at timestamp without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы base_variant_integrations: %', SQLERRM;
END $$;

-- Таблица 21/175: base_variants
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'base_variants' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.base_variants (
id integer NOT NULL,
variant_category_id integer,
price_difference_cents integer,
name character varying,
max_purchase_count integer,
deleted_at timestamp without time zone,
created_at timestamp without time zone,
updated_at timestamp without time zone,
type character varying DEFAULT ''Variant''::character varying,
link_id integer,
custom_sku character varying,
flags integer DEFAULT 0 NOT NULL,
description character varying,
position_in_category integer,
customizable_price boolean,
subscription_price_change_effective_date date,
subscription_price_change_message text,
duration_in_minutes integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы base_variants: %', SQLERRM;
END $$;

-- Таблица 22/175: base_variants_product_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'base_variants_product_files' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.base_variants_product_files (
id integer NOT NULL,
base_variant_id integer,
product_file_id integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы base_variants_product_files: %', SQLERRM;
END $$;

-- Таблица 23/175: base_variants_purchases
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'base_variants_purchases' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.base_variants_purchases (
id integer NOT NULL,
purchase_id integer,
base_variant_id integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы base_variants_purchases: %', SQLERRM;
END $$;

-- Таблица 24/175: blocked_customer_objects
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'blocked_customer_objects' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.blocked_customer_objects (
id bigint NOT NULL,
seller_id bigint NOT NULL,
object_type character varying NOT NULL,
object_value character varying NOT NULL,
buyer_email character varying,
blocked_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы blocked_customer_objects: %', SQLERRM;
END $$;

-- Таблица 25/175: bundle_product_purchases
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'bundle_product_purchases' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.bundle_product_purchases (
id bigint NOT NULL,
bundle_purchase_id bigint NOT NULL,
product_purchase_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы bundle_product_purchases: %', SQLERRM;
END $$;

-- Таблица 26/175: bundle_products
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'bundle_products' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.bundle_products (
id bigint NOT NULL,
bundle_id bigint NOT NULL,
product_id bigint NOT NULL,
variant_id bigint,
quantity integer NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
"position" integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы bundle_products: %', SQLERRM;
END $$;

-- Таблица 27/175: cached_sales_related_products_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'cached_sales_related_products_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.cached_sales_related_products_infos (
id bigint NOT NULL,
product_id bigint NOT NULL,
counts json,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы cached_sales_related_products_infos: %', SQLERRM;
END $$;

-- Таблица 28/175: call_availabilities
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'call_availabilities' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.call_availabilities (
id bigint NOT NULL,
call_id bigint NOT NULL,
start_time timestamp(6) without time zone,
end_time timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы call_availabilities: %', SQLERRM;
END $$;

-- Таблица 29/175: call_limitation_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'call_limitation_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.call_limitation_infos (
id bigint NOT NULL,
call_id bigint NOT NULL,
minimum_notice_in_minutes integer,
maximum_calls_per_day integer,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы call_limitation_infos: %', SQLERRM;
END $$;

-- Таблица 30/175: calls
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'calls' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.calls (
id bigint NOT NULL,
purchase_id bigint,
call_url character varying(1024),
start_time timestamp(6) without time zone,
end_time timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
google_calendar_event_id character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы calls: %', SQLERRM;
END $$;

-- Таблица 31/175: cart_products
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'cart_products' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.cart_products (
id bigint NOT NULL,
cart_id bigint NOT NULL,
product_id bigint NOT NULL,
option_id bigint,
affiliate_id bigint,
accepted_offer_id bigint,
price bigint NOT NULL,
quantity integer NOT NULL,
recurrence character varying,
recommended_by character varying,
rent boolean DEFAULT false NOT NULL,
url_parameters json,
referrer text NOT NULL,
recommender_model_name character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
deleted_at timestamp(6) without time zone,
call_start_time timestamp(6) without time zone,
accepted_offer_details json,
pay_in_installments boolean DEFAULT false NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы cart_products: %', SQLERRM;
END $$;

-- Таблица 32/175: carts
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'carts' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.carts (
id bigint NOT NULL,
user_id bigint,
order_id bigint,
return_url text,
discount_codes json,
reject_ppp_discount boolean DEFAULT false NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
email character varying,
browser_guid character varying,
ip_address character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы carts: %', SQLERRM;
END $$;

-- Таблица 33/175: charge_purchases
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'charge_purchases' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.charge_purchases (
id bigint NOT NULL,
charge_id bigint NOT NULL,
purchase_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы charge_purchases: %', SQLERRM;
END $$;

-- Таблица 34/175: charges
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'charges' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.charges (
id bigint NOT NULL,
order_id bigint NOT NULL,
seller_id bigint NOT NULL,
processor character varying,
processor_transaction_id character varying,
payment_method_fingerprint character varying,
credit_card_id bigint,
merchant_account_id bigint,
amount_cents bigint,
gumroad_amount_cents bigint,
processor_fee_cents bigint,
processor_fee_currency character varying,
paypal_order_id character varying,
stripe_payment_intent_id character varying,
stripe_setup_intent_id character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
disputed_at timestamp(6) without time zone,
dispute_reversed_at timestamp(6) without time zone,
flags bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы charges: %', SQLERRM;
END $$;

-- Таблица 35/175: collaborator_invitations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'collaborator_invitations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.collaborator_invitations (
id bigint NOT NULL,
collaborator_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы collaborator_invitations: %', SQLERRM;
END $$;

-- Таблица 36/175: comments
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'comments' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.comments (
id bigint NOT NULL,
commentable_id bigint,
commentable_type character varying,
author_id bigint,
author_name character varying,
content text,
comment_type character varying,
json_data text,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
deleted_at timestamp without time zone,
purchase_id bigint,
ancestry character varying,
ancestry_depth integer DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы comments: %', SQLERRM;
END $$;

-- Таблица 37/175: commission_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'commission_files' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.commission_files (
id bigint NOT NULL,
url character varying(1024),
commission_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы commission_files: %', SQLERRM;
END $$;

-- Таблица 38/175: commissions
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'commissions' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.commissions (
id bigint NOT NULL,
status character varying,
deposit_purchase_id bigint,
completion_purchase_id bigint,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы commissions: %', SQLERRM;
END $$;

-- Таблица 39/175: communities
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'communities' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.communities (
id bigint NOT NULL,
resource_type character varying NOT NULL,
resource_id bigint NOT NULL,
seller_id bigint NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы communities: %', SQLERRM;
END $$;

-- Таблица 40/175: community_chat_messages
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'community_chat_messages' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.community_chat_messages (
id bigint NOT NULL,
community_id bigint NOT NULL,
user_id bigint NOT NULL,
content text NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы community_chat_messages: %', SQLERRM;
END $$;

-- Таблица 41/175: community_chat_recap_runs
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'community_chat_recap_runs' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.community_chat_recap_runs (
id bigint NOT NULL,
recap_frequency character varying NOT NULL,
from_date timestamp(6) without time zone NOT NULL,
to_date timestamp(6) without time zone NOT NULL,
recaps_count integer DEFAULT 0 NOT NULL,
finished_at timestamp(6) without time zone,
notified_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы community_chat_recap_runs: %', SQLERRM;
END $$;

-- Таблица 42/175: community_chat_recaps
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'community_chat_recaps' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.community_chat_recaps (
id bigint NOT NULL,
community_chat_recap_run_id bigint NOT NULL,
community_id bigint,
seller_id bigint,
summarized_message_count integer DEFAULT 0 NOT NULL,
summary text,
status character varying DEFAULT ''pending''::character varying NOT NULL,
error_message character varying,
input_token_count integer DEFAULT 0 NOT NULL,
output_token_count integer DEFAULT 0 NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы community_chat_recaps: %', SQLERRM;
END $$;

-- Таблица 43/175: community_notification_settings
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'community_notification_settings' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.community_notification_settings (
id bigint NOT NULL,
user_id bigint NOT NULL,
seller_id bigint NOT NULL,
recap_frequency character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы community_notification_settings: %', SQLERRM;
END $$;

-- Таблица 44/175: computed_sales_analytics_days
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'computed_sales_analytics_days' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.computed_sales_analytics_days (
id integer NOT NULL,
key character varying(191) NOT NULL,
data text,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы computed_sales_analytics_days: %', SQLERRM;
END $$;

-- Таблица 45/175: consumption_events
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'consumption_events' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.consumption_events (
id bigint NOT NULL,
product_file_id bigint,
url_redirect_id bigint,
purchase_id bigint,
event_type character varying,
platform character varying,
flags integer DEFAULT 0 NOT NULL,
json_data text,
created_at timestamp without time zone,
updated_at timestamp without time zone,
link_id bigint,
consumed_at timestamp without time zone,
media_location_basis_points integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы consumption_events: %', SQLERRM;
END $$;

-- Таблица 46/175: credit_cards
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'credit_cards' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.credit_cards (
id integer NOT NULL,
card_type character varying,
expiry_month integer,
expiry_year integer,
stripe_customer_id character varying,
visual character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
stripe_fingerprint character varying,
cvc_check_failed boolean,
card_country character varying,
stripe_card_id character varying,
card_bin character varying,
preorder_id integer,
card_data_handling_mode character varying,
charge_processor_id character varying,
braintree_customer_id character varying,
funding_type character varying(191),
paypal_billing_agreement_id character varying(191),
processor_payment_method_id character varying,
json_data json
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы credit_cards: %', SQLERRM;
END $$;

-- Таблица 47/175: credits
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'credits' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.credits (
id integer NOT NULL,
user_id integer,
amount_cents integer,
balance_id integer,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
crediting_user_id integer,
chargebacked_purchase_id integer,
merchant_account_id integer DEFAULT 1,
dispute_id integer,
returned_payment_id integer,
refund_id integer,
financing_paydown_purchase_id integer,
fee_retention_refund_id integer,
backtax_agreement_id bigint,
json_data text
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы credits: %', SQLERRM;
END $$;

-- Таблица 48/175: custom_domains
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'custom_domains' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.custom_domains (
id integer NOT NULL,
user_id integer,
domain character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
ssl_certificate_issued_at timestamp without time zone,
deleted_at timestamp without time zone,
state character varying DEFAULT ''unverified''::character varying NOT NULL,
failed_verification_attempts_count integer DEFAULT 0 NOT NULL,
product_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы custom_domains: %', SQLERRM;
END $$;

-- Таблица 49/175: custom_fields
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'custom_fields' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.custom_fields (
id bigint NOT NULL,
field_type character varying,
name character varying,
required boolean DEFAULT false,
global boolean DEFAULT false,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
seller_id bigint NOT NULL,
flags bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы custom_fields: %', SQLERRM;
END $$;

-- Таблица 50/175: custom_fields_products
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'custom_fields_products' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.custom_fields_products (
id bigint NOT NULL,
custom_field_id bigint NOT NULL,
product_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы custom_fields_products: %', SQLERRM;
END $$;

-- Таблица 51/175: devices
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'devices' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.devices (
id integer NOT NULL,
token character varying NOT NULL,
app_version character varying,
device_type character varying DEFAULT ''ios''::character varying NOT NULL,
user_id integer NOT NULL,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
app_type character varying DEFAULT ''consumer''::character varying NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы devices: %', SQLERRM;
END $$;

-- Таблица 52/175: discover_search_suggestions
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'discover_search_suggestions' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.discover_search_suggestions (
id bigint NOT NULL,
discover_search_id bigint,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы discover_search_suggestions: %', SQLERRM;
END $$;

-- Таблица 53/175: discover_searches
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'discover_searches' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.discover_searches (
id bigint NOT NULL,
query character varying,
taxonomy_id bigint,
user_id bigint,
ip_address character varying,
browser_guid character varying,
autocomplete boolean DEFAULT false NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
clicked_resource_type character varying,
clicked_resource_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы discover_searches: %', SQLERRM;
END $$;

-- Таблица 54/175: dispute_evidences
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'dispute_evidences' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.dispute_evidences (
id bigint NOT NULL,
dispute_id bigint NOT NULL,
purchased_at timestamp(6) without time zone,
customer_purchase_ip character varying,
customer_email character varying,
customer_name character varying,
billing_address character varying,
shipping_address character varying,
shipped_at timestamp(6) without time zone,
shipping_carrier character varying,
shipping_tracking_number character varying,
uncategorized_text text,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
product_description text,
cancellation_policy_disclosure text,
refund_policy_disclosure text,
cancellation_rebuttal text,
refund_refusal_explanation text,
seller_contacted_at timestamp(6) without time zone,
seller_submitted_at timestamp(6) without time zone,
resolved_at timestamp(6) without time zone,
resolution character varying DEFAULT ''unknown''::character varying,
error_message character varying,
access_activity_log text,
reason_for_winning text
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы dispute_evidences: %', SQLERRM;
END $$;

-- Таблица 55/175: disputes
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'disputes' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.disputes (
id integer NOT NULL,
purchase_id integer,
charge_processor_id character varying,
charge_processor_dispute_id character varying,
reason character varying,
state character varying,
initiated_at timestamp without time zone,
closed_at timestamp without time zone,
formalized_at timestamp without time zone,
won_at timestamp without time zone,
lost_at timestamp without time zone,
created_at timestamp without time zone,
updated_at timestamp without time zone,
service_charge_id integer,
seller_id bigint,
event_created_at timestamp(6) without time zone,
charge_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы disputes: %', SQLERRM;
END $$;

-- Таблица 56/175: dropbox_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'dropbox_files' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.dropbox_files (
id integer NOT NULL,
state character varying,
dropbox_url character varying(2000),
expires_at timestamp without time zone,
deleted_at timestamp without time zone,
user_id integer,
product_file_id integer,
link_id integer,
json_data text,
s3_url character varying(2000),
created_at timestamp without time zone,
updated_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы dropbox_files: %', SQLERRM;
END $$;

-- Таблица 57/175: email_info_charges
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'email_info_charges' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.email_info_charges (
id bigint NOT NULL,
email_info_id bigint NOT NULL,
charge_id bigint NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы email_info_charges: %', SQLERRM;
END $$;

-- Таблица 58/175: email_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'email_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.email_infos (
id bigint NOT NULL,
purchase_id bigint,
installment_id bigint,
type character varying,
email_name character varying,
state character varying,
sent_at timestamp without time zone,
delivered_at timestamp without time zone,
opened_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы email_infos: %', SQLERRM;
END $$;

-- Таблица 59/175: events
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'events' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.events (
id integer NOT NULL,
visit_id integer,
ip_address character varying,
event_name character varying,
user_id integer,
link_id integer,
created_at timestamp without time zone,
updated_at timestamp without time zone,
referrer character varying,
parent_referrer character varying,
language character varying,
browser character varying,
is_mobile boolean DEFAULT false,
email character varying,
purchase_id integer,
price_cents integer,
credit_card_id integer,
card_type character varying,
card_visual character varying,
purchase_state character varying,
billing_zip character varying,
chargeback boolean DEFAULT false,
refunded boolean DEFAULT false,
view_url character varying,
fingerprint character varying,
ip_country character varying,
ip_longitude double precision,
ip_latitude double precision,
is_modal boolean,
friend_actions text,
browser_fingerprint character varying,
browser_plugins character varying,
browser_guid character varying,
referrer_domain character varying,
ip_state character varying,
active_test_path_assignments character varying,
service_charge_id integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы events: %', SQLERRM;
END $$;

-- Таблица 60/175: followers
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'followers' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.followers (
id integer NOT NULL,
followed_id integer NOT NULL,
email character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
follower_user_id integer,
source character varying,
source_product_id integer,
confirmed_at timestamp without time zone,
deleted_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы followers: %', SQLERRM;
END $$;

-- Таблица 61/175: friendly_id_slugs
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'friendly_id_slugs' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.friendly_id_slugs (
id integer NOT NULL,
slug character varying(191) NOT NULL,
sluggable_id integer NOT NULL,
sluggable_type character varying(50),
scope character varying(191),
created_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы friendly_id_slugs: %', SQLERRM;
END $$;

-- Таблица 62/175: gifts
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'gifts' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.gifts (
id bigint NOT NULL,
giftee_purchase_id bigint,
gifter_purchase_id bigint,
link_id bigint,
state character varying,
gift_note text,
giftee_email character varying,
gifter_email character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
flags bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы gifts: %', SQLERRM;
END $$;

-- Таблица 63/175: gumroad_daily_analytics
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'gumroad_daily_analytics' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.gumroad_daily_analytics (
id bigint NOT NULL,
period_ended_at timestamp(6) without time zone NOT NULL,
gumroad_price_cents integer NOT NULL,
gumroad_fee_cents integer NOT NULL,
creators_with_sales integer NOT NULL,
gumroad_discover_price_cents integer NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы gumroad_daily_analytics: %', SQLERRM;
END $$;

-- Таблица 64/175: imported_customers
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'imported_customers' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.imported_customers (
id integer NOT NULL,
email character varying,
purchase_date timestamp without time zone,
link_id integer,
importing_user_id integer,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
deleted_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы imported_customers: %', SQLERRM;
END $$;

-- Таблица 65/175: installment_events
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'installment_events' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.installment_events (
id integer NOT NULL,
event_id integer,
installment_id integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы installment_events: %', SQLERRM;
END $$;

-- Таблица 66/175: installment_rules
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'installment_rules' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.installment_rules (
id integer NOT NULL,
installment_id integer,
delayed_delivery_time integer,
to_be_published_at timestamp without time zone,
version integer DEFAULT 0 NOT NULL,
deleted_at timestamp without time zone,
created_at timestamp without time zone,
updated_at timestamp without time zone,
time_period character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы installment_rules: %', SQLERRM;
END $$;

-- Таблица 67/175: installments
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'installments' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.installments (
id integer NOT NULL,
link_id integer,
message text,
url text,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
name character varying,
published_at timestamp without time zone,
deleted_at timestamp without time zone,
flags integer DEFAULT 0 NOT NULL,
seller_id integer,
installment_type character varying,
json_data text,
customer_count integer,
workflow_id integer,
call_to_action_text character varying(2083),
call_to_action_url character varying(2083),
cover_image_url character varying,
base_variant_id integer,
slug character varying,
installment_events_count integer DEFAULT 0
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы installments: %', SQLERRM;
END $$;

-- Таблица 68/175: integrations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'integrations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.integrations (
id bigint NOT NULL,
api_key character varying,
json_data text,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
flags bigint DEFAULT 0 NOT NULL,
type character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы integrations: %', SQLERRM;
END $$;

-- Таблица 69/175: invites
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'invites' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.invites (
id integer NOT NULL,
sender_id integer,
receiver_email character varying,
receiver_id integer,
invite_state character varying,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы invites: %', SQLERRM;
END $$;

-- Таблица 70/175: large_sellers
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'large_sellers' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.large_sellers (
id integer NOT NULL,
user_id integer NOT NULL,
sales_count integer DEFAULT 0 NOT NULL,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы large_sellers: %', SQLERRM;
END $$;

-- Таблица 71/175: last_read_community_chat_messages
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'last_read_community_chat_messages' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.last_read_community_chat_messages (
id bigint NOT NULL,
user_id bigint NOT NULL,
community_id bigint NOT NULL,
community_chat_message_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы last_read_community_chat_messages: %', SQLERRM;
END $$;

-- Таблица 72/175: legacy_permalinks
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'legacy_permalinks' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.legacy_permalinks (
id bigint NOT NULL,
permalink character varying NOT NULL,
product_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы legacy_permalinks: %', SQLERRM;
END $$;

-- Таблица 73/175: licenses
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'licenses' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.licenses (
id integer NOT NULL,
link_id integer,
purchase_id integer,
serial character varying,
trial_expires_at timestamp without time zone,
uses integer DEFAULT 0,
json_data character varying,
deleted_at timestamp without time zone,
flags integer DEFAULT 0,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
imported_customer_id integer,
disabled_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы licenses: %', SQLERRM;
END $$;

-- Таблица 74/175: links
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'links' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.links (
id bigint NOT NULL,
user_id bigint,
name character varying NOT NULL,
unique_permalink character varying,
preview_url text,
description text,
purchase_type integer DEFAULT 0,
created_at timestamp without time zone,
updated_at timestamp(6) without time zone,
purchase_disabled_at timestamp without time zone,
deleted_at timestamp without time zone,
price_cents integer,
price_currency_type character varying DEFAULT ''usd''::character varying,
customizable_price boolean,
max_purchase_count integer,
bad_card_counter integer DEFAULT 0,
require_shipping boolean DEFAULT false,
last_partner_sync timestamp without time zone,
preview_oembed text,
showcaseable boolean DEFAULT false,
custom_receipt text,
custom_filetype character varying,
filetype character varying DEFAULT ''link''::character varying,
filegroup character varying DEFAULT ''url''::character varying,
size bigint,
bitrate integer,
framerate integer,
pagelength integer,
duration integer,
width integer,
height integer,
custom_permalink character varying,
common_color character varying,
suggested_price_cents integer,
banned_at timestamp without time zone,
risk_score integer,
risk_score_updated_at timestamp without time zone,
draft boolean DEFAULT false,
flags bigint DEFAULT 0 NOT NULL,
subscription_duration integer,
json_data text,
external_mapping_id character varying,
affiliate_application_id bigint,
rental_price_cents integer,
duration_in_months integer,
migrated_to_tiered_pricing_at timestamp without time zone,
free_trial_duration_unit integer,
free_trial_duration_amount integer,
content_updated_at timestamp without time zone,
taxonomy_id bigint,
native_type character varying DEFAULT ''digital''::character varying NOT NULL,
discover_fee_per_thousand integer DEFAULT 100 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы links: %', SQLERRM;
END $$;

-- Таблица 75/175: media_locations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'media_locations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.media_locations (
id bigint NOT NULL,
product_file_id bigint NOT NULL,
url_redirect_id bigint NOT NULL,
purchase_id bigint NOT NULL,
product_id bigint NOT NULL,
consumed_at timestamp without time zone,
platform character varying,
location integer NOT NULL,
content_length integer,
unit character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы media_locations: %', SQLERRM;
END $$;

-- Таблица 76/175: merchant_accounts
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'merchant_accounts' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.merchant_accounts (
id bigint NOT NULL,
user_id bigint,
acquirer_id character varying,
acquirer_merchant_id character varying,
charge_processor_id character varying,
charge_processor_merchant_id character varying,
json_data text,
created_at timestamp without time zone,
updated_at timestamp without time zone,
deleted_at timestamp without time zone,
charge_processor_verified_at timestamp without time zone,
country character varying DEFAULT ''US''::character varying,
currency character varying DEFAULT ''usd''::character varying,
charge_processor_deleted_at timestamp without time zone,
charge_processor_alive_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы merchant_accounts: %', SQLERRM;
END $$;

-- Таблица 77/175: oauth_access_grants
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'oauth_access_grants' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.oauth_access_grants (
id integer NOT NULL,
resource_owner_id integer NOT NULL,
application_id integer NOT NULL,
token character varying NOT NULL,
expires_in integer NOT NULL,
redirect_uri character varying NOT NULL,
created_at timestamp without time zone NOT NULL,
revoked_at timestamp without time zone,
scopes character varying DEFAULT ''''::character varying NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы oauth_access_grants: %', SQLERRM;
END $$;

-- Таблица 78/175: oauth_access_tokens
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'oauth_access_tokens' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.oauth_access_tokens (
id integer NOT NULL,
resource_owner_id integer,
application_id integer NOT NULL,
token character varying NOT NULL,
refresh_token character varying,
expires_in integer,
revoked_at timestamp without time zone,
created_at timestamp without time zone NOT NULL,
scopes character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы oauth_access_tokens: %', SQLERRM;
END $$;

-- Таблица 79/175: oauth_applications
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'oauth_applications' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.oauth_applications (
id integer NOT NULL,
name character varying NOT NULL,
uid character varying NOT NULL,
secret character varying NOT NULL,
redirect_uri character varying NOT NULL,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
owner_id integer,
owner_type character varying DEFAULT ''User''::character varying,
affiliate_basis_points integer,
deleted_at timestamp without time zone,
scopes character varying DEFAULT ''''::character varying NOT NULL,
confidential boolean DEFAULT false NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы oauth_applications: %', SQLERRM;
END $$;

-- Таблица 80/175: offer_codes
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'offer_codes' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.offer_codes (
id integer NOT NULL,
link_id integer,
name character varying,
amount_cents integer,
max_purchase_count integer,
deleted_at timestamp without time zone,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
amount_percentage integer,
user_id integer,
currency_type character varying,
code character varying,
universal boolean DEFAULT false NOT NULL,
valid_at timestamp without time zone,
expires_at timestamp without time zone,
minimum_quantity integer,
duration_in_months integer,
minimum_amount_cents integer,
flags bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы offer_codes: %', SQLERRM;
END $$;

-- Таблица 81/175: offer_codes_products
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'offer_codes_products' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.offer_codes_products (
id bigint NOT NULL,
offer_code_id bigint,
product_id bigint,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы offer_codes_products: %', SQLERRM;
END $$;

-- Таблица 82/175: order_purchases
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'order_purchases' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.order_purchases (
id bigint NOT NULL,
order_id bigint NOT NULL,
purchase_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы order_purchases: %', SQLERRM;
END $$;

-- Таблица 83/175: orders
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'orders' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.orders (
id bigint NOT NULL,
purchaser_id bigint,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
flags bigint DEFAULT 0 NOT NULL,
review_reminder_scheduled_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы orders: %', SQLERRM;
END $$;

-- Таблица 84/175: payment_options
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'payment_options' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.payment_options (
id integer NOT NULL,
subscription_id integer,
price_id integer,
created_at timestamp without time zone,
updated_at timestamp without time zone,
deleted_at timestamp without time zone,
flags integer DEFAULT 0 NOT NULL,
product_installment_plan_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы payment_options: %', SQLERRM;
END $$;

-- Таблица 85/175: payments
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'payments' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.payments (
id bigint NOT NULL,
user_id bigint,
state character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
txn_id character varying,
processor_fee_cents integer,
correlation_id character varying,
processor character varying,
amount_cents bigint,
payment_address character varying,
payout_period_end_date date,
bank_account_id bigint,
amount_cents_in_local_currency integer,
stripe_connect_account_id character varying,
stripe_transfer_id character varying,
stripe_internal_transfer_id character varying,
currency character varying DEFAULT ''usd''::character varying,
flags integer DEFAULT 0 NOT NULL,
json_data text,
failure_reason character varying(191),
processor_reversing_payout_id character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы payments: %', SQLERRM;
END $$;

-- Таблица 86/175: payments_balances
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'payments_balances' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.payments_balances (
id integer NOT NULL,
payment_id integer,
balance_id integer,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы payments_balances: %', SQLERRM;
END $$;

-- Таблица 87/175: post_email_blasts
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'post_email_blasts' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.post_email_blasts (
id bigint NOT NULL,
post_id bigint NOT NULL,
seller_id bigint NOT NULL,
requested_at timestamp(6) without time zone,
started_at timestamp(6) without time zone,
first_email_delivered_at timestamp(6) without time zone,
last_email_delivered_at timestamp(6) without time zone,
delivery_count integer DEFAULT 0,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
completed_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы post_email_blasts: %', SQLERRM;
END $$;

-- Таблица 88/175: preorder_links
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'preorder_links' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.preorder_links (
id bigint NOT NULL,
link_id bigint,
state character varying,
release_at timestamp without time zone,
url character varying,
custom_filetype character varying,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы preorder_links: %', SQLERRM;
END $$;

-- Таблица 89/175: preorders
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'preorders' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.preorders (
id integer NOT NULL,
preorder_link_id integer NOT NULL,
seller_id integer NOT NULL,
purchaser_id integer,
state character varying NOT NULL,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы preorders: %', SQLERRM;
END $$;

-- Таблица 90/175: prices
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'prices' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.prices (
id integer NOT NULL,
link_id integer,
price_cents integer DEFAULT 0 NOT NULL,
currency character varying DEFAULT ''usd''::character varying,
recurrence character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
deleted_at timestamp without time zone,
flags integer DEFAULT 0 NOT NULL,
variant_id integer,
suggested_price_cents integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы prices: %', SQLERRM;
END $$;

-- Таблица 91/175: processor_payment_intents
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'processor_payment_intents' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.processor_payment_intents (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
intent_id character varying NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы processor_payment_intents: %', SQLERRM;
END $$;

-- Таблица 92/175: product_cached_values
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_cached_values' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_cached_values (
id bigint NOT NULL,
product_id bigint NOT NULL,
expired boolean DEFAULT false NOT NULL,
successful_sales_count integer,
remaining_for_sale_count integer,
monthly_recurring_revenue numeric(10,2),
revenue_pending numeric(10,2),
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
total_usd_cents bigint DEFAULT 0
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_cached_values: %', SQLERRM;
END $$;

-- Таблица 93/175: product_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_files' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_files (
id bigint NOT NULL,
link_id bigint,
url character varying(1024),
filetype character varying,
filegroup character varying,
size bigint,
bitrate integer,
framerate integer,
pagelength integer,
duration integer,
width integer,
height integer,
flags bigint DEFAULT 0 NOT NULL,
json_data text,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
"position" integer,
installment_id bigint,
display_name character varying(1024),
deleted_from_cdn_at timestamp(6) without time zone,
description text,
folder_id bigint,
stampable_pdf boolean
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_files: %', SQLERRM;
END $$;

-- Таблица 94/175: product_files_archives
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_files_archives' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_files_archives (
id bigint NOT NULL,
deleted_at timestamp(6) without time zone,
link_id bigint,
installment_id bigint,
product_files_archive_state character varying,
created_at timestamp(6) without time zone,
updated_at timestamp(6) without time zone,
url character varying(1024),
deleted_from_cdn_at timestamp(6) without time zone,
variant_id bigint,
digest character varying,
folder_id character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_files_archives: %', SQLERRM;
END $$;

-- Таблица 95/175: product_files_files_archives
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_files_files_archives' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_files_files_archives (
id integer NOT NULL,
product_file_id integer,
product_files_archive_id integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_files_files_archives: %', SQLERRM;
END $$;

-- Таблица 96/175: product_folders
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_folders' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_folders (
id bigint NOT NULL,
product_id bigint,
name character varying NOT NULL,
"position" integer,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
deleted_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_folders: %', SQLERRM;
END $$;

-- Таблица 97/175: product_installment_plans
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_installment_plans' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_installment_plans (
id bigint NOT NULL,
link_id bigint NOT NULL,
number_of_installments integer NOT NULL,
recurrence character varying NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
deleted_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_installment_plans: %', SQLERRM;
END $$;

-- Таблица 98/175: product_integrations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_integrations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_integrations (
id bigint NOT NULL,
product_id bigint NOT NULL,
integration_id bigint NOT NULL,
deleted_at timestamp without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_integrations: %', SQLERRM;
END $$;

-- Таблица 99/175: product_review_responses
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_review_responses' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_review_responses (
id bigint NOT NULL,
user_id bigint NOT NULL,
product_review_id bigint NOT NULL,
message text,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_review_responses: %', SQLERRM;
END $$;

-- Таблица 100/175: product_review_stats
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_review_stats' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_review_stats (
id integer NOT NULL,
link_id integer,
reviews_count integer DEFAULT 0 NOT NULL,
average_rating double precision DEFAULT 0.0 NOT NULL,
ratings_of_one_count integer DEFAULT 0,
ratings_of_two_count integer DEFAULT 0,
ratings_of_three_count integer DEFAULT 0,
ratings_of_four_count integer DEFAULT 0,
ratings_of_five_count integer DEFAULT 0,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_review_stats: %', SQLERRM;
END $$;

-- Таблица 101/175: product_review_videos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_review_videos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_review_videos (
id bigint NOT NULL,
product_review_id bigint NOT NULL,
approval_status character varying DEFAULT ''pending_review''::character varying,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_review_videos: %', SQLERRM;
END $$;

-- Таблица 102/175: product_reviews
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_reviews' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_reviews (
id bigint NOT NULL,
purchase_id bigint,
rating integer,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
link_id bigint,
message text,
has_message boolean DEFAULT false NOT NULL,
deleted_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_reviews: %', SQLERRM;
END $$;

-- Таблица 103/175: product_taggings
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'product_taggings' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.product_taggings (
id integer NOT NULL,
tag_id integer,
product_id integer,
created_at timestamp without time zone,
updated_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы product_taggings: %', SQLERRM;
END $$;

-- Таблица 104/175: public_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'public_files' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.public_files (
id bigint NOT NULL,
seller_id bigint,
resource_type character varying NOT NULL,
resource_id bigint NOT NULL,
public_id character varying NOT NULL,
display_name character varying NOT NULL,
original_file_name character varying NOT NULL,
file_type character varying,
file_group character varying,
deleted_at timestamp(6) without time zone,
scheduled_for_deletion_at timestamp(6) without time zone,
json_data text,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы public_files: %', SQLERRM;
END $$;

-- Таблица 105/175: purchase_custom_field_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_custom_field_files' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_custom_field_files (
id bigint NOT NULL,
url character varying,
purchase_custom_field_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_custom_field_files: %', SQLERRM;
END $$;

-- Таблица 106/175: purchase_custom_fields
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_custom_fields' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_custom_fields (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
field_type character varying NOT NULL,
name character varying NOT NULL,
value text,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
bundle_product_id bigint,
custom_field_id bigint,
flags bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_custom_fields: %', SQLERRM;
END $$;

-- Таблица 107/175: purchase_early_fraud_warnings
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_early_fraud_warnings' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_early_fraud_warnings (
id bigint NOT NULL,
purchase_id bigint,
processor_id character varying NOT NULL,
dispute_id bigint,
refund_id bigint,
fraud_type character varying NOT NULL,
actionable boolean NOT NULL,
charge_risk_level character varying NOT NULL,
processor_created_at timestamp(6) without time zone NOT NULL,
resolution character varying DEFAULT ''unknown''::character varying,
resolved_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
resolution_message character varying,
charge_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_early_fraud_warnings: %', SQLERRM;
END $$;

-- Таблица 108/175: purchase_integrations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_integrations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_integrations (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
integration_id bigint NOT NULL,
deleted_at timestamp without time zone,
discord_user_id character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_integrations: %', SQLERRM;
END $$;

-- Таблица 109/175: purchase_offer_code_discounts
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_offer_code_discounts' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_offer_code_discounts (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
offer_code_id bigint NOT NULL,
offer_code_amount integer NOT NULL,
offer_code_is_percent boolean DEFAULT false NOT NULL,
pre_discount_minimum_price_cents integer NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
duration_in_months integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_offer_code_discounts: %', SQLERRM;
END $$;

-- Таблица 110/175: purchase_refund_policies
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_refund_policies' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_refund_policies (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
title character varying NOT NULL,
fine_print text,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
max_refund_period_in_days integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_refund_policies: %', SQLERRM;
END $$;

-- Таблица 111/175: purchase_sales_tax_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_sales_tax_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_sales_tax_infos (
id integer NOT NULL,
purchase_id integer,
elected_country_code character varying,
card_country_code character varying,
ip_country_code character varying,
country_code character varying,
postal_code character varying,
ip_address character varying,
business_vat_id character varying(191),
state_code character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_sales_tax_infos: %', SQLERRM;
END $$;

-- Таблица 112/175: purchase_taxjar_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_taxjar_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_taxjar_infos (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
combined_tax_rate numeric(8,7),
county_tax_rate numeric(8,7),
city_tax_rate numeric(8,7),
state_tax_rate numeric(8,7),
jurisdiction_state character varying,
jurisdiction_county character varying,
jurisdiction_city character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
gst_tax_rate numeric(8,7),
pst_tax_rate numeric(8,7),
qst_tax_rate numeric(8,7)
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_taxjar_infos: %', SQLERRM;
END $$;

-- Таблица 113/175: purchase_wallet_types
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchase_wallet_types' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchase_wallet_types (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
wallet_type character varying NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchase_wallet_types: %', SQLERRM;
END $$;

-- Таблица 114/175: purchases
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchases' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchases (
id bigint NOT NULL,
seller_id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
fee_cents integer,
link_id bigint,
email text,
price_cents integer,
displayed_price_cents integer,
displayed_price_currency_type character varying DEFAULT ''usd''::character varying,
rate_converted_to_usd character varying,
street_address character varying,
city character varying,
state character varying,
zip_code character varying,
country character varying,
full_name character varying,
credit_card_id bigint,
purchaser_id bigint,
purchaser_type character varying DEFAULT ''User''::character varying,
session_id character varying,
ip_address character varying,
is_mobile boolean,
stripe_refunded boolean,
stripe_transaction_id character varying,
stripe_fingerprint character varying,
stripe_card_id character varying,
can_contact boolean DEFAULT true,
referrer character varying,
stripe_status character varying,
variants text,
chargeback_date timestamp without time zone,
webhook_failed boolean DEFAULT false,
failed boolean DEFAULT false,
card_type character varying,
card_visual character varying,
purchase_state character varying,
processor_fee_cents integer,
succeeded_at timestamp without time zone,
card_country character varying,
stripe_error_code character varying,
browser_guid character varying,
error_code character varying,
card_bin character varying,
custom_fields text,
ip_country character varying,
ip_state character varying,
purchase_success_balance_id bigint,
purchase_chargeback_balance_id bigint,
purchase_refund_balance_id bigint,
flags bigint DEFAULT 0 NOT NULL,
offer_code_id bigint,
subscription_id bigint,
preorder_id bigint,
card_expiry_month integer,
card_expiry_year integer,
tax_cents integer DEFAULT 0,
affiliate_credit_cents integer DEFAULT 0,
credit_card_zipcode character varying,
json_data character varying,
card_data_handling_mode character varying,
charge_processor_id character varying,
total_transaction_cents integer,
gumroad_tax_cents integer,
zip_tax_rate_id bigint,
quantity integer DEFAULT 1 NOT NULL,
merchant_account_id bigint,
shipping_cents integer DEFAULT 0,
affiliate_id bigint,
processor_fee_cents_currency character varying DEFAULT ''usd''::character varying,
stripe_partially_refunded boolean DEFAULT false,
paypal_order_id character varying(191),
rental_expired boolean,
processor_payment_intent_id character varying,
processor_setup_intent_id character varying,
price_id bigint,
recommended_by character varying,
deleted_at timestamp without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchases: %', SQLERRM;
END $$;

-- Таблица 115/175: purchasing_power_parity_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'purchasing_power_parity_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.purchasing_power_parity_infos (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
factor integer,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы purchasing_power_parity_infos: %', SQLERRM;
END $$;

-- Таблица 116/175: recommended_purchase_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'recommended_purchase_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.recommended_purchase_infos (
id integer NOT NULL,
created_at timestamp without time zone,
updated_at timestamp without time zone,
purchase_id integer,
recommended_link_id integer,
recommended_by_link_id integer,
recommendation_type character varying,
flags integer DEFAULT 0 NOT NULL,
discover_fee_per_thousand integer,
recommender_model_name character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы recommended_purchase_infos: %', SQLERRM;
END $$;

-- Таблица 117/175: recurring_services
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'recurring_services' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.recurring_services (
id integer NOT NULL,
created_at timestamp without time zone,
updated_at timestamp without time zone,
user_id integer,
type character varying(191),
price_cents integer,
recurrence integer,
failed_at timestamp without time zone,
cancelled_at timestamp without time zone,
state character varying(191),
json_data character varying(191)
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы recurring_services: %', SQLERRM;
END $$;

-- Таблица 118/175: refund_policies
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'refund_policies' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.refund_policies (
id bigint NOT NULL,
seller_id bigint NOT NULL,
product_id bigint,
title character varying,
fine_print text,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
max_refund_period_in_days integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы refund_policies: %', SQLERRM;
END $$;

-- Таблица 119/175: refunds
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'refunds' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.refunds (
id bigint NOT NULL,
amount_cents integer DEFAULT 0,
purchase_id bigint,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
refunding_user_id bigint,
creator_tax_cents integer,
gumroad_tax_cents integer,
total_transaction_cents integer,
json_data text,
link_id bigint,
status character varying(191) DEFAULT ''succeeded''::character varying,
processor_refund_id character varying(191),
fee_cents integer,
flags bigint DEFAULT 0 NOT NULL,
seller_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы refunds: %', SQLERRM;
END $$;

-- Таблица 120/175: resource_subscriptions
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'resource_subscriptions' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.resource_subscriptions (
id integer NOT NULL,
oauth_application_id integer NOT NULL,
user_id integer NOT NULL,
resource_name character varying NOT NULL,
post_url character varying,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL,
deleted_at timestamp without time zone,
content_type character varying DEFAULT ''application/x-www-form-urlencoded''::character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы resource_subscriptions: %', SQLERRM;
END $$;

-- Таблица 121/175: rich_contents
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'rich_contents' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.rich_contents (
id bigint NOT NULL,
entity_id bigint NOT NULL,
entity_type character varying NOT NULL,
description json NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
deleted_at timestamp without time zone,
title character varying,
"position" integer DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы rich_contents: %', SQLERRM;
END $$;

-- Таблица 122/175: sales_export_chunks
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'sales_export_chunks' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.sales_export_chunks (
id bigint NOT NULL,
export_id bigint NOT NULL,
purchase_ids text,
custom_fields text,
purchases_data text,
processed boolean DEFAULT false NOT NULL,
revision character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы sales_export_chunks: %', SQLERRM;
END $$;

-- Таблица 123/175: sales_exports
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'sales_exports' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.sales_exports (
id bigint NOT NULL,
recipient_id bigint NOT NULL,
query text,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы sales_exports: %', SQLERRM;
END $$;

-- Таблица 124/175: sales_related_products_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'sales_related_products_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.sales_related_products_infos (
id bigint NOT NULL,
smaller_product_id bigint NOT NULL,
larger_product_id bigint NOT NULL,
sales_count integer DEFAULT 0 NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы sales_related_products_infos: %', SQLERRM;
END $$;

-- Таблица 125/175: schema_migrations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'schema_migrations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.schema_migrations (
version character varying NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы schema_migrations: %', SQLERRM;
END $$;

-- Таблица 126/175: self_service_affiliate_products
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'self_service_affiliate_products' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.self_service_affiliate_products (
id bigint NOT NULL,
seller_id bigint NOT NULL,
product_id bigint NOT NULL,
enabled boolean DEFAULT false NOT NULL,
affiliate_basis_points integer NOT NULL,
destination_url character varying(2083),
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы self_service_affiliate_products: %', SQLERRM;
END $$;

-- Таблица 127/175: seller_profile_sections
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'seller_profile_sections' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.seller_profile_sections (
id bigint NOT NULL,
seller_id bigint NOT NULL,
header character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
flags bigint DEFAULT 0 NOT NULL,
json_data json,
type character varying DEFAULT ''SellerProfileProductsSection''::character varying NOT NULL,
product_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы seller_profile_sections: %', SQLERRM;
END $$;

-- Таблица 128/175: seller_profiles
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'seller_profiles' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.seller_profiles (
id bigint NOT NULL,
seller_id bigint NOT NULL,
highlight_color character varying,
background_color character varying,
font character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
json_data json
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы seller_profiles: %', SQLERRM;
END $$;

-- Таблица 129/175: sent_abandoned_cart_emails
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'sent_abandoned_cart_emails' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.sent_abandoned_cart_emails (
id bigint NOT NULL,
cart_id bigint NOT NULL,
installment_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы sent_abandoned_cart_emails: %', SQLERRM;
END $$;

-- Таблица 130/175: sent_email_infos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'sent_email_infos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.sent_email_infos (
id integer NOT NULL,
key character varying(40) NOT NULL,
created_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы sent_email_infos: %', SQLERRM;
END $$;

-- Таблица 131/175: sent_post_emails
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'sent_post_emails' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.sent_post_emails (
id bigint NOT NULL,
post_id bigint NOT NULL,
email character varying NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы sent_post_emails: %', SQLERRM;
END $$;

-- Таблица 132/175: service_charges
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'service_charges' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.service_charges (
id integer NOT NULL,
created_at timestamp without time zone,
updated_at timestamp without time zone,
user_id integer,
recurring_service_id integer,
charge_cents integer,
charge_cents_currency character varying(191) DEFAULT ''usd''::character varying,
state character varying(191),
succeeded_at timestamp without time zone,
credit_card_id integer,
card_expiry_month integer,
card_expiry_year integer,
card_data_handling_mode character varying(191),
card_bin character varying(191),
card_type character varying(191),
card_country character varying(191),
card_zip_code character varying(191),
card_visual character varying(191),
charge_processor_id character varying(191),
charge_processor_fee_cents integer,
charge_processor_fee_cents_currency character varying(191) DEFAULT ''usd''::character varying,
charge_processor_transaction_id character varying(191),
charge_processor_fingerprint character varying(191),
charge_processor_card_id character varying(191),
charge_processor_status character varying(191),
charge_processor_error_code character varying(191),
charge_processor_refunded boolean DEFAULT false NOT NULL,
chargeback_date timestamp without time zone,
json_data character varying(191),
error_code character varying(191),
merchant_account_id integer,
browser_guid character varying(191),
ip_address character varying(191),
ip_country character varying(191),
ip_state character varying(191),
session_id character varying(191),
flags integer DEFAULT 0 NOT NULL,
discount_code character varying(100),
processor_payment_intent_id character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы service_charges: %', SQLERRM;
END $$;

-- Таблица 133/175: shipments
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'shipments' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.shipments (
id integer NOT NULL,
purchase_id integer,
ship_state character varying,
shipped_at timestamp without time zone,
created_at timestamp without time zone,
updated_at timestamp without time zone,
tracking_number character varying,
carrier character varying,
tracking_url character varying(2083)
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы shipments: %', SQLERRM;
END $$;

-- Таблица 134/175: shipping_destinations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'shipping_destinations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.shipping_destinations (
id integer NOT NULL,
link_id integer,
user_id integer,
country_code character varying NOT NULL,
one_item_rate_cents integer NOT NULL,
multiple_items_rate_cents integer NOT NULL,
flags integer DEFAULT 0 NOT NULL,
json_data text,
deleted_at timestamp without time zone,
created_at timestamp(6) without time zone,
updated_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы shipping_destinations: %', SQLERRM;
END $$;

-- Таблица 135/175: signup_events
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'signup_events' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.signup_events (
id bigint NOT NULL,
visit_id integer,
ip_address character varying,
user_id integer,
created_at timestamp without time zone,
updated_at timestamp without time zone,
referrer character varying,
parent_referrer character varying,
language character varying,
browser character varying,
is_mobile boolean DEFAULT false,
email character varying,
view_url character varying,
fingerprint character varying,
ip_country character varying,
ip_longitude double precision,
ip_latitude double precision,
is_modal boolean,
browser_fingerprint character varying,
browser_plugins character varying,
browser_guid character varying,
referrer_domain character varying,
ip_state character varying,
active_test_path_assignments character varying,
event_name character varying,
link_id integer,
purchase_id integer,
price_cents integer,
credit_card_id integer,
card_type character varying,
card_visual character varying,
purchase_state boolean DEFAULT false,
billing_zip character varying,
chargeback boolean DEFAULT false,
refunded boolean
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы signup_events: %', SQLERRM;
END $$;

-- Таблица 136/175: skus_variants
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'skus_variants' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.skus_variants (
id integer NOT NULL,
variant_id integer,
sku_id integer
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы skus_variants: %', SQLERRM;
END $$;

-- Таблица 137/175: staff_picked_products
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'staff_picked_products' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.staff_picked_products (
id bigint NOT NULL,
product_id bigint NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы staff_picked_products: %', SQLERRM;
END $$;

-- Таблица 138/175: stamped_pdfs
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'stamped_pdfs' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.stamped_pdfs (
id bigint NOT NULL,
url_redirect_id bigint,
product_file_id bigint,
url character varying(1024),
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
deleted_at timestamp(6) without time zone,
deleted_from_cdn_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы stamped_pdfs: %', SQLERRM;
END $$;

-- Таблица 139/175: stripe_apple_pay_domains
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'stripe_apple_pay_domains' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.stripe_apple_pay_domains (
id bigint NOT NULL,
user_id bigint NOT NULL,
domain character varying NOT NULL,
stripe_id character varying NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы stripe_apple_pay_domains: %', SQLERRM;
END $$;

-- Таблица 140/175: subscription_events
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subscription_events' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.subscription_events (
id bigint NOT NULL,
subscription_id bigint NOT NULL,
event_type integer NOT NULL,
occurred_at timestamp(6) without time zone NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
seller_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы subscription_events: %', SQLERRM;
END $$;

-- Таблица 141/175: subscription_plan_changes
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subscription_plan_changes' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.subscription_plan_changes (
id bigint NOT NULL,
subscription_id bigint NOT NULL,
base_variant_id bigint,
recurrence character varying(191) NOT NULL,
perceived_price_cents integer NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
quantity integer DEFAULT 1 NOT NULL,
flags bigint DEFAULT 0 NOT NULL,
effective_on date,
notified_subscriber_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы subscription_plan_changes: %', SQLERRM;
END $$;

-- Таблица 142/175: subscriptions
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subscriptions' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.subscriptions (
id bigint NOT NULL,
link_id bigint,
user_id bigint,
cancelled_at timestamp(6) without time zone,
failed_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
flags bigint DEFAULT 0 NOT NULL,
user_requested_cancellation_at timestamp(6) without time zone,
charge_occurrence_count integer,
ended_at timestamp(6) without time zone,
last_payment_option_id bigint,
credit_card_id bigint,
deactivated_at timestamp(6) without time zone,
free_trial_ends_at timestamp(6) without time zone,
seller_id bigint,
token character varying,
token_expires_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы subscriptions: %', SQLERRM;
END $$;

-- Таблица 143/175: subtitle_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subtitle_files' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.subtitle_files (
id bigint NOT NULL,
url character varying(1024),
language character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
product_file_id bigint,
deleted_at timestamp(6) without time zone,
size integer,
deleted_from_cdn_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы subtitle_files: %', SQLERRM;
END $$;

-- Таблица 144/175: tags
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tags' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.tags (
id integer NOT NULL,
name character varying(100),
created_at timestamp(6) without time zone,
updated_at timestamp(6) without time zone,
humanized_name character varying(191),
flagged_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы tags: %', SQLERRM;
END $$;

-- Таблица 145/175: taxonomies
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'taxonomies' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.taxonomies (
id bigint NOT NULL,
parent_id bigint,
slug character varying NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы taxonomies: %', SQLERRM;
END $$;

-- Таблица 146/175: taxonomy_hierarchies
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'taxonomy_hierarchies' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.taxonomy_hierarchies (
ancestor_id bigint NOT NULL,
descendant_id bigint NOT NULL,
generations integer NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы taxonomy_hierarchies: %', SQLERRM;
END $$;

-- Таблица 147/175: taxonomy_stats
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'taxonomy_stats' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.taxonomy_stats (
id bigint NOT NULL,
taxonomy_id bigint NOT NULL,
creators_count integer DEFAULT 0 NOT NULL,
products_count integer DEFAULT 0 NOT NULL,
sales_count integer DEFAULT 0 NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
recent_sales_count integer DEFAULT 0
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы taxonomy_stats: %', SQLERRM;
END $$;

-- Таблица 148/175: team_invitations
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'team_invitations' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.team_invitations (
id bigint NOT NULL,
seller_id bigint NOT NULL,
email character varying NOT NULL,
role character varying NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
expires_at timestamp(6) without time zone NOT NULL,
accepted_at timestamp(6) without time zone,
deleted_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы team_invitations: %', SQLERRM;
END $$;

-- Таблица 149/175: team_memberships
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'team_memberships' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.team_memberships (
id bigint NOT NULL,
seller_id bigint NOT NULL,
user_id bigint NOT NULL,
role character varying NOT NULL,
last_accessed_at timestamp without time zone,
deleted_at timestamp without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы team_memberships: %', SQLERRM;
END $$;

-- Таблица 150/175: third_party_analytics
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'third_party_analytics' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.third_party_analytics (
id integer NOT NULL,
user_id integer,
link_id integer,
analytics_code text,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone,
updated_at timestamp(6) without time zone,
name character varying,
location character varying DEFAULT ''receipt''::character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы third_party_analytics: %', SQLERRM;
END $$;

-- Таблица 151/175: thumbnails
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'thumbnails' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.thumbnails (
id bigint NOT NULL,
product_id integer,
deleted_at timestamp(6) without time zone,
guid character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
unsplash_url character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы thumbnails: %', SQLERRM;
END $$;

-- Таблица 152/175: tips
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tips' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.tips (
id bigint NOT NULL,
purchase_id bigint NOT NULL,
value_cents integer NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
value_usd_cents integer DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы tips: %', SQLERRM;
END $$;

-- Таблица 153/175: top_sellers
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'top_sellers' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.top_sellers (
id bigint NOT NULL,
user_id bigint NOT NULL,
sales_usd bigint DEFAULT 0 NOT NULL,
sales_count bigint DEFAULT 0 NOT NULL,
rank integer NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы top_sellers: %', SQLERRM;
END $$;

-- Таблица 154/175: tos_agreements
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tos_agreements' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.tos_agreements (
id integer NOT NULL,
user_id integer,
ip character varying,
created_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы tos_agreements: %', SQLERRM;
END $$;

-- Таблица 155/175: transcoded_videos
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'transcoded_videos' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.transcoded_videos (
id bigint NOT NULL,
link_id bigint,
original_video_key character varying(1024),
transcoded_video_key character varying(2048),
job_id character varying,
state character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
product_file_id bigint,
flags integer DEFAULT 0 NOT NULL,
deleted_from_cdn_at timestamp(6) without time zone,
deleted_at timestamp(6) without time zone,
last_accessed_at timestamp(6) without time zone,
streamable_type character varying,
streamable_id bigint
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы transcoded_videos: %', SQLERRM;
END $$;

-- Таблица 156/175: upsell_purchases
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'upsell_purchases' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.upsell_purchases (
id bigint NOT NULL,
upsell_id bigint NOT NULL,
purchase_id bigint NOT NULL,
selected_product_id bigint,
upsell_variant_id bigint,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы upsell_purchases: %', SQLERRM;
END $$;

-- Таблица 157/175: upsell_variants
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'upsell_variants' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.upsell_variants (
id bigint NOT NULL,
upsell_id bigint NOT NULL,
selected_variant_id bigint NOT NULL,
offered_variant_id bigint NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы upsell_variants: %', SQLERRM;
END $$;

-- Таблица 158/175: upsells
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'upsells' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.upsells (
id bigint NOT NULL,
seller_id bigint NOT NULL,
product_id bigint NOT NULL,
variant_id bigint,
offer_code_id bigint,
name character varying,
cross_sell boolean NOT NULL,
text character varying,
description text,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
universal boolean DEFAULT false NOT NULL,
flags integer DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы upsells: %', SQLERRM;
END $$;

-- Таблица 159/175: upsells_selected_products
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'upsells_selected_products' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.upsells_selected_products (
id bigint NOT NULL,
upsell_id bigint NOT NULL,
selected_product_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы upsells_selected_products: %', SQLERRM;
END $$;

-- Таблица 160/175: url_redirects
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'url_redirects' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.url_redirects (
id bigint NOT NULL,
uses integer DEFAULT 0,
expires_at timestamp(6) without time zone,
created_at timestamp(6) without time zone,
updated_at timestamp(6) without time zone,
purchase_id bigint,
token character varying NOT NULL,
link_id bigint,
flags integer DEFAULT 0 NOT NULL,
installment_id bigint,
subscription_id bigint,
preorder_id bigint,
imported_customer_id bigint,
rental_first_viewed_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы url_redirects: %', SQLERRM;
END $$;

-- Таблица 161/175: user_compliance_info
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'user_compliance_info' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.user_compliance_info (
id bigint NOT NULL,
user_id integer,
full_name character varying,
street_address character varying,
city character varying,
state character varying,
zip_code character varying,
country character varying,
telephone_number character varying,
vertical character varying,
is_business boolean,
has_sold_before boolean,
individual_tax_id bytea,
json_data text,
flags integer DEFAULT 0 NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
business_name character varying,
business_street_address character varying,
business_city character varying,
business_state character varying,
business_zip_code character varying,
business_country character varying,
business_type character varying,
business_tax_id bytea,
birthday date,
deleted_at timestamp(6) without time zone,
dba character varying,
verticals text,
first_name character varying,
last_name character varying,
stripe_identity_document_id character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы user_compliance_info: %', SQLERRM;
END $$;

-- Таблица 162/175: user_compliance_info_requests
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'user_compliance_info_requests' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.user_compliance_info_requests (
id integer NOT NULL,
created_at timestamp(6) without time zone,
updated_at timestamp(6) without time zone,
user_id integer,
field_needed character varying,
due_at timestamp(6) without time zone,
state character varying,
provided_at timestamp(6) without time zone,
json_data text,
flags integer DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы user_compliance_info_requests: %', SQLERRM;
END $$;

-- Таблица 163/175: users
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'users' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.users (
id integer NOT NULL,
email character varying DEFAULT ''''::character varying,
encrypted_password character varying DEFAULT ''''::character varying NOT NULL,
reset_password_token character varying,
reset_password_sent_at timestamp without time zone,
remember_created_at timestamp without time zone,
sign_in_count integer DEFAULT 0,
current_sign_in_at timestamp without time zone,
last_sign_in_at timestamp without time zone,
current_sign_in_ip character varying,
last_sign_in_ip character varying,
created_at timestamp without time zone,
updated_at timestamp without time zone,
google_uid character varying,
username character varying,
user_risk_state character varying,
external_id character varying,
name character varying,
provider character varying,
confirmed_at timestamp(6) without time zone,
confirmation_token character varying,
confirmation_sent_at timestamp(6) without time zone,
unconfirmed_email character varying,
tier_state integer DEFAULT 0,
flags bigint DEFAULT 1 NOT NULL,
locale character varying DEFAULT ''en''::character varying,
timezone character varying DEFAULT ''Pacific Time (US & Canada)''::character varying NOT NULL,
currency_type character varying DEFAULT ''usd''::character varying,
recommendation_type character varying DEFAULT ''trending''::character varying NOT NULL,
facebook_meta_tag character varying,
google_analytics_id character varying,
support_email character varying,
bio text,
profile_picture_url character varying,
country character varying,
verified boolean,
payment_notification boolean DEFAULT true,
facebook_uid character varying,
twitter_user_id character varying,
twitter_handle character varying,
twitter_oauth_token character varying,
twitter_oauth_secret character varying,
facebook_id character varying,
purchasing_power_parity_limit integer,
kindle_email character varying,
payment_address character varying,
deleted_at timestamp(6) without time zone,
account_created_ip character varying,
notification_endpoint text,
json_data text,
tos_violation_reason character varying,
google_analytics_domains character varying,
facebook_pixel_id character varying,
split_payment_by_cents integer,
last_active_sessions_invalidated_at timestamp(6) without time zone,
otp_secret_key character varying,
orientation_priority_tag character varying,
facebook_access_token character varying,
manage_pages boolean,
banned_at timestamp(6) without time zone,
weekly_notification boolean,
state character varying,
city character varying,
zip_code character varying,
street_address character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы users: %', SQLERRM;
END $$;

-- Таблица 164/175: utm_link_driven_sales
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'utm_link_driven_sales' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.utm_link_driven_sales (
id bigint NOT NULL,
utm_link_id bigint NOT NULL,
utm_link_visit_id bigint NOT NULL,
purchase_id bigint NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы utm_link_driven_sales: %', SQLERRM;
END $$;

-- Таблица 165/175: utm_link_visits
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'utm_link_visits' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.utm_link_visits (
id bigint NOT NULL,
utm_link_id bigint NOT NULL,
user_id bigint,
referrer character varying,
ip_address character varying NOT NULL,
user_agent character varying,
browser_guid character varying NOT NULL,
country_code character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы utm_link_visits: %', SQLERRM;
END $$;

-- Таблица 166/175: utm_links
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'utm_links' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.utm_links (
id bigint NOT NULL,
seller_id bigint NOT NULL,
title character varying NOT NULL,
target_resource_type character varying NOT NULL,
target_resource_id bigint,
permalink character varying NOT NULL,
utm_campaign character varying(200) NOT NULL,
utm_medium character varying(200) NOT NULL,
utm_source character varying(200) NOT NULL,
utm_term character varying(200),
utm_content character varying(200),
first_click_at timestamp(6) without time zone,
last_click_at timestamp(6) without time zone,
total_clicks integer DEFAULT 0 NOT NULL,
unique_clicks integer DEFAULT 0 NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
deleted_at timestamp(6) without time zone,
disabled_at timestamp(6) without time zone,
ip_address character varying,
browser_guid character varying
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы utm_links: %', SQLERRM;
END $$;

-- Таблица 167/175: variant_categories
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'variant_categories' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.variant_categories (
id integer NOT NULL,
link_id integer,
deleted_at timestamp(6) without time zone,
title character varying,
flags integer DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы variant_categories: %', SQLERRM;
END $$;

-- Таблица 168/175: versions
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'versions' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.versions (
id bigint NOT NULL,
item_type character varying(191) NOT NULL,
item_id bigint NOT NULL,
event character varying(191) NOT NULL,
whodunnit character varying(191),
object text,
created_at timestamp(6) without time zone,
remote_ip character varying(191),
request_path text,
request_uuid character varying(191),
object_changes text
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы versions: %', SQLERRM;
END $$;

-- Таблица 169/175: video_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'video_files' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.video_files (
id bigint NOT NULL,
record_type character varying NOT NULL,
record_id bigint NOT NULL,
url character varying,
filetype character varying,
width integer,
height integer,
duration integer,
bitrate integer,
framerate integer,
size integer,
flags integer DEFAULT 0,
deleted_at timestamp(6) without time zone,
deleted_from_cdn_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
user_id bigint NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы video_files: %', SQLERRM;
END $$;

-- Таблица 170/175: wishlist_followers
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'wishlist_followers' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.wishlist_followers (
id bigint NOT NULL,
wishlist_id bigint NOT NULL,
follower_user_id bigint NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы wishlist_followers: %', SQLERRM;
END $$;

-- Таблица 171/175: wishlist_products
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'wishlist_products' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.wishlist_products (
id bigint NOT NULL,
wishlist_id bigint NOT NULL,
product_id bigint NOT NULL,
variant_id bigint,
recurrence character varying,
quantity integer NOT NULL,
rent boolean NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
deleted_at timestamp(6) without time zone
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы wishlist_products: %', SQLERRM;
END $$;

-- Таблица 172/175: wishlists
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'wishlists' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.wishlists (
id bigint NOT NULL,
user_id bigint NOT NULL,
name character varying NOT NULL,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
followers_last_contacted_at timestamp(6) without time zone,
description text,
flags integer DEFAULT 0 NOT NULL,
recommendable boolean DEFAULT false NOT NULL,
follower_count integer DEFAULT 0 NOT NULL,
recent_follower_count integer DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы wishlists: %', SQLERRM;
END $$;

-- Таблица 173/175: workflows
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'workflows' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.workflows (
id integer NOT NULL,
name character varying(1024),
seller_id integer,
link_id integer,
workflow_type character varying,
published_at timestamp(6) without time zone,
deleted_at timestamp(6) without time zone,
created_at timestamp(6) without time zone,
updated_at timestamp(6) without time zone,
base_variant_id integer,
json_data text,
first_published_at timestamp(6) without time zone,
flags bigint DEFAULT 0 NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы workflows: %', SQLERRM;
END $$;

-- Таблица 174/175: yearly_stats
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'yearly_stats' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.yearly_stats (
id bigint NOT NULL,
user_id bigint NOT NULL,
analytics_data json NOT NULL,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы yearly_stats: %', SQLERRM;
END $$;

-- Таблица 175/175: zip_tax_rates
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'zip_tax_rates' AND table_schema = 'public') THEN
        EXECUTE 'CREATE TABLE public.zip_tax_rates (
id integer NOT NULL,
combined_rate numeric(8,7),
county_rate numeric(8,7),
city_rate numeric(8,7),
state character varying,
state_rate numeric(8,7),
tax_region_code character varying,
tax_region_name character varying,
zip_code character varying,
created_at timestamp(6) without time zone NOT NULL,
updated_at timestamp(6) without time zone NOT NULL,
special_rate numeric(8,7),
flags integer DEFAULT 0 NOT NULL,
country character varying NOT NULL,
user_id integer,
deleted_at timestamp(6) without time zone,
json_data text
);';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка создания таблицы zip_tax_rates: %', SQLERRM;
END $$;

-- ==================================
-- ЭТАП 3: ДОБАВЛЕНИЕ КОЛОНОК (ALTER TABLE)
-- ==================================
-- Alter 1/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval(''public.active_storage_attachments_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 2/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval(''public.active_storage_blobs_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 3/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval(''public.active_storage_variant_records_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 4/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.admin_action_call_infos ALTER COLUMN id SET DEFAULT nextval(''public.admin_action_call_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 5/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliate_credits ALTER COLUMN id SET DEFAULT nextval(''public.affiliate_credits_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 6/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliate_partial_refunds ALTER COLUMN id SET DEFAULT nextval(''public.affiliate_partial_refunds_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 7/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliate_requests ALTER COLUMN id SET DEFAULT nextval(''public.affiliate_requests_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 8/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliates ALTER COLUMN id SET DEFAULT nextval(''public.affiliates_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 9/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliates_links ALTER COLUMN id SET DEFAULT nextval(''public.affiliates_links_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 10/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.asset_previews ALTER COLUMN id SET DEFAULT nextval(''public.asset_previews_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 11/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.audience_members ALTER COLUMN id SET DEFAULT nextval(''public.audience_members_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 12/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.australia_backtax_email_infos ALTER COLUMN id SET DEFAULT nextval(''public.australia_backtax_email_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 13/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.backtax_agreements ALTER COLUMN id SET DEFAULT nextval(''public.backtax_agreements_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 14/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.backtax_collections ALTER COLUMN id SET DEFAULT nextval(''public.backtax_collections_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 15/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.balance_transactions ALTER COLUMN id SET DEFAULT nextval(''public.balance_transactions_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 16/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.balances ALTER COLUMN id SET DEFAULT nextval(''public.balances_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 17/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval(''public.bank_accounts_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 18/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval(''public.banks_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 19/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.base_variant_integrations ALTER COLUMN id SET DEFAULT nextval(''public.base_variant_integrations_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 20/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.base_variants ALTER COLUMN id SET DEFAULT nextval(''public.base_variants_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 21/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.base_variants_product_files ALTER COLUMN id SET DEFAULT nextval(''public.base_variants_product_files_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 22/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.base_variants_purchases ALTER COLUMN id SET DEFAULT nextval(''public.base_variants_purchases_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 23/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.blocked_customer_objects ALTER COLUMN id SET DEFAULT nextval(''public.blocked_customer_objects_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 24/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.bundle_product_purchases ALTER COLUMN id SET DEFAULT nextval(''public.bundle_product_purchases_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 25/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.bundle_products ALTER COLUMN id SET DEFAULT nextval(''public.bundle_products_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 26/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.cached_sales_related_products_infos ALTER COLUMN id SET DEFAULT nextval(''public.cached_sales_related_products_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 27/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.call_availabilities ALTER COLUMN id SET DEFAULT nextval(''public.call_availabilities_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 28/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.call_limitation_infos ALTER COLUMN id SET DEFAULT nextval(''public.call_limitation_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 29/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.calls ALTER COLUMN id SET DEFAULT nextval(''public.calls_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 30/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.cart_products ALTER COLUMN id SET DEFAULT nextval(''public.cart_products_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 31/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval(''public.carts_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 32/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.charge_purchases ALTER COLUMN id SET DEFAULT nextval(''public.charge_purchases_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 33/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.charges ALTER COLUMN id SET DEFAULT nextval(''public.charges_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 34/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.collaborator_invitations ALTER COLUMN id SET DEFAULT nextval(''public.collaborator_invitations_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 35/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval(''public.comments_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 36/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.commission_files ALTER COLUMN id SET DEFAULT nextval(''public.commission_files_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 37/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.commissions ALTER COLUMN id SET DEFAULT nextval(''public.commissions_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 38/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval(''public.communities_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 39/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.community_chat_messages ALTER COLUMN id SET DEFAULT nextval(''public.community_chat_messages_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 40/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.community_chat_recap_runs ALTER COLUMN id SET DEFAULT nextval(''public.community_chat_recap_runs_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 41/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.community_chat_recaps ALTER COLUMN id SET DEFAULT nextval(''public.community_chat_recaps_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 42/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.community_notification_settings ALTER COLUMN id SET DEFAULT nextval(''public.community_notification_settings_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 43/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.computed_sales_analytics_days ALTER COLUMN id SET DEFAULT nextval(''public.computed_sales_analytics_days_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 44/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.consumption_events ALTER COLUMN id SET DEFAULT nextval(''public.consumption_events_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 45/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval(''public.credit_cards_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 46/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.credits ALTER COLUMN id SET DEFAULT nextval(''public.credits_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 47/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.custom_domains ALTER COLUMN id SET DEFAULT nextval(''public.custom_domains_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 48/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval(''public.custom_fields_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 49/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.custom_fields_products ALTER COLUMN id SET DEFAULT nextval(''public.custom_fields_products_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 50/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval(''public.devices_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 51/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.discover_search_suggestions ALTER COLUMN id SET DEFAULT nextval(''public.discover_search_suggestions_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 52/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.discover_searches ALTER COLUMN id SET DEFAULT nextval(''public.discover_searches_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 53/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.dispute_evidences ALTER COLUMN id SET DEFAULT nextval(''public.dispute_evidences_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 54/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.disputes ALTER COLUMN id SET DEFAULT nextval(''public.disputes_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 55/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.dropbox_files ALTER COLUMN id SET DEFAULT nextval(''public.dropbox_files_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 56/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.email_info_charges ALTER COLUMN id SET DEFAULT nextval(''public.email_info_charges_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 57/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.email_infos ALTER COLUMN id SET DEFAULT nextval(''public.email_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 58/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval(''public.events_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 59/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval(''public.followers_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 60/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval(''public.friendly_id_slugs_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 61/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.gifts ALTER COLUMN id SET DEFAULT nextval(''public.gifts_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 62/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.gumroad_daily_analytics ALTER COLUMN id SET DEFAULT nextval(''public.gumroad_daily_analytics_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 63/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.imported_customers ALTER COLUMN id SET DEFAULT nextval(''public.imported_customers_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 64/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.installment_events ALTER COLUMN id SET DEFAULT nextval(''public.installment_events_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 65/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.installment_rules ALTER COLUMN id SET DEFAULT nextval(''public.installment_rules_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 66/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.installments ALTER COLUMN id SET DEFAULT nextval(''public.installments_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 67/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.integrations ALTER COLUMN id SET DEFAULT nextval(''public.integrations_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 68/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.invites ALTER COLUMN id SET DEFAULT nextval(''public.invites_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 69/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.large_sellers ALTER COLUMN id SET DEFAULT nextval(''public.large_sellers_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 70/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.last_read_community_chat_messages ALTER COLUMN id SET DEFAULT nextval(''public.last_read_community_chat_messages_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 71/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.legacy_permalinks ALTER COLUMN id SET DEFAULT nextval(''public.legacy_permalinks_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 72/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.licenses ALTER COLUMN id SET DEFAULT nextval(''public.licenses_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 73/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval(''public.links_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 74/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.media_locations ALTER COLUMN id SET DEFAULT nextval(''public.media_locations_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 75/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.merchant_accounts ALTER COLUMN id SET DEFAULT nextval(''public.merchant_accounts_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 76/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval(''public.oauth_access_grants_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 77/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval(''public.oauth_access_tokens_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 78/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval(''public.oauth_applications_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 79/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.offer_codes ALTER COLUMN id SET DEFAULT nextval(''public.offer_codes_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 80/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.offer_codes_products ALTER COLUMN id SET DEFAULT nextval(''public.offer_codes_products_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 81/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.order_purchases ALTER COLUMN id SET DEFAULT nextval(''public.order_purchases_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 82/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval(''public.orders_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 83/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.payment_options ALTER COLUMN id SET DEFAULT nextval(''public.payment_options_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 84/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval(''public.payments_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 85/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.payments_balances ALTER COLUMN id SET DEFAULT nextval(''public.payments_balances_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 86/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.post_email_blasts ALTER COLUMN id SET DEFAULT nextval(''public.post_email_blasts_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 87/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.preorder_links ALTER COLUMN id SET DEFAULT nextval(''public.preorder_links_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 88/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.preorders ALTER COLUMN id SET DEFAULT nextval(''public.preorders_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 89/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval(''public.prices_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 90/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.processor_payment_intents ALTER COLUMN id SET DEFAULT nextval(''public.processor_payment_intents_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 91/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_cached_values ALTER COLUMN id SET DEFAULT nextval(''public.product_cached_values_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 92/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_files ALTER COLUMN id SET DEFAULT nextval(''public.product_files_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 93/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_files_archives ALTER COLUMN id SET DEFAULT nextval(''public.product_files_archives_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 94/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_files_files_archives ALTER COLUMN id SET DEFAULT nextval(''public.product_files_files_archives_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 95/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_folders ALTER COLUMN id SET DEFAULT nextval(''public.product_folders_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 96/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_installment_plans ALTER COLUMN id SET DEFAULT nextval(''public.product_installment_plans_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 97/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_integrations ALTER COLUMN id SET DEFAULT nextval(''public.product_integrations_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 98/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_review_responses ALTER COLUMN id SET DEFAULT nextval(''public.product_review_responses_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 99/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_review_stats ALTER COLUMN id SET DEFAULT nextval(''public.product_review_stats_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 100/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_review_videos ALTER COLUMN id SET DEFAULT nextval(''public.product_review_videos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 101/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_reviews ALTER COLUMN id SET DEFAULT nextval(''public.product_reviews_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 102/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_taggings ALTER COLUMN id SET DEFAULT nextval(''public.product_taggings_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 103/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.public_files ALTER COLUMN id SET DEFAULT nextval(''public.public_files_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 104/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_custom_field_files ALTER COLUMN id SET DEFAULT nextval(''public.purchase_custom_field_files_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 105/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_custom_fields ALTER COLUMN id SET DEFAULT nextval(''public.purchase_custom_fields_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 106/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_early_fraud_warnings ALTER COLUMN id SET DEFAULT nextval(''public.purchase_early_fraud_warnings_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 107/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_integrations ALTER COLUMN id SET DEFAULT nextval(''public.purchase_integrations_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 108/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_offer_code_discounts ALTER COLUMN id SET DEFAULT nextval(''public.purchase_offer_code_discounts_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 109/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_refund_policies ALTER COLUMN id SET DEFAULT nextval(''public.purchase_refund_policies_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 110/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_sales_tax_infos ALTER COLUMN id SET DEFAULT nextval(''public.purchase_sales_tax_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 111/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_taxjar_infos ALTER COLUMN id SET DEFAULT nextval(''public.purchase_taxjar_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 112/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_wallet_types ALTER COLUMN id SET DEFAULT nextval(''public.purchase_wallet_types_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 113/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval(''public.purchases_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 114/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchasing_power_parity_infos ALTER COLUMN id SET DEFAULT nextval(''public.purchasing_power_parity_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 115/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.recommended_purchase_infos ALTER COLUMN id SET DEFAULT nextval(''public.recommended_purchase_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 116/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.recurring_services ALTER COLUMN id SET DEFAULT nextval(''public.recurring_services_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 117/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.refund_policies ALTER COLUMN id SET DEFAULT nextval(''public.refund_policies_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 118/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.refunds ALTER COLUMN id SET DEFAULT nextval(''public.refunds_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 119/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.resource_subscriptions ALTER COLUMN id SET DEFAULT nextval(''public.resource_subscriptions_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 120/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.rich_contents ALTER COLUMN id SET DEFAULT nextval(''public.rich_contents_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 121/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sales_export_chunks ALTER COLUMN id SET DEFAULT nextval(''public.sales_export_chunks_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 122/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sales_exports ALTER COLUMN id SET DEFAULT nextval(''public.sales_exports_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 123/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sales_related_products_infos ALTER COLUMN id SET DEFAULT nextval(''public.sales_related_products_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 124/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.self_service_affiliate_products ALTER COLUMN id SET DEFAULT nextval(''public.self_service_affiliate_products_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 125/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.seller_profile_sections ALTER COLUMN id SET DEFAULT nextval(''public.seller_profile_sections_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 126/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.seller_profiles ALTER COLUMN id SET DEFAULT nextval(''public.seller_profiles_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 127/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sent_abandoned_cart_emails ALTER COLUMN id SET DEFAULT nextval(''public.sent_abandoned_cart_emails_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 128/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sent_email_infos ALTER COLUMN id SET DEFAULT nextval(''public.sent_email_infos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 129/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sent_post_emails ALTER COLUMN id SET DEFAULT nextval(''public.sent_post_emails_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 130/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.service_charges ALTER COLUMN id SET DEFAULT nextval(''public.service_charges_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 131/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.shipments ALTER COLUMN id SET DEFAULT nextval(''public.shipments_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 132/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.shipping_destinations ALTER COLUMN id SET DEFAULT nextval(''public.shipping_destinations_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 133/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.signup_events ALTER COLUMN id SET DEFAULT nextval(''public.signup_events_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 134/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.skus_variants ALTER COLUMN id SET DEFAULT nextval(''public.skus_variants_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 135/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.staff_picked_products ALTER COLUMN id SET DEFAULT nextval(''public.staff_picked_products_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 136/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.stamped_pdfs ALTER COLUMN id SET DEFAULT nextval(''public.stamped_pdfs_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 137/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.stripe_apple_pay_domains ALTER COLUMN id SET DEFAULT nextval(''public.stripe_apple_pay_domains_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 138/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.subscription_events ALTER COLUMN id SET DEFAULT nextval(''public.subscription_events_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 139/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.subscription_plan_changes ALTER COLUMN id SET DEFAULT nextval(''public.subscription_plan_changes_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 140/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval(''public.subscriptions_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 141/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.subtitle_files ALTER COLUMN id SET DEFAULT nextval(''public.subtitle_files_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 142/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval(''public.tags_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 143/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.taxonomies ALTER COLUMN id SET DEFAULT nextval(''public.taxonomies_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 144/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.taxonomy_stats ALTER COLUMN id SET DEFAULT nextval(''public.taxonomy_stats_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 145/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.team_invitations ALTER COLUMN id SET DEFAULT nextval(''public.team_invitations_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 146/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.team_memberships ALTER COLUMN id SET DEFAULT nextval(''public.team_memberships_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 147/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.third_party_analytics ALTER COLUMN id SET DEFAULT nextval(''public.third_party_analytics_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 148/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.thumbnails ALTER COLUMN id SET DEFAULT nextval(''public.thumbnails_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 149/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.tips ALTER COLUMN id SET DEFAULT nextval(''public.tips_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 150/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.top_sellers ALTER COLUMN id SET DEFAULT nextval(''public.top_sellers_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 151/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.tos_agreements ALTER COLUMN id SET DEFAULT nextval(''public.tos_agreements_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 152/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.transcoded_videos ALTER COLUMN id SET DEFAULT nextval(''public.transcoded_videos_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 153/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.upsell_purchases ALTER COLUMN id SET DEFAULT nextval(''public.upsell_purchases_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 154/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.upsell_variants ALTER COLUMN id SET DEFAULT nextval(''public.upsell_variants_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 155/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.upsells ALTER COLUMN id SET DEFAULT nextval(''public.upsells_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 156/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.upsells_selected_products ALTER COLUMN id SET DEFAULT nextval(''public.upsells_selected_products_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 157/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.url_redirects ALTER COLUMN id SET DEFAULT nextval(''public.url_redirects_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 158/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.user_compliance_info ALTER COLUMN id SET DEFAULT nextval(''public.user_compliance_info_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 159/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.user_compliance_info_requests ALTER COLUMN id SET DEFAULT nextval(''public.user_compliance_info_requests_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 160/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval(''public.users_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 161/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.utm_link_driven_sales ALTER COLUMN id SET DEFAULT nextval(''public.utm_link_driven_sales_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 162/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.utm_link_visits ALTER COLUMN id SET DEFAULT nextval(''public.utm_link_visits_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 163/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.utm_links ALTER COLUMN id SET DEFAULT nextval(''public.utm_links_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 164/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.variant_categories ALTER COLUMN id SET DEFAULT nextval(''public.variant_categories_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 165/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval(''public.versions_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 166/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.video_files ALTER COLUMN id SET DEFAULT nextval(''public.video_files_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 167/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.wishlist_followers ALTER COLUMN id SET DEFAULT nextval(''public.wishlist_followers_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 168/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.wishlist_products ALTER COLUMN id SET DEFAULT nextval(''public.wishlist_products_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 169/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval(''public.wishlists_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 170/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval(''public.workflows_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 171/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.yearly_stats ALTER COLUMN id SET DEFAULT nextval(''public.yearly_stats_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 172/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.zip_tax_rates ALTER COLUMN id SET DEFAULT nextval(''public.zip_tax_rates_id_seq''::regclass);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 173/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.active_storage_attachments
ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 174/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.active_storage_blobs
ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 175/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.active_storage_variant_records
ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 176/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.admin_action_call_infos
ADD CONSTRAINT admin_action_call_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 177/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliate_credits
ADD CONSTRAINT affiliate_credits_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 178/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliate_partial_refunds
ADD CONSTRAINT affiliate_partial_refunds_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 179/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliate_requests
ADD CONSTRAINT affiliate_requests_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 180/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliates_links
ADD CONSTRAINT affiliates_links_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 181/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.affiliates
ADD CONSTRAINT affiliates_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 182/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.ar_internal_metadata
ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 183/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.asset_previews
ADD CONSTRAINT asset_previews_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 184/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.audience_members
ADD CONSTRAINT audience_members_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 185/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.australia_backtax_email_infos
ADD CONSTRAINT australia_backtax_email_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 186/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.backtax_agreements
ADD CONSTRAINT backtax_agreements_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 187/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.backtax_collections
ADD CONSTRAINT backtax_collections_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 188/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.balance_transactions
ADD CONSTRAINT balance_transactions_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 189/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.balances
ADD CONSTRAINT balances_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 190/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.bank_accounts
ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 191/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.banks
ADD CONSTRAINT banks_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 192/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.base_variant_integrations
ADD CONSTRAINT base_variant_integrations_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 193/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.base_variants
ADD CONSTRAINT base_variants_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 194/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.base_variants_product_files
ADD CONSTRAINT base_variants_product_files_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 195/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.base_variants_purchases
ADD CONSTRAINT base_variants_purchases_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 196/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.blocked_customer_objects
ADD CONSTRAINT blocked_customer_objects_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 197/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.bundle_product_purchases
ADD CONSTRAINT bundle_product_purchases_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 198/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.bundle_products
ADD CONSTRAINT bundle_products_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 199/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.cached_sales_related_products_infos
ADD CONSTRAINT cached_sales_related_products_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 200/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.call_availabilities
ADD CONSTRAINT call_availabilities_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 201/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.call_limitation_infos
ADD CONSTRAINT call_limitation_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 202/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.calls
ADD CONSTRAINT calls_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 203/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.cart_products
ADD CONSTRAINT cart_products_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 204/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.carts
ADD CONSTRAINT carts_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 205/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.charge_purchases
ADD CONSTRAINT charge_purchases_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 206/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.charges
ADD CONSTRAINT charges_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 207/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.collaborator_invitations
ADD CONSTRAINT collaborator_invitations_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 208/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.comments
ADD CONSTRAINT comments_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 209/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.commission_files
ADD CONSTRAINT commission_files_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 210/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.commissions
ADD CONSTRAINT commissions_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 211/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.communities
ADD CONSTRAINT communities_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 212/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.community_chat_messages
ADD CONSTRAINT community_chat_messages_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 213/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.community_chat_recap_runs
ADD CONSTRAINT community_chat_recap_runs_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 214/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.community_chat_recaps
ADD CONSTRAINT community_chat_recaps_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 215/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.community_notification_settings
ADD CONSTRAINT community_notification_settings_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 216/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.computed_sales_analytics_days
ADD CONSTRAINT computed_sales_analytics_days_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 217/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.consumption_events
ADD CONSTRAINT consumption_events_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 218/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.credit_cards
ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 219/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.credits
ADD CONSTRAINT credits_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 220/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.custom_domains
ADD CONSTRAINT custom_domains_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 221/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.custom_fields
ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 222/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.custom_fields_products
ADD CONSTRAINT custom_fields_products_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 223/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.devices
ADD CONSTRAINT devices_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 224/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.discover_search_suggestions
ADD CONSTRAINT discover_search_suggestions_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 225/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.discover_searches
ADD CONSTRAINT discover_searches_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 226/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.dispute_evidences
ADD CONSTRAINT dispute_evidences_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 227/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.disputes
ADD CONSTRAINT disputes_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 228/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.dropbox_files
ADD CONSTRAINT dropbox_files_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 229/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.email_info_charges
ADD CONSTRAINT email_info_charges_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 230/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.email_infos
ADD CONSTRAINT email_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 231/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.events
ADD CONSTRAINT events_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 232/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.followers
ADD CONSTRAINT followers_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 233/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.friendly_id_slugs
ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 234/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.gifts
ADD CONSTRAINT gifts_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 235/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.gumroad_daily_analytics
ADD CONSTRAINT gumroad_daily_analytics_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 236/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.imported_customers
ADD CONSTRAINT imported_customers_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 237/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.installment_events
ADD CONSTRAINT installment_events_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 238/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.installment_rules
ADD CONSTRAINT installment_rules_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 239/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.installments
ADD CONSTRAINT installments_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 240/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.integrations
ADD CONSTRAINT integrations_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 241/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.invites
ADD CONSTRAINT invites_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 242/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.large_sellers
ADD CONSTRAINT large_sellers_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 243/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.last_read_community_chat_messages
ADD CONSTRAINT last_read_community_chat_messages_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 244/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.legacy_permalinks
ADD CONSTRAINT legacy_permalinks_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 245/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.licenses
ADD CONSTRAINT licenses_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 246/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.links
ADD CONSTRAINT links_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 247/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.media_locations
ADD CONSTRAINT media_locations_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 248/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.merchant_accounts
ADD CONSTRAINT merchant_accounts_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 249/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.oauth_access_grants
ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 250/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.oauth_access_tokens
ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 251/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.oauth_applications
ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 252/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.offer_codes
ADD CONSTRAINT offer_codes_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 253/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.offer_codes_products
ADD CONSTRAINT offer_codes_products_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 254/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.order_purchases
ADD CONSTRAINT order_purchases_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 255/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.orders
ADD CONSTRAINT orders_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 256/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.payment_options
ADD CONSTRAINT payment_options_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 257/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.payments_balances
ADD CONSTRAINT payments_balances_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 258/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.payments
ADD CONSTRAINT payments_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 259/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.post_email_blasts
ADD CONSTRAINT post_email_blasts_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 260/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.preorder_links
ADD CONSTRAINT preorder_links_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 261/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.preorders
ADD CONSTRAINT preorders_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 262/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.prices
ADD CONSTRAINT prices_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 263/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.processor_payment_intents
ADD CONSTRAINT processor_payment_intents_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 264/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_cached_values
ADD CONSTRAINT product_cached_values_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 265/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_files_archives
ADD CONSTRAINT product_files_archives_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 266/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_files_files_archives
ADD CONSTRAINT product_files_files_archives_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 267/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_files
ADD CONSTRAINT product_files_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 268/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_folders
ADD CONSTRAINT product_folders_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 269/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_installment_plans
ADD CONSTRAINT product_installment_plans_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 270/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_integrations
ADD CONSTRAINT product_integrations_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 271/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_review_responses
ADD CONSTRAINT product_review_responses_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 272/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_review_stats
ADD CONSTRAINT product_review_stats_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 273/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_review_videos
ADD CONSTRAINT product_review_videos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 274/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_reviews
ADD CONSTRAINT product_reviews_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 275/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.product_taggings
ADD CONSTRAINT product_taggings_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 276/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.public_files
ADD CONSTRAINT public_files_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 277/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_custom_field_files
ADD CONSTRAINT purchase_custom_field_files_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 278/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_custom_fields
ADD CONSTRAINT purchase_custom_fields_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 279/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_early_fraud_warnings
ADD CONSTRAINT purchase_early_fraud_warnings_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 280/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_integrations
ADD CONSTRAINT purchase_integrations_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 281/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_offer_code_discounts
ADD CONSTRAINT purchase_offer_code_discounts_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 282/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_refund_policies
ADD CONSTRAINT purchase_refund_policies_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 283/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_sales_tax_infos
ADD CONSTRAINT purchase_sales_tax_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 284/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_taxjar_infos
ADD CONSTRAINT purchase_taxjar_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 285/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchase_wallet_types
ADD CONSTRAINT purchase_wallet_types_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 286/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchases
ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 287/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.purchasing_power_parity_infos
ADD CONSTRAINT purchasing_power_parity_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 288/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.recommended_purchase_infos
ADD CONSTRAINT recommended_purchase_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 289/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.recurring_services
ADD CONSTRAINT recurring_services_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 290/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.refund_policies
ADD CONSTRAINT refund_policies_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 291/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.refunds
ADD CONSTRAINT refunds_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 292/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.resource_subscriptions
ADD CONSTRAINT resource_subscriptions_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 293/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.rich_contents
ADD CONSTRAINT rich_contents_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 294/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sales_export_chunks
ADD CONSTRAINT sales_export_chunks_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 295/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sales_exports
ADD CONSTRAINT sales_exports_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 296/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sales_related_products_infos
ADD CONSTRAINT sales_related_products_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 297/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.schema_migrations
ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 298/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.self_service_affiliate_products
ADD CONSTRAINT self_service_affiliate_products_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 299/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.seller_profile_sections
ADD CONSTRAINT seller_profile_sections_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 300/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.seller_profiles
ADD CONSTRAINT seller_profiles_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 301/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sent_abandoned_cart_emails
ADD CONSTRAINT sent_abandoned_cart_emails_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 302/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sent_email_infos
ADD CONSTRAINT sent_email_infos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 303/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.sent_post_emails
ADD CONSTRAINT sent_post_emails_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 304/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.service_charges
ADD CONSTRAINT service_charges_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 305/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.shipments
ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 306/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.shipping_destinations
ADD CONSTRAINT shipping_destinations_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 307/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.signup_events
ADD CONSTRAINT signup_events_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 308/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.skus_variants
ADD CONSTRAINT skus_variants_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 309/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.staff_picked_products
ADD CONSTRAINT staff_picked_products_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 310/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.stamped_pdfs
ADD CONSTRAINT stamped_pdfs_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 311/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.stripe_apple_pay_domains
ADD CONSTRAINT stripe_apple_pay_domains_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 312/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.subscription_events
ADD CONSTRAINT subscription_events_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 313/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.subscription_plan_changes
ADD CONSTRAINT subscription_plan_changes_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 314/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.subscriptions
ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 315/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.subtitle_files
ADD CONSTRAINT subtitle_files_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 316/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.tags
ADD CONSTRAINT tags_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 317/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.taxonomies
ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 318/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.taxonomy_stats
ADD CONSTRAINT taxonomy_stats_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 319/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.team_invitations
ADD CONSTRAINT team_invitations_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 320/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.team_memberships
ADD CONSTRAINT team_memberships_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 321/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.third_party_analytics
ADD CONSTRAINT third_party_analytics_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 322/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.thumbnails
ADD CONSTRAINT thumbnails_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 323/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.tips
ADD CONSTRAINT tips_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 324/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.top_sellers
ADD CONSTRAINT top_sellers_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 325/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.tos_agreements
ADD CONSTRAINT tos_agreements_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 326/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.transcoded_videos
ADD CONSTRAINT transcoded_videos_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 327/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.upsell_purchases
ADD CONSTRAINT upsell_purchases_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 328/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.upsell_variants
ADD CONSTRAINT upsell_variants_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 329/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.upsells
ADD CONSTRAINT upsells_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 330/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.upsells_selected_products
ADD CONSTRAINT upsells_selected_products_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 331/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.url_redirects
ADD CONSTRAINT url_redirects_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 332/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.user_compliance_info
ADD CONSTRAINT user_compliance_info_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 333/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.user_compliance_info_requests
ADD CONSTRAINT user_compliance_info_requests_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 334/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.users
ADD CONSTRAINT users_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 335/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.utm_link_driven_sales
ADD CONSTRAINT utm_link_driven_sales_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 336/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.utm_link_visits
ADD CONSTRAINT utm_link_visits_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 337/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.utm_links
ADD CONSTRAINT utm_links_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 338/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.variant_categories
ADD CONSTRAINT variant_categories_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 339/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.versions
ADD CONSTRAINT versions_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 340/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.video_files
ADD CONSTRAINT video_files_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 341/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.wishlist_followers
ADD CONSTRAINT wishlist_followers_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 342/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.wishlist_products
ADD CONSTRAINT wishlist_products_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 343/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.wishlists
ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 344/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.workflows
ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 345/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.yearly_stats
ADD CONSTRAINT yearly_stats_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- Alter 346/346
DO $$ BEGIN
    EXECUTE 'ALTER TABLE ONLY public.zip_tax_rates
ADD CONSTRAINT zip_tax_rates_pkey PRIMARY KEY (id);';
EXCEPTION
    WHEN duplicate_column THEN NULL; -- Колонка уже существует
    WHEN duplicate_object THEN NULL; -- Объект уже существует
    WHEN others THEN
        RAISE NOTICE 'Ошибка ALTER: %', SQLERRM;
END $$;

-- ==================================
-- ЭТАП 4: СОЗДАНИЕ ИНДЕКСОВ (после добавления всех колонок)
-- ==================================
-- Индекс 1/466: idx_admin_action_infos_ctrl_action
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_admin_action_infos_ctrl_action') THEN
        EXECUTE 'CREATE UNIQUE INDEX idx_admin_action_infos_ctrl_action ON public.admin_action_call_infos USING btree (controller_name, action_name);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_admin_action_infos_ctrl_action не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_admin_action_infos_ctrl_action: %', SQLERRM;
END $$;

-- Индекс 2/466: idx_affiliate_credits_on_affiliate_credit_chargeback_balance_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_affiliate_credits_on_affiliate_credit_chargeback_balance_id') THEN
        EXECUTE 'CREATE INDEX idx_affiliate_credits_on_affiliate_credit_chargeback_balance_id ON public.affiliate_credits USING btree (affiliate_credit_chargeback_balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_affiliate_credits_on_affiliate_credit_chargeback_balance_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_affiliate_credits_on_affiliate_credit_chargeback_balance_id: %', SQLERRM;
END $$;

-- Индекс 3/466: idx_affiliate_credits_refund_balance
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_affiliate_credits_refund_balance') THEN
        EXECUTE 'CREATE INDEX idx_affiliate_credits_refund_balance ON public.affiliate_credits USING btree (affiliate_credit_refund_balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_affiliate_credits_refund_balance не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_affiliate_credits_refund_balance: %', SQLERRM;
END $$;

-- Индекс 4/466: idx_affiliate_credits_success_balance
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_affiliate_credits_success_balance') THEN
        EXECUTE 'CREATE INDEX idx_affiliate_credits_success_balance ON public.affiliate_credits USING btree (affiliate_credit_success_balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_affiliate_credits_success_balance не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_affiliate_credits_success_balance: %', SQLERRM;
END $$;

-- Индекс 5/466: idx_audience_on_seller_and_follower_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_audience_on_seller_and_follower_created_at') THEN
        EXECUTE 'CREATE INDEX idx_audience_on_seller_and_follower_created_at ON public.audience_members USING btree (seller_id, follower_created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_audience_on_seller_and_follower_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_audience_on_seller_and_follower_created_at: %', SQLERRM;
END $$;

-- Индекс 6/466: idx_audience_on_seller_and_minmax_affiliate_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_audience_on_seller_and_minmax_affiliate_created_at') THEN
        EXECUTE 'CREATE INDEX idx_audience_on_seller_and_minmax_affiliate_created_at ON public.audience_members USING btree (seller_id, min_affiliate_created_at, max_affiliate_created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_audience_on_seller_and_minmax_affiliate_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_audience_on_seller_and_minmax_affiliate_created_at: %', SQLERRM;
END $$;

-- Индекс 7/466: idx_audience_on_seller_and_minmax_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_audience_on_seller_and_minmax_created_at') THEN
        EXECUTE 'CREATE INDEX idx_audience_on_seller_and_minmax_created_at ON public.audience_members USING btree (seller_id, min_created_at, max_created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_audience_on_seller_and_minmax_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_audience_on_seller_and_minmax_created_at: %', SQLERRM;
END $$;

-- Индекс 8/466: idx_audience_on_seller_and_minmax_paid_cents
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_audience_on_seller_and_minmax_paid_cents') THEN
        EXECUTE 'CREATE INDEX idx_audience_on_seller_and_minmax_paid_cents ON public.audience_members USING btree (seller_id, min_paid_cents, max_paid_cents);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_audience_on_seller_and_minmax_paid_cents не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_audience_on_seller_and_minmax_paid_cents: %', SQLERRM;
END $$;

-- Индекс 9/466: idx_audience_on_seller_and_minmax_purchase_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_audience_on_seller_and_minmax_purchase_created_at') THEN
        EXECUTE 'CREATE INDEX idx_audience_on_seller_and_minmax_purchase_created_at ON public.audience_members USING btree (seller_id, min_purchase_created_at, max_purchase_created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_audience_on_seller_and_minmax_purchase_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_audience_on_seller_and_minmax_purchase_created_at: %', SQLERRM;
END $$;

-- Индекс 10/466: idx_audience_on_seller_and_types
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_audience_on_seller_and_types') THEN
        EXECUTE 'CREATE INDEX idx_audience_on_seller_and_types ON public.audience_members USING btree (seller_id, customer, follower, affiliate);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_audience_on_seller_and_types не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_audience_on_seller_and_types: %', SQLERRM;
END $$;

-- Индекс 11/466: idx_blocked_customer_objects_unique
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_blocked_customer_objects_unique') THEN
        EXECUTE 'CREATE UNIQUE INDEX idx_blocked_customer_objects_unique ON public.blocked_customer_objects USING btree (seller_id, object_type, object_value);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_blocked_customer_objects_unique не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_blocked_customer_objects_unique: %', SQLERRM;
END $$;

-- Индекс 12/466: idx_community_notifications_user_seller
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_community_notifications_user_seller') THEN
        EXECUTE 'CREATE UNIQUE INDEX idx_community_notifications_user_seller ON public.community_notification_settings USING btree (user_id, seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_community_notifications_user_seller не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_community_notifications_user_seller: %', SQLERRM;
END $$;

-- Индекс 13/466: idx_media_locations_purchase_file_consumed
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_media_locations_purchase_file_consumed') THEN
        EXECUTE 'CREATE INDEX idx_media_locations_purchase_file_consumed ON public.media_locations USING btree (purchase_id, product_file_id, consumed_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_media_locations_purchase_file_consumed не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_media_locations_purchase_file_consumed: %', SQLERRM;
END $$;

-- Индекс 14/466: idx_on_community_chat_message_id_f9e10450e2
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_on_community_chat_message_id_f9e10450e2') THEN
        EXECUTE 'CREATE INDEX idx_on_community_chat_message_id_f9e10450e2 ON public.last_read_community_chat_messages USING btree (community_chat_message_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_on_community_chat_message_id_f9e10450e2 не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_on_community_chat_message_id_f9e10450e2: %', SQLERRM;
END $$;

-- Индекс 15/466: idx_on_link_id_has_message_created_at_2fcf6c0c64
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_on_link_id_has_message_created_at_2fcf6c0c64') THEN
        EXECUTE 'CREATE INDEX idx_on_link_id_has_message_created_at_2fcf6c0c64 ON public.product_reviews USING btree (link_id, has_message, created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_on_link_id_has_message_created_at_2fcf6c0c64 не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_on_link_id_has_message_created_at_2fcf6c0c64: %', SQLERRM;
END $$;

-- Индекс 16/466: idx_on_recap_frequency_from_date_to_date_2ed29d569d
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_on_recap_frequency_from_date_to_date_2ed29d569d') THEN
        EXECUTE 'CREATE UNIQUE INDEX idx_on_recap_frequency_from_date_to_date_2ed29d569d ON public.community_chat_recap_runs USING btree (recap_frequency, from_date, to_date);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_on_recap_frequency_from_date_to_date_2ed29d569d не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_on_recap_frequency_from_date_to_date_2ed29d569d: %', SQLERRM;
END $$;

-- Индекс 17/466: idx_on_resource_type_resource_id_seller_id_deleted__23a67b41cb
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_on_resource_type_resource_id_seller_id_deleted__23a67b41cb') THEN
        EXECUTE 'CREATE UNIQUE INDEX idx_on_resource_type_resource_id_seller_id_deleted__23a67b41cb ON public.communities USING btree (resource_type, resource_id, seller_id, deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_on_resource_type_resource_id_seller_id_deleted__23a67b41cb не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_on_resource_type_resource_id_seller_id_deleted__23a67b41cb: %', SQLERRM;
END $$;

-- Индекс 18/466: idx_on_user_id_community_id_45efa2a41c
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_on_user_id_community_id_45efa2a41c') THEN
        EXECUTE 'CREATE UNIQUE INDEX idx_on_user_id_community_id_45efa2a41c ON public.last_read_community_chat_messages USING btree (user_id, community_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_on_user_id_community_id_45efa2a41c не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_on_user_id_community_id_45efa2a41c: %', SQLERRM;
END $$;

-- Индекс 19/466: idx_on_utm_link_visit_id_purchase_id_c31951f65f
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_on_utm_link_visit_id_purchase_id_c31951f65f') THEN
        EXECUTE 'CREATE UNIQUE INDEX idx_on_utm_link_visit_id_purchase_id_c31951f65f ON public.utm_link_driven_sales USING btree (utm_link_visit_id, purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_on_utm_link_visit_id_purchase_id_c31951f65f не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_on_utm_link_visit_id_purchase_id_c31951f65f: %', SQLERRM;
END $$;

-- Индекс 20/466: idx_product_files_archives_archive
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_product_files_archives_archive') THEN
        EXECUTE 'CREATE INDEX idx_product_files_archives_archive ON public.product_files_files_archives USING btree (product_files_archive_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_product_files_archives_archive не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_product_files_archives_archive: %', SQLERRM;
END $$;

-- Индекс 21/466: idx_purchase_custom_field_files
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_purchase_custom_field_files') THEN
        EXECUTE 'CREATE INDEX idx_purchase_custom_field_files ON public.purchase_custom_field_files USING btree (purchase_custom_field_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_purchase_custom_field_files не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_purchase_custom_field_files: %', SQLERRM;
END $$;

-- Индекс 22/466: idx_purchases_seller_state_created
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_purchases_seller_state_created') THEN
        EXECUTE 'CREATE INDEX idx_purchases_seller_state_created ON public.purchases USING btree (seller_id, purchase_state, created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_purchases_seller_state_created не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_purchases_seller_state_created: %', SQLERRM;
END $$;

-- Индекс 23/466: idx_url_redirects_installment_customer
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_url_redirects_installment_customer') THEN
        EXECUTE 'CREATE INDEX idx_url_redirects_installment_customer ON public.url_redirects USING btree (installment_id, imported_customer_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_url_redirects_installment_customer не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_url_redirects_installment_customer: %', SQLERRM;
END $$;

-- Индекс 24/466: idx_utm_links_target_resource
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_utm_links_target_resource') THEN
        EXECUTE 'CREATE INDEX idx_utm_links_target_resource ON public.utm_links USING btree (target_resource_type, target_resource_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса idx_utm_links_target_resource не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса idx_utm_links_target_resource: %', SQLERRM;
END $$;

-- Индекс 25/466: index_ach_accounts_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_ach_accounts_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_ach_accounts_on_user_id ON public.bank_accounts USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_ach_accounts_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_ach_accounts_on_user_id: %', SQLERRM;
END $$;

-- Индекс 26/466: index_active_storage_attachments_on_blob_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_active_storage_attachments_on_blob_id') THEN
        EXECUTE 'CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_active_storage_attachments_on_blob_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_active_storage_attachments_on_blob_id: %', SQLERRM;
END $$;

-- Индекс 27/466: index_active_storage_attachments_uniqueness
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_active_storage_attachments_uniqueness') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_active_storage_attachments_uniqueness не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_active_storage_attachments_uniqueness: %', SQLERRM;
END $$;

-- Индекс 28/466: index_active_storage_blobs_on_key
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_active_storage_blobs_on_key') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_active_storage_blobs_on_key не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_active_storage_blobs_on_key: %', SQLERRM;
END $$;

-- Индекс 29/466: index_active_storage_variant_records_uniqueness
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_active_storage_variant_records_uniqueness') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_active_storage_variant_records_uniqueness не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_active_storage_variant_records_uniqueness: %', SQLERRM;
END $$;

-- Индекс 30/466: index_affiliate_credits_on_affiliate_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_credits_on_affiliate_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_credits_on_affiliate_id ON public.affiliate_credits USING btree (affiliate_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_credits_on_affiliate_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_credits_on_affiliate_id: %', SQLERRM;
END $$;

-- Индекс 31/466: index_affiliate_credits_on_affiliate_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_credits_on_affiliate_user_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_credits_on_affiliate_user_id ON public.affiliate_credits USING btree (affiliate_user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_credits_on_affiliate_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_credits_on_affiliate_user_id: %', SQLERRM;
END $$;

-- Индекс 32/466: index_affiliate_credits_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_credits_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_credits_on_link_id ON public.affiliate_credits USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_credits_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_credits_on_link_id: %', SQLERRM;
END $$;

-- Индекс 33/466: index_affiliate_credits_on_oauth_application_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_credits_on_oauth_application_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_credits_on_oauth_application_id ON public.affiliate_credits USING btree (oauth_application_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_credits_on_oauth_application_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_credits_on_oauth_application_id: %', SQLERRM;
END $$;

-- Индекс 34/466: index_affiliate_credits_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_credits_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_credits_on_purchase_id ON public.affiliate_credits USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_credits_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_credits_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 35/466: index_affiliate_credits_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_credits_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_credits_on_seller_id ON public.affiliate_credits USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_credits_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_credits_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 36/466: index_affiliate_partial_refunds_on_affiliate_credit_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_partial_refunds_on_affiliate_credit_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_partial_refunds_on_affiliate_credit_id ON public.affiliate_partial_refunds USING btree (affiliate_credit_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_partial_refunds_on_affiliate_credit_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_partial_refunds_on_affiliate_credit_id: %', SQLERRM;
END $$;

-- Индекс 37/466: index_affiliate_partial_refunds_on_affiliate_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_partial_refunds_on_affiliate_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_partial_refunds_on_affiliate_id ON public.affiliate_partial_refunds USING btree (affiliate_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_partial_refunds_on_affiliate_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_partial_refunds_on_affiliate_id: %', SQLERRM;
END $$;

-- Индекс 38/466: index_affiliate_partial_refunds_on_affiliate_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_partial_refunds_on_affiliate_user_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_partial_refunds_on_affiliate_user_id ON public.affiliate_partial_refunds USING btree (affiliate_user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_partial_refunds_on_affiliate_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_partial_refunds_on_affiliate_user_id: %', SQLERRM;
END $$;

-- Индекс 39/466: index_affiliate_partial_refunds_on_balance_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_partial_refunds_on_balance_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_partial_refunds_on_balance_id ON public.affiliate_partial_refunds USING btree (balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_partial_refunds_on_balance_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_partial_refunds_on_balance_id: %', SQLERRM;
END $$;

-- Индекс 40/466: index_affiliate_partial_refunds_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_partial_refunds_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_partial_refunds_on_purchase_id ON public.affiliate_partial_refunds USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_partial_refunds_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_partial_refunds_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 41/466: index_affiliate_partial_refunds_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_partial_refunds_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_partial_refunds_on_seller_id ON public.affiliate_partial_refunds USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_partial_refunds_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_partial_refunds_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 42/466: index_affiliate_requests_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliate_requests_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_affiliate_requests_on_seller_id ON public.affiliate_requests USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliate_requests_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliate_requests_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 43/466: index_affiliates_links_on_affiliate_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliates_links_on_affiliate_id') THEN
        EXECUTE 'CREATE INDEX index_affiliates_links_on_affiliate_id ON public.affiliates_links USING btree (affiliate_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliates_links_on_affiliate_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliates_links_on_affiliate_id: %', SQLERRM;
END $$;

-- Индекс 44/466: index_affiliates_links_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliates_links_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_affiliates_links_on_link_id ON public.affiliates_links USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliates_links_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliates_links_on_link_id: %', SQLERRM;
END $$;

-- Индекс 45/466: index_affiliates_on_affiliate_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliates_on_affiliate_user_id') THEN
        EXECUTE 'CREATE INDEX index_affiliates_on_affiliate_user_id ON public.affiliates USING btree (affiliate_user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliates_on_affiliate_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliates_on_affiliate_user_id: %', SQLERRM;
END $$;

-- Индекс 46/466: index_affiliates_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_affiliates_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_affiliates_on_seller_id ON public.affiliates USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_affiliates_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_affiliates_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 47/466: index_asset_previews_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_asset_previews_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_asset_previews_on_deleted_at ON public.asset_previews USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_asset_previews_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_asset_previews_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 48/466: index_asset_previews_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_asset_previews_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_asset_previews_on_link_id ON public.asset_previews USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_asset_previews_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_asset_previews_on_link_id: %', SQLERRM;
END $$;

-- Индекс 49/466: index_audience_members_on_seller_id_and_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_audience_members_on_seller_id_and_email') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_audience_members_on_seller_id_and_email ON public.audience_members USING btree (seller_id, email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_audience_members_on_seller_id_and_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_audience_members_on_seller_id_and_email: %', SQLERRM;
END $$;

-- Индекс 50/466: index_australia_backtax_email_infos_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_australia_backtax_email_infos_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_australia_backtax_email_infos_on_user_id ON public.australia_backtax_email_infos USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_australia_backtax_email_infos_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_australia_backtax_email_infos_on_user_id: %', SQLERRM;
END $$;

-- Индекс 51/466: index_backtax_agreements_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_backtax_agreements_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_backtax_agreements_on_user_id ON public.backtax_agreements USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_backtax_agreements_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_backtax_agreements_on_user_id: %', SQLERRM;
END $$;

-- Индекс 52/466: index_backtax_collections_on_backtax_agreement_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_backtax_collections_on_backtax_agreement_id') THEN
        EXECUTE 'CREATE INDEX index_backtax_collections_on_backtax_agreement_id ON public.backtax_collections USING btree (backtax_agreement_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_backtax_collections_on_backtax_agreement_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_backtax_collections_on_backtax_agreement_id: %', SQLERRM;
END $$;

-- Индекс 53/466: index_backtax_collections_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_backtax_collections_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_backtax_collections_on_user_id ON public.backtax_collections USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_backtax_collections_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_backtax_collections_on_user_id: %', SQLERRM;
END $$;

-- Индекс 54/466: index_balance_transactions_on_balance_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_balance_transactions_on_balance_id') THEN
        EXECUTE 'CREATE INDEX index_balance_transactions_on_balance_id ON public.balance_transactions USING btree (balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_balance_transactions_on_balance_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_balance_transactions_on_balance_id: %', SQLERRM;
END $$;

-- Индекс 55/466: index_balance_transactions_on_credit_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_balance_transactions_on_credit_id') THEN
        EXECUTE 'CREATE INDEX index_balance_transactions_on_credit_id ON public.balance_transactions USING btree (credit_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_balance_transactions_on_credit_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_balance_transactions_on_credit_id: %', SQLERRM;
END $$;

-- Индекс 56/466: index_balance_transactions_on_dispute_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_balance_transactions_on_dispute_id') THEN
        EXECUTE 'CREATE INDEX index_balance_transactions_on_dispute_id ON public.balance_transactions USING btree (dispute_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_balance_transactions_on_dispute_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_balance_transactions_on_dispute_id: %', SQLERRM;
END $$;

-- Индекс 57/466: index_balance_transactions_on_merchant_account_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_balance_transactions_on_merchant_account_id') THEN
        EXECUTE 'CREATE INDEX index_balance_transactions_on_merchant_account_id ON public.balance_transactions USING btree (merchant_account_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_balance_transactions_on_merchant_account_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_balance_transactions_on_merchant_account_id: %', SQLERRM;
END $$;

-- Индекс 58/466: index_balance_transactions_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_balance_transactions_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_balance_transactions_on_purchase_id ON public.balance_transactions USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_balance_transactions_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_balance_transactions_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 59/466: index_balance_transactions_on_refund_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_balance_transactions_on_refund_id') THEN
        EXECUTE 'CREATE INDEX index_balance_transactions_on_refund_id ON public.balance_transactions USING btree (refund_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_balance_transactions_on_refund_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_balance_transactions_on_refund_id: %', SQLERRM;
END $$;

-- Индекс 60/466: index_balance_transactions_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_balance_transactions_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_balance_transactions_on_user_id ON public.balance_transactions USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_balance_transactions_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_balance_transactions_on_user_id: %', SQLERRM;
END $$;

-- Индекс 61/466: index_banks_on_routing_number
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_banks_on_routing_number') THEN
        EXECUTE 'CREATE INDEX index_banks_on_routing_number ON public.banks USING btree (routing_number);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_banks_on_routing_number не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_banks_on_routing_number: %', SQLERRM;
END $$;

-- Индекс 62/466: index_base_variant_integrations_on_base_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_base_variant_integrations_on_base_variant_id') THEN
        EXECUTE 'CREATE INDEX index_base_variant_integrations_on_base_variant_id ON public.base_variant_integrations USING btree (base_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_base_variant_integrations_on_base_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_base_variant_integrations_on_base_variant_id: %', SQLERRM;
END $$;

-- Индекс 63/466: index_base_variant_integrations_on_integration_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_base_variant_integrations_on_integration_id') THEN
        EXECUTE 'CREATE INDEX index_base_variant_integrations_on_integration_id ON public.base_variant_integrations USING btree (integration_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_base_variant_integrations_on_integration_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_base_variant_integrations_on_integration_id: %', SQLERRM;
END $$;

-- Индекс 64/466: index_base_variants_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_base_variants_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_base_variants_on_link_id ON public.base_variants USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_base_variants_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_base_variants_on_link_id: %', SQLERRM;
END $$;

-- Индекс 65/466: index_base_variants_product_files_on_base_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_base_variants_product_files_on_base_variant_id') THEN
        EXECUTE 'CREATE INDEX index_base_variants_product_files_on_base_variant_id ON public.base_variants_product_files USING btree (base_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_base_variants_product_files_on_base_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_base_variants_product_files_on_base_variant_id: %', SQLERRM;
END $$;

-- Индекс 66/466: index_base_variants_product_files_on_product_file_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_base_variants_product_files_on_product_file_id') THEN
        EXECUTE 'CREATE INDEX index_base_variants_product_files_on_product_file_id ON public.base_variants_product_files USING btree (product_file_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_base_variants_product_files_on_product_file_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_base_variants_product_files_on_product_file_id: %', SQLERRM;
END $$;

-- Индекс 67/466: index_blocked_customer_objects_on_buyer_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_blocked_customer_objects_on_buyer_email') THEN
        EXECUTE 'CREATE INDEX index_blocked_customer_objects_on_buyer_email ON public.blocked_customer_objects USING btree (buyer_email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_blocked_customer_objects_on_buyer_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_blocked_customer_objects_on_buyer_email: %', SQLERRM;
END $$;

-- Индекс 68/466: index_blocked_customer_objects_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_blocked_customer_objects_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_blocked_customer_objects_on_seller_id ON public.blocked_customer_objects USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_blocked_customer_objects_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_blocked_customer_objects_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 69/466: index_bundle_product_purchases_on_bundle_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_bundle_product_purchases_on_bundle_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_bundle_product_purchases_on_bundle_purchase_id ON public.bundle_product_purchases USING btree (bundle_purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_bundle_product_purchases_on_bundle_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_bundle_product_purchases_on_bundle_purchase_id: %', SQLERRM;
END $$;

-- Индекс 70/466: index_bundle_product_purchases_on_product_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_bundle_product_purchases_on_product_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_bundle_product_purchases_on_product_purchase_id ON public.bundle_product_purchases USING btree (product_purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_bundle_product_purchases_on_product_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_bundle_product_purchases_on_product_purchase_id: %', SQLERRM;
END $$;

-- Индекс 71/466: index_bundle_products_on_bundle_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_bundle_products_on_bundle_id') THEN
        EXECUTE 'CREATE INDEX index_bundle_products_on_bundle_id ON public.bundle_products USING btree (bundle_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_bundle_products_on_bundle_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_bundle_products_on_bundle_id: %', SQLERRM;
END $$;

-- Индекс 72/466: index_bundle_products_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_bundle_products_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_bundle_products_on_product_id ON public.bundle_products USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_bundle_products_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_bundle_products_on_product_id: %', SQLERRM;
END $$;

-- Индекс 73/466: index_bundle_products_on_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_bundle_products_on_variant_id') THEN
        EXECUTE 'CREATE INDEX index_bundle_products_on_variant_id ON public.bundle_products USING btree (variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_bundle_products_on_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_bundle_products_on_variant_id: %', SQLERRM;
END $$;

-- Индекс 74/466: index_cached_sales_related_products_infos_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_cached_sales_related_products_infos_on_product_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_cached_sales_related_products_infos_on_product_id ON public.cached_sales_related_products_infos USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_cached_sales_related_products_infos_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_cached_sales_related_products_infos_on_product_id: %', SQLERRM;
END $$;

-- Индекс 75/466: index_call_availabilities_on_call_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_call_availabilities_on_call_id') THEN
        EXECUTE 'CREATE INDEX index_call_availabilities_on_call_id ON public.call_availabilities USING btree (call_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_call_availabilities_on_call_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_call_availabilities_on_call_id: %', SQLERRM;
END $$;

-- Индекс 76/466: index_call_limitation_infos_on_call_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_call_limitation_infos_on_call_id') THEN
        EXECUTE 'CREATE INDEX index_call_limitation_infos_on_call_id ON public.call_limitation_infos USING btree (call_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_call_limitation_infos_on_call_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_call_limitation_infos_on_call_id: %', SQLERRM;
END $$;

-- Индекс 77/466: index_calls_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_calls_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_calls_on_purchase_id ON public.calls USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_calls_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_calls_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 78/466: index_cart_products_on_cart_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_cart_products_on_cart_id') THEN
        EXECUTE 'CREATE INDEX index_cart_products_on_cart_id ON public.cart_products USING btree (cart_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_cart_products_on_cart_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_cart_products_on_cart_id: %', SQLERRM;
END $$;

-- Индекс 79/466: index_cart_products_on_cart_id_and_product_id_and_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_cart_products_on_cart_id_and_product_id_and_deleted_at') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_cart_products_on_cart_id_and_product_id_and_deleted_at ON public.cart_products USING btree (cart_id, product_id, deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_cart_products_on_cart_id_and_product_id_and_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_cart_products_on_cart_id_and_product_id_and_deleted_at: %', SQLERRM;
END $$;

-- Индекс 80/466: index_cart_products_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_cart_products_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_cart_products_on_product_id ON public.cart_products USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_cart_products_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_cart_products_on_product_id: %', SQLERRM;
END $$;

-- Индекс 81/466: index_carts_on_browser_guid
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_carts_on_browser_guid') THEN
        EXECUTE 'CREATE INDEX index_carts_on_browser_guid ON public.carts USING btree (browser_guid);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_carts_on_browser_guid не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_carts_on_browser_guid: %', SQLERRM;
END $$;

-- Индекс 82/466: index_carts_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_carts_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_carts_on_created_at ON public.carts USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_carts_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_carts_on_created_at: %', SQLERRM;
END $$;

-- Индекс 83/466: index_carts_on_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_carts_on_email') THEN
        EXECUTE 'CREATE INDEX index_carts_on_email ON public.carts USING btree (email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_carts_on_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_carts_on_email: %', SQLERRM;
END $$;

-- Индекс 84/466: index_carts_on_order_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_carts_on_order_id') THEN
        EXECUTE 'CREATE INDEX index_carts_on_order_id ON public.carts USING btree (order_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_carts_on_order_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_carts_on_order_id: %', SQLERRM;
END $$;

-- Индекс 85/466: index_carts_on_updated_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_carts_on_updated_at') THEN
        EXECUTE 'CREATE INDEX index_carts_on_updated_at ON public.carts USING btree (updated_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_carts_on_updated_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_carts_on_updated_at: %', SQLERRM;
END $$;

-- Индекс 86/466: index_carts_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_carts_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_carts_on_user_id ON public.carts USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_carts_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_carts_on_user_id: %', SQLERRM;
END $$;

-- Индекс 87/466: index_charge_purchases_on_charge_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_charge_purchases_on_charge_id') THEN
        EXECUTE 'CREATE INDEX index_charge_purchases_on_charge_id ON public.charge_purchases USING btree (charge_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_charge_purchases_on_charge_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_charge_purchases_on_charge_id: %', SQLERRM;
END $$;

-- Индекс 88/466: index_charge_purchases_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_charge_purchases_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_charge_purchases_on_purchase_id ON public.charge_purchases USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_charge_purchases_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_charge_purchases_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 89/466: index_charges_on_credit_card_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_charges_on_credit_card_id') THEN
        EXECUTE 'CREATE INDEX index_charges_on_credit_card_id ON public.charges USING btree (credit_card_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_charges_on_credit_card_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_charges_on_credit_card_id: %', SQLERRM;
END $$;

-- Индекс 90/466: index_charges_on_merchant_account_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_charges_on_merchant_account_id') THEN
        EXECUTE 'CREATE INDEX index_charges_on_merchant_account_id ON public.charges USING btree (merchant_account_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_charges_on_merchant_account_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_charges_on_merchant_account_id: %', SQLERRM;
END $$;

-- Индекс 91/466: index_charges_on_order_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_charges_on_order_id') THEN
        EXECUTE 'CREATE INDEX index_charges_on_order_id ON public.charges USING btree (order_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_charges_on_order_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_charges_on_order_id: %', SQLERRM;
END $$;

-- Индекс 92/466: index_charges_on_paypal_order_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_charges_on_paypal_order_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_charges_on_paypal_order_id ON public.charges USING btree (paypal_order_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_charges_on_paypal_order_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_charges_on_paypal_order_id: %', SQLERRM;
END $$;

-- Индекс 93/466: index_charges_on_processor_transaction_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_charges_on_processor_transaction_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_charges_on_processor_transaction_id ON public.charges USING btree (processor_transaction_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_charges_on_processor_transaction_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_charges_on_processor_transaction_id: %', SQLERRM;
END $$;

-- Индекс 94/466: index_charges_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_charges_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_charges_on_seller_id ON public.charges USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_charges_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_charges_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 95/466: index_collaborator_invitations_on_collaborator_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_collaborator_invitations_on_collaborator_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_collaborator_invitations_on_collaborator_id ON public.collaborator_invitations USING btree (collaborator_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_collaborator_invitations_on_collaborator_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_collaborator_invitations_on_collaborator_id: %', SQLERRM;
END $$;

-- Индекс 96/466: index_comments_on_ancestry
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_comments_on_ancestry') THEN
        EXECUTE 'CREATE INDEX index_comments_on_ancestry ON public.comments USING btree (ancestry);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_comments_on_ancestry не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_comments_on_ancestry: %', SQLERRM;
END $$;

-- Индекс 97/466: index_comments_on_commentable_id_and_commentable_type
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_comments_on_commentable_id_and_commentable_type') THEN
        EXECUTE 'CREATE INDEX index_comments_on_commentable_id_and_commentable_type ON public.comments USING btree (commentable_id, commentable_type);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_comments_on_commentable_id_and_commentable_type не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_comments_on_commentable_id_and_commentable_type: %', SQLERRM;
END $$;

-- Индекс 98/466: index_comments_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_comments_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_comments_on_purchase_id ON public.comments USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_comments_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_comments_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 99/466: index_commission_files_on_commission_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_commission_files_on_commission_id') THEN
        EXECUTE 'CREATE INDEX index_commission_files_on_commission_id ON public.commission_files USING btree (commission_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_commission_files_on_commission_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_commission_files_on_commission_id: %', SQLERRM;
END $$;

-- Индекс 100/466: index_commissions_on_completion_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_commissions_on_completion_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_commissions_on_completion_purchase_id ON public.commissions USING btree (completion_purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_commissions_on_completion_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_commissions_on_completion_purchase_id: %', SQLERRM;
END $$;

-- Индекс 101/466: index_commissions_on_deposit_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_commissions_on_deposit_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_commissions_on_deposit_purchase_id ON public.commissions USING btree (deposit_purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_commissions_on_deposit_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_commissions_on_deposit_purchase_id: %', SQLERRM;
END $$;

-- Индекс 102/466: index_communities_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_communities_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_communities_on_deleted_at ON public.communities USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_communities_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_communities_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 103/466: index_communities_on_resource
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_communities_on_resource') THEN
        EXECUTE 'CREATE INDEX index_communities_on_resource ON public.communities USING btree (resource_type, resource_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_communities_on_resource не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_communities_on_resource: %', SQLERRM;
END $$;

-- Индекс 104/466: index_communities_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_communities_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_communities_on_seller_id ON public.communities USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_communities_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_communities_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 105/466: index_community_chat_messages_on_community_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_chat_messages_on_community_id') THEN
        EXECUTE 'CREATE INDEX index_community_chat_messages_on_community_id ON public.community_chat_messages USING btree (community_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_chat_messages_on_community_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_chat_messages_on_community_id: %', SQLERRM;
END $$;

-- Индекс 106/466: index_community_chat_messages_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_chat_messages_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_community_chat_messages_on_deleted_at ON public.community_chat_messages USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_chat_messages_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_chat_messages_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 107/466: index_community_chat_messages_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_chat_messages_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_community_chat_messages_on_user_id ON public.community_chat_messages USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_chat_messages_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_chat_messages_on_user_id: %', SQLERRM;
END $$;

-- Индекс 108/466: index_community_chat_recap_runs_on_recap_frequency
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_chat_recap_runs_on_recap_frequency') THEN
        EXECUTE 'CREATE INDEX index_community_chat_recap_runs_on_recap_frequency ON public.community_chat_recap_runs USING btree (recap_frequency);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_chat_recap_runs_on_recap_frequency не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_chat_recap_runs_on_recap_frequency: %', SQLERRM;
END $$;

-- Индекс 109/466: index_community_chat_recaps_on_community_chat_recap_run_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_chat_recaps_on_community_chat_recap_run_id') THEN
        EXECUTE 'CREATE INDEX index_community_chat_recaps_on_community_chat_recap_run_id ON public.community_chat_recaps USING btree (community_chat_recap_run_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_chat_recaps_on_community_chat_recap_run_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_chat_recaps_on_community_chat_recap_run_id: %', SQLERRM;
END $$;

-- Индекс 110/466: index_community_chat_recaps_on_community_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_chat_recaps_on_community_id') THEN
        EXECUTE 'CREATE INDEX index_community_chat_recaps_on_community_id ON public.community_chat_recaps USING btree (community_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_chat_recaps_on_community_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_chat_recaps_on_community_id: %', SQLERRM;
END $$;

-- Индекс 111/466: index_community_chat_recaps_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_chat_recaps_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_community_chat_recaps_on_seller_id ON public.community_chat_recaps USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_chat_recaps_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_chat_recaps_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 112/466: index_community_chat_recaps_on_status
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_chat_recaps_on_status') THEN
        EXECUTE 'CREATE INDEX index_community_chat_recaps_on_status ON public.community_chat_recaps USING btree (status);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_chat_recaps_on_status не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_chat_recaps_on_status: %', SQLERRM;
END $$;

-- Индекс 113/466: index_community_notification_settings_on_recap_frequency
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_notification_settings_on_recap_frequency') THEN
        EXECUTE 'CREATE INDEX index_community_notification_settings_on_recap_frequency ON public.community_notification_settings USING btree (recap_frequency);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_notification_settings_on_recap_frequency не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_notification_settings_on_recap_frequency: %', SQLERRM;
END $$;

-- Индекс 114/466: index_community_notification_settings_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_notification_settings_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_community_notification_settings_on_seller_id ON public.community_notification_settings USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_notification_settings_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_notification_settings_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 115/466: index_community_notification_settings_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_community_notification_settings_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_community_notification_settings_on_user_id ON public.community_notification_settings USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_community_notification_settings_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_community_notification_settings_on_user_id: %', SQLERRM;
END $$;

-- Индекс 116/466: index_computed_sales_analytics_days_on_key
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_computed_sales_analytics_days_on_key') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_computed_sales_analytics_days_on_key ON public.computed_sales_analytics_days USING btree (key);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_computed_sales_analytics_days_on_key не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_computed_sales_analytics_days_on_key: %', SQLERRM;
END $$;

-- Индекс 117/466: index_consumption_events_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_consumption_events_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_consumption_events_on_link_id ON public.consumption_events USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_consumption_events_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_consumption_events_on_link_id: %', SQLERRM;
END $$;

-- Индекс 118/466: index_consumption_events_on_product_file_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_consumption_events_on_product_file_id') THEN
        EXECUTE 'CREATE INDEX index_consumption_events_on_product_file_id ON public.consumption_events USING btree (product_file_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_consumption_events_on_product_file_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_consumption_events_on_product_file_id: %', SQLERRM;
END $$;

-- Индекс 119/466: index_consumption_events_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_consumption_events_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_consumption_events_on_purchase_id ON public.consumption_events USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_consumption_events_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_consumption_events_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 120/466: index_credit_cards_on_preorder_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_credit_cards_on_preorder_id') THEN
        EXECUTE 'CREATE INDEX index_credit_cards_on_preorder_id ON public.credit_cards USING btree (preorder_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_credit_cards_on_preorder_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_credit_cards_on_preorder_id: %', SQLERRM;
END $$;

-- Индекс 121/466: index_credit_cards_on_stripe_fingerprint
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_credit_cards_on_stripe_fingerprint') THEN
        EXECUTE 'CREATE INDEX index_credit_cards_on_stripe_fingerprint ON public.credit_cards USING btree (stripe_fingerprint);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_credit_cards_on_stripe_fingerprint не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_credit_cards_on_stripe_fingerprint: %', SQLERRM;
END $$;

-- Индекс 122/466: index_credits_on_balance_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_credits_on_balance_id') THEN
        EXECUTE 'CREATE INDEX index_credits_on_balance_id ON public.credits USING btree (balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_credits_on_balance_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_credits_on_balance_id: %', SQLERRM;
END $$;

-- Индекс 123/466: index_credits_on_dispute_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_credits_on_dispute_id') THEN
        EXECUTE 'CREATE INDEX index_credits_on_dispute_id ON public.credits USING btree (dispute_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_credits_on_dispute_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_credits_on_dispute_id: %', SQLERRM;
END $$;

-- Индекс 124/466: index_custom_domains_on_domain
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_custom_domains_on_domain') THEN
        EXECUTE 'CREATE INDEX index_custom_domains_on_domain ON public.custom_domains USING btree (domain);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_custom_domains_on_domain не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_custom_domains_on_domain: %', SQLERRM;
END $$;

-- Индекс 125/466: index_custom_domains_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_custom_domains_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_custom_domains_on_product_id ON public.custom_domains USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_custom_domains_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_custom_domains_on_product_id: %', SQLERRM;
END $$;

-- Индекс 126/466: index_custom_domains_on_ssl_certificate_issued_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_custom_domains_on_ssl_certificate_issued_at') THEN
        EXECUTE 'CREATE INDEX index_custom_domains_on_ssl_certificate_issued_at ON public.custom_domains USING btree (ssl_certificate_issued_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_custom_domains_on_ssl_certificate_issued_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_custom_domains_on_ssl_certificate_issued_at: %', SQLERRM;
END $$;

-- Индекс 127/466: index_custom_domains_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_custom_domains_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_custom_domains_on_user_id ON public.custom_domains USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_custom_domains_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_custom_domains_on_user_id: %', SQLERRM;
END $$;

-- Индекс 128/466: index_custom_fields_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_custom_fields_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_custom_fields_on_seller_id ON public.custom_fields USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_custom_fields_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_custom_fields_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 129/466: index_custom_fields_products_on_custom_field_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_custom_fields_products_on_custom_field_id') THEN
        EXECUTE 'CREATE INDEX index_custom_fields_products_on_custom_field_id ON public.custom_fields_products USING btree (custom_field_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_custom_fields_products_on_custom_field_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_custom_fields_products_on_custom_field_id: %', SQLERRM;
END $$;

-- Индекс 130/466: index_custom_fields_products_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_custom_fields_products_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_custom_fields_products_on_product_id ON public.custom_fields_products USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_custom_fields_products_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_custom_fields_products_on_product_id: %', SQLERRM;
END $$;

-- Индекс 131/466: index_devices_on_app_type_and_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_devices_on_app_type_and_user_id') THEN
        EXECUTE 'CREATE INDEX index_devices_on_app_type_and_user_id ON public.devices USING btree (app_type, user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_devices_on_app_type_and_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_devices_on_app_type_and_user_id: %', SQLERRM;
END $$;

-- Индекс 132/466: index_devices_on_token_and_device_type
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_devices_on_token_and_device_type') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_devices_on_token_and_device_type ON public.devices USING btree (token, device_type);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_devices_on_token_and_device_type не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_devices_on_token_and_device_type: %', SQLERRM;
END $$;

-- Индекс 133/466: index_devices_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_devices_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_devices_on_user_id ON public.devices USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_devices_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_devices_on_user_id: %', SQLERRM;
END $$;

-- Индекс 134/466: index_discover_search_suggestions_on_discover_search_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_discover_search_suggestions_on_discover_search_id') THEN
        EXECUTE 'CREATE INDEX index_discover_search_suggestions_on_discover_search_id ON public.discover_search_suggestions USING btree (discover_search_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_discover_search_suggestions_on_discover_search_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_discover_search_suggestions_on_discover_search_id: %', SQLERRM;
END $$;

-- Индекс 135/466: index_discover_searches_on_browser_guid
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_discover_searches_on_browser_guid') THEN
        EXECUTE 'CREATE INDEX index_discover_searches_on_browser_guid ON public.discover_searches USING btree (browser_guid);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_discover_searches_on_browser_guid не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_discover_searches_on_browser_guid: %', SQLERRM;
END $$;

-- Индекс 136/466: index_discover_searches_on_clicked_resource
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_discover_searches_on_clicked_resource') THEN
        EXECUTE 'CREATE INDEX index_discover_searches_on_clicked_resource ON public.discover_searches USING btree (clicked_resource_type, clicked_resource_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_discover_searches_on_clicked_resource не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_discover_searches_on_clicked_resource: %', SQLERRM;
END $$;

-- Индекс 137/466: index_discover_searches_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_discover_searches_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_discover_searches_on_created_at ON public.discover_searches USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_discover_searches_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_discover_searches_on_created_at: %', SQLERRM;
END $$;

-- Индекс 138/466: index_discover_searches_on_ip_address
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_discover_searches_on_ip_address') THEN
        EXECUTE 'CREATE INDEX index_discover_searches_on_ip_address ON public.discover_searches USING btree (ip_address);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_discover_searches_on_ip_address не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_discover_searches_on_ip_address: %', SQLERRM;
END $$;

-- Индекс 139/466: index_discover_searches_on_query
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_discover_searches_on_query') THEN
        EXECUTE 'CREATE INDEX index_discover_searches_on_query ON public.discover_searches USING btree (query);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_discover_searches_on_query не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_discover_searches_on_query: %', SQLERRM;
END $$;

-- Индекс 140/466: index_discover_searches_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_discover_searches_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_discover_searches_on_user_id ON public.discover_searches USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_discover_searches_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_discover_searches_on_user_id: %', SQLERRM;
END $$;

-- Индекс 141/466: index_dispute_evidences_on_dispute_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_dispute_evidences_on_dispute_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_dispute_evidences_on_dispute_id ON public.dispute_evidences USING btree (dispute_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_dispute_evidences_on_dispute_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_dispute_evidences_on_dispute_id: %', SQLERRM;
END $$;

-- Индекс 142/466: index_dispute_evidences_on_resolved_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_dispute_evidences_on_resolved_at') THEN
        EXECUTE 'CREATE INDEX index_dispute_evidences_on_resolved_at ON public.dispute_evidences USING btree (resolved_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_dispute_evidences_on_resolved_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_dispute_evidences_on_resolved_at: %', SQLERRM;
END $$;

-- Индекс 143/466: index_disputes_on_charge_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_disputes_on_charge_id') THEN
        EXECUTE 'CREATE INDEX index_disputes_on_charge_id ON public.disputes USING btree (charge_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_disputes_on_charge_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_disputes_on_charge_id: %', SQLERRM;
END $$;

-- Индекс 144/466: index_disputes_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_disputes_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_disputes_on_purchase_id ON public.disputes USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_disputes_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_disputes_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 145/466: index_disputes_on_seller_id_and_event_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_disputes_on_seller_id_and_event_created_at') THEN
        EXECUTE 'CREATE INDEX index_disputes_on_seller_id_and_event_created_at ON public.disputes USING btree (seller_id, event_created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_disputes_on_seller_id_and_event_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_disputes_on_seller_id_and_event_created_at: %', SQLERRM;
END $$;

-- Индекс 146/466: index_disputes_on_seller_id_and_lost_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_disputes_on_seller_id_and_lost_at') THEN
        EXECUTE 'CREATE INDEX index_disputes_on_seller_id_and_lost_at ON public.disputes USING btree (seller_id, lost_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_disputes_on_seller_id_and_lost_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_disputes_on_seller_id_and_lost_at: %', SQLERRM;
END $$;

-- Индекс 147/466: index_disputes_on_seller_id_and_won_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_disputes_on_seller_id_and_won_at') THEN
        EXECUTE 'CREATE INDEX index_disputes_on_seller_id_and_won_at ON public.disputes USING btree (seller_id, won_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_disputes_on_seller_id_and_won_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_disputes_on_seller_id_and_won_at: %', SQLERRM;
END $$;

-- Индекс 148/466: index_disputes_on_service_charge_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_disputes_on_service_charge_id') THEN
        EXECUTE 'CREATE INDEX index_disputes_on_service_charge_id ON public.disputes USING btree (service_charge_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_disputes_on_service_charge_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_disputes_on_service_charge_id: %', SQLERRM;
END $$;

-- Индекс 149/466: index_dropbox_files_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_dropbox_files_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_dropbox_files_on_link_id ON public.dropbox_files USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_dropbox_files_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_dropbox_files_on_link_id: %', SQLERRM;
END $$;

-- Индекс 150/466: index_dropbox_files_on_product_file_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_dropbox_files_on_product_file_id') THEN
        EXECUTE 'CREATE INDEX index_dropbox_files_on_product_file_id ON public.dropbox_files USING btree (product_file_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_dropbox_files_on_product_file_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_dropbox_files_on_product_file_id: %', SQLERRM;
END $$;

-- Индекс 151/466: index_dropbox_files_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_dropbox_files_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_dropbox_files_on_user_id ON public.dropbox_files USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_dropbox_files_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_dropbox_files_on_user_id: %', SQLERRM;
END $$;

-- Индекс 152/466: index_email_info_charges_on_charge_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_email_info_charges_on_charge_id') THEN
        EXECUTE 'CREATE INDEX index_email_info_charges_on_charge_id ON public.email_info_charges USING btree (charge_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_email_info_charges_on_charge_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_email_info_charges_on_charge_id: %', SQLERRM;
END $$;

-- Индекс 153/466: index_email_info_charges_on_email_info_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_email_info_charges_on_email_info_id') THEN
        EXECUTE 'CREATE INDEX index_email_info_charges_on_email_info_id ON public.email_info_charges USING btree (email_info_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_email_info_charges_on_email_info_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_email_info_charges_on_email_info_id: %', SQLERRM;
END $$;

-- Индекс 154/466: index_email_infos_on_installment_id_and_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_email_infos_on_installment_id_and_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_email_infos_on_installment_id_and_purchase_id ON public.email_infos USING btree (installment_id, purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_email_infos_on_installment_id_and_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_email_infos_on_installment_id_and_purchase_id: %', SQLERRM;
END $$;

-- Индекс 155/466: index_email_infos_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_email_infos_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_email_infos_on_purchase_id ON public.email_infos USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_email_infos_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_email_infos_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 156/466: index_events_on_browser_guid
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_browser_guid') THEN
        EXECUTE 'CREATE INDEX index_events_on_browser_guid ON public.events USING btree (browser_guid);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_browser_guid не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_browser_guid: %', SQLERRM;
END $$;

-- Индекс 157/466: index_events_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_events_on_created_at ON public.events USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_created_at: %', SQLERRM;
END $$;

-- Индекс 158/466: index_events_on_event_name_and_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_event_name_and_link_id') THEN
        EXECUTE 'CREATE INDEX index_events_on_event_name_and_link_id ON public.events USING btree (event_name, link_id, created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_event_name_and_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_event_name_and_link_id: %', SQLERRM;
END $$;

-- Индекс 159/466: index_events_on_ip_address
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_ip_address') THEN
        EXECUTE 'CREATE INDEX index_events_on_ip_address ON public.events USING btree (ip_address);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_ip_address не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_ip_address: %', SQLERRM;
END $$;

-- Индекс 160/466: index_events_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_events_on_link_id ON public.events USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_link_id: %', SQLERRM;
END $$;

-- Индекс 161/466: index_events_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_events_on_purchase_id ON public.events USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 162/466: index_events_on_service_charge_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_service_charge_id') THEN
        EXECUTE 'CREATE INDEX index_events_on_service_charge_id ON public.events USING btree (service_charge_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_service_charge_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_service_charge_id: %', SQLERRM;
END $$;

-- Индекс 163/466: index_events_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_events_on_user_id ON public.events USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_user_id: %', SQLERRM;
END $$;

-- Индекс 164/466: index_events_on_visit_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_events_on_visit_id') THEN
        EXECUTE 'CREATE INDEX index_events_on_visit_id ON public.events USING btree (visit_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_events_on_visit_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_events_on_visit_id: %', SQLERRM;
END $$;

-- Индекс 165/466: index_followers_on_email_and_followed_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_followers_on_email_and_followed_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_followers_on_email_and_followed_id ON public.followers USING btree (email, followed_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_followers_on_email_and_followed_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_followers_on_email_and_followed_id: %', SQLERRM;
END $$;

-- Индекс 166/466: index_followers_on_followed_id_and_confirmed_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_followers_on_followed_id_and_confirmed_at') THEN
        EXECUTE 'CREATE INDEX index_followers_on_followed_id_and_confirmed_at ON public.followers USING btree (followed_id, confirmed_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_followers_on_followed_id_and_confirmed_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_followers_on_followed_id_and_confirmed_at: %', SQLERRM;
END $$;

-- Индекс 167/466: index_followers_on_followed_id_and_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_followers_on_followed_id_and_email') THEN
        EXECUTE 'CREATE INDEX index_followers_on_followed_id_and_email ON public.followers USING btree (followed_id, email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_followers_on_followed_id_and_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_followers_on_followed_id_and_email: %', SQLERRM;
END $$;

-- Индекс 168/466: index_friendly_id_slugs_on_slug_and_sluggable_type
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_friendly_id_slugs_on_slug_and_sluggable_type') THEN
        EXECUTE 'CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_friendly_id_slugs_on_slug_and_sluggable_type не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_friendly_id_slugs_on_slug_and_sluggable_type: %', SQLERRM;
END $$;

-- Индекс 169/466: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope: %', SQLERRM;
END $$;

-- Индекс 170/466: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_friendly_id_slugs_on_sluggable_type_and_sluggable_id') THEN
        EXECUTE 'CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_friendly_id_slugs_on_sluggable_type_and_sluggable_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_friendly_id_slugs_on_sluggable_type_and_sluggable_id: %', SQLERRM;
END $$;

-- Индекс 171/466: index_gifts_on_giftee_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_gifts_on_giftee_email') THEN
        EXECUTE 'CREATE INDEX index_gifts_on_giftee_email ON public.gifts USING btree (giftee_email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_gifts_on_giftee_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_gifts_on_giftee_email: %', SQLERRM;
END $$;

-- Индекс 172/466: index_gifts_on_giftee_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_gifts_on_giftee_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_gifts_on_giftee_purchase_id ON public.gifts USING btree (giftee_purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_gifts_on_giftee_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_gifts_on_giftee_purchase_id: %', SQLERRM;
END $$;

-- Индекс 173/466: index_gifts_on_gifter_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_gifts_on_gifter_email') THEN
        EXECUTE 'CREATE INDEX index_gifts_on_gifter_email ON public.gifts USING btree (gifter_email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_gifts_on_gifter_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_gifts_on_gifter_email: %', SQLERRM;
END $$;

-- Индекс 174/466: index_gifts_on_gifter_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_gifts_on_gifter_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_gifts_on_gifter_purchase_id ON public.gifts USING btree (gifter_purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_gifts_on_gifter_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_gifts_on_gifter_purchase_id: %', SQLERRM;
END $$;

-- Индекс 175/466: index_gumroad_daily_analytics_on_period_ended_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_gumroad_daily_analytics_on_period_ended_at') THEN
        EXECUTE 'CREATE INDEX index_gumroad_daily_analytics_on_period_ended_at ON public.gumroad_daily_analytics USING btree (period_ended_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_gumroad_daily_analytics_on_period_ended_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_gumroad_daily_analytics_on_period_ended_at: %', SQLERRM;
END $$;

-- Индекс 176/466: index_imported_customers_on_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_imported_customers_on_email') THEN
        EXECUTE 'CREATE INDEX index_imported_customers_on_email ON public.imported_customers USING btree (email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_imported_customers_on_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_imported_customers_on_email: %', SQLERRM;
END $$;

-- Индекс 177/466: index_imported_customers_on_importing_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_imported_customers_on_importing_user_id') THEN
        EXECUTE 'CREATE INDEX index_imported_customers_on_importing_user_id ON public.imported_customers USING btree (importing_user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_imported_customers_on_importing_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_imported_customers_on_importing_user_id: %', SQLERRM;
END $$;

-- Индекс 178/466: index_imported_customers_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_imported_customers_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_imported_customers_on_link_id ON public.imported_customers USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_imported_customers_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_imported_customers_on_link_id: %', SQLERRM;
END $$;

-- Индекс 179/466: index_imported_customers_on_link_id_and_purchase_date
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_imported_customers_on_link_id_and_purchase_date') THEN
        EXECUTE 'CREATE INDEX index_imported_customers_on_link_id_and_purchase_date ON public.imported_customers USING btree (link_id, purchase_date);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_imported_customers_on_link_id_and_purchase_date не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_imported_customers_on_link_id_and_purchase_date: %', SQLERRM;
END $$;

-- Индекс 180/466: index_installment_events_on_event_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installment_events_on_event_id') THEN
        EXECUTE 'CREATE INDEX index_installment_events_on_event_id ON public.installment_events USING btree (event_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installment_events_on_event_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installment_events_on_event_id: %', SQLERRM;
END $$;

-- Индекс 181/466: index_installment_events_on_installment_id_and_event_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installment_events_on_installment_id_and_event_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_installment_events_on_installment_id_and_event_id ON public.installment_events USING btree (installment_id, event_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installment_events_on_installment_id_and_event_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installment_events_on_installment_id_and_event_id: %', SQLERRM;
END $$;

-- Индекс 182/466: index_installment_rules_on_installment_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installment_rules_on_installment_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_installment_rules_on_installment_id ON public.installment_rules USING btree (installment_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installment_rules_on_installment_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installment_rules_on_installment_id: %', SQLERRM;
END $$;

-- Индекс 183/466: index_installments_on_base_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installments_on_base_variant_id') THEN
        EXECUTE 'CREATE INDEX index_installments_on_base_variant_id ON public.installments USING btree (base_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installments_on_base_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installments_on_base_variant_id: %', SQLERRM;
END $$;

-- Индекс 184/466: index_installments_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installments_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_installments_on_created_at ON public.installments USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installments_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installments_on_created_at: %', SQLERRM;
END $$;

-- Индекс 185/466: index_installments_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installments_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_installments_on_link_id ON public.installments USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installments_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installments_on_link_id: %', SQLERRM;
END $$;

-- Индекс 186/466: index_installments_on_seller_id_and_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installments_on_seller_id_and_link_id') THEN
        EXECUTE 'CREATE INDEX index_installments_on_seller_id_and_link_id ON public.installments USING btree (seller_id, link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installments_on_seller_id_and_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installments_on_seller_id_and_link_id: %', SQLERRM;
END $$;

-- Индекс 187/466: index_installments_on_slug
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installments_on_slug') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_installments_on_slug ON public.installments USING btree (slug);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installments_on_slug не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installments_on_slug: %', SQLERRM;
END $$;

-- Индекс 188/466: index_installments_on_workflow_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_installments_on_workflow_id') THEN
        EXECUTE 'CREATE INDEX index_installments_on_workflow_id ON public.installments USING btree (workflow_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_installments_on_workflow_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_installments_on_workflow_id: %', SQLERRM;
END $$;

-- Индекс 189/466: index_invites_on_receiver_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_invites_on_receiver_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_invites_on_receiver_id ON public.invites USING btree (receiver_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_invites_on_receiver_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_invites_on_receiver_id: %', SQLERRM;
END $$;

-- Индекс 190/466: index_invites_on_sender_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_invites_on_sender_id') THEN
        EXECUTE 'CREATE INDEX index_invites_on_sender_id ON public.invites USING btree (sender_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_invites_on_sender_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_invites_on_sender_id: %', SQLERRM;
END $$;

-- Индекс 191/466: index_large_sellers_on_updated_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_large_sellers_on_updated_at') THEN
        EXECUTE 'CREATE INDEX index_large_sellers_on_updated_at ON public.large_sellers USING btree (updated_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_large_sellers_on_updated_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_large_sellers_on_updated_at: %', SQLERRM;
END $$;

-- Индекс 192/466: index_large_sellers_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_large_sellers_on_user_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_large_sellers_on_user_id ON public.large_sellers USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_large_sellers_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_large_sellers_on_user_id: %', SQLERRM;
END $$;

-- Индекс 193/466: index_larger_product_id_and_sales_count
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_larger_product_id_and_sales_count') THEN
        EXECUTE 'CREATE INDEX index_larger_product_id_and_sales_count ON public.sales_related_products_infos USING btree (larger_product_id, sales_count);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_larger_product_id_and_sales_count не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_larger_product_id_and_sales_count: %', SQLERRM;
END $$;

-- Индекс 194/466: index_last_read_community_chat_messages_on_community_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_last_read_community_chat_messages_on_community_id') THEN
        EXECUTE 'CREATE INDEX index_last_read_community_chat_messages_on_community_id ON public.last_read_community_chat_messages USING btree (community_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_last_read_community_chat_messages_on_community_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_last_read_community_chat_messages_on_community_id: %', SQLERRM;
END $$;

-- Индекс 195/466: index_last_read_community_chat_messages_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_last_read_community_chat_messages_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_last_read_community_chat_messages_on_user_id ON public.last_read_community_chat_messages USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_last_read_community_chat_messages_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_last_read_community_chat_messages_on_user_id: %', SQLERRM;
END $$;

-- Индекс 196/466: index_legacy_permalinks_on_permalink
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_legacy_permalinks_on_permalink') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_legacy_permalinks_on_permalink ON public.legacy_permalinks USING btree (permalink);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_legacy_permalinks_on_permalink не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_legacy_permalinks_on_permalink: %', SQLERRM;
END $$;

-- Индекс 197/466: index_legacy_permalinks_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_legacy_permalinks_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_legacy_permalinks_on_product_id ON public.legacy_permalinks USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_legacy_permalinks_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_legacy_permalinks_on_product_id: %', SQLERRM;
END $$;

-- Индекс 198/466: index_licenses_on_imported_customer_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_licenses_on_imported_customer_id') THEN
        EXECUTE 'CREATE INDEX index_licenses_on_imported_customer_id ON public.licenses USING btree (imported_customer_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_licenses_on_imported_customer_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_licenses_on_imported_customer_id: %', SQLERRM;
END $$;

-- Индекс 199/466: index_licenses_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_licenses_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_licenses_on_link_id ON public.licenses USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_licenses_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_licenses_on_link_id: %', SQLERRM;
END $$;

-- Индекс 200/466: index_licenses_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_licenses_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_licenses_on_purchase_id ON public.licenses USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_licenses_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_licenses_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 201/466: index_licenses_on_serial
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_licenses_on_serial') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_licenses_on_serial ON public.licenses USING btree (serial);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_licenses_on_serial не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_licenses_on_serial: %', SQLERRM;
END $$;

-- Индекс 202/466: index_links_on_banned_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_links_on_banned_at') THEN
        EXECUTE 'CREATE INDEX index_links_on_banned_at ON public.links USING btree (banned_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_links_on_banned_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_links_on_banned_at: %', SQLERRM;
END $$;

-- Индекс 203/466: index_links_on_custom_permalink
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_links_on_custom_permalink') THEN
        EXECUTE 'CREATE INDEX index_links_on_custom_permalink ON public.links USING btree (custom_permalink);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_links_on_custom_permalink не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_links_on_custom_permalink: %', SQLERRM;
END $$;

-- Индекс 204/466: index_links_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_links_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_links_on_deleted_at ON public.links USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_links_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_links_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 205/466: index_links_on_showcaseable
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_links_on_showcaseable') THEN
        EXECUTE 'CREATE INDEX index_links_on_showcaseable ON public.links USING btree (showcaseable);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_links_on_showcaseable не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_links_on_showcaseable: %', SQLERRM;
END $$;

-- Индекс 206/466: index_links_on_taxonomy_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_links_on_taxonomy_id') THEN
        EXECUTE 'CREATE INDEX index_links_on_taxonomy_id ON public.links USING btree (taxonomy_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_links_on_taxonomy_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_links_on_taxonomy_id: %', SQLERRM;
END $$;

-- Индекс 207/466: index_links_on_unique_permalink
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_links_on_unique_permalink') THEN
        EXECUTE 'CREATE INDEX index_links_on_unique_permalink ON public.links USING btree (unique_permalink);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_links_on_unique_permalink не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_links_on_unique_permalink: %', SQLERRM;
END $$;

-- Индекс 208/466: index_links_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_links_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_links_on_user_id ON public.links USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_links_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_links_on_user_id: %', SQLERRM;
END $$;

-- Индекс 209/466: index_links_on_user_id_and_updated_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_links_on_user_id_and_updated_at') THEN
        EXECUTE 'CREATE INDEX index_links_on_user_id_and_updated_at ON public.links USING btree (user_id, updated_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_links_on_user_id_and_updated_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_links_on_user_id_and_updated_at: %', SQLERRM;
END $$;

-- Индекс 210/466: index_media_locations_on_product_file_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_media_locations_on_product_file_id') THEN
        EXECUTE 'CREATE INDEX index_media_locations_on_product_file_id ON public.media_locations USING btree (product_file_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_media_locations_on_product_file_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_media_locations_on_product_file_id: %', SQLERRM;
END $$;

-- Индекс 211/466: index_media_locations_on_product_id_and_updated_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_media_locations_on_product_id_and_updated_at') THEN
        EXECUTE 'CREATE INDEX index_media_locations_on_product_id_and_updated_at ON public.media_locations USING btree (product_id, updated_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_media_locations_on_product_id_and_updated_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_media_locations_on_product_id_and_updated_at: %', SQLERRM;
END $$;

-- Индекс 212/466: index_media_locations_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_media_locations_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_media_locations_on_purchase_id ON public.media_locations USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_media_locations_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_media_locations_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 213/466: index_merchant_accounts_on_charge_processor_merchant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_merchant_accounts_on_charge_processor_merchant_id') THEN
        EXECUTE 'CREATE INDEX index_merchant_accounts_on_charge_processor_merchant_id ON public.merchant_accounts USING btree (charge_processor_merchant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_merchant_accounts_on_charge_processor_merchant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_merchant_accounts_on_charge_processor_merchant_id: %', SQLERRM;
END $$;

-- Индекс 214/466: index_merchant_accounts_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_merchant_accounts_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_merchant_accounts_on_user_id ON public.merchant_accounts USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_merchant_accounts_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_merchant_accounts_on_user_id: %', SQLERRM;
END $$;

-- Индекс 215/466: index_oauth_access_grants_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_oauth_access_grants_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_oauth_access_grants_on_created_at ON public.oauth_access_grants USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_oauth_access_grants_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_oauth_access_grants_on_created_at: %', SQLERRM;
END $$;

-- Индекс 216/466: index_oauth_access_grants_on_token
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_oauth_access_grants_on_token') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_oauth_access_grants_on_token не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_oauth_access_grants_on_token: %', SQLERRM;
END $$;

-- Индекс 217/466: index_oauth_access_tokens_on_refresh_token
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_oauth_access_tokens_on_refresh_token') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_oauth_access_tokens_on_refresh_token не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_oauth_access_tokens_on_refresh_token: %', SQLERRM;
END $$;

-- Индекс 218/466: index_oauth_access_tokens_on_resource_owner_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_oauth_access_tokens_on_resource_owner_id') THEN
        EXECUTE 'CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_oauth_access_tokens_on_resource_owner_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_oauth_access_tokens_on_resource_owner_id: %', SQLERRM;
END $$;

-- Индекс 219/466: index_oauth_access_tokens_on_token
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_oauth_access_tokens_on_token') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_oauth_access_tokens_on_token не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_oauth_access_tokens_on_token: %', SQLERRM;
END $$;

-- Индекс 220/466: index_oauth_applications_on_owner_id_and_owner_type
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_oauth_applications_on_owner_id_and_owner_type') THEN
        EXECUTE 'CREATE INDEX index_oauth_applications_on_owner_id_and_owner_type ON public.oauth_applications USING btree (owner_id, owner_type);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_oauth_applications_on_owner_id_and_owner_type не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_oauth_applications_on_owner_id_and_owner_type: %', SQLERRM;
END $$;

-- Индекс 221/466: index_oauth_applications_on_uid
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_oauth_applications_on_uid') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_oauth_applications_on_uid не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_oauth_applications_on_uid: %', SQLERRM;
END $$;

-- Индекс 222/466: index_offer_codes_on_code_and_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_offer_codes_on_code_and_link_id') THEN
        EXECUTE 'CREATE INDEX index_offer_codes_on_code_and_link_id ON public.offer_codes USING btree (code, link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_offer_codes_on_code_and_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_offer_codes_on_code_and_link_id: %', SQLERRM;
END $$;

-- Индекс 223/466: index_offer_codes_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_offer_codes_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_offer_codes_on_link_id ON public.offer_codes USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_offer_codes_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_offer_codes_on_link_id: %', SQLERRM;
END $$;

-- Индекс 224/466: index_offer_codes_on_name_and_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_offer_codes_on_name_and_link_id') THEN
        EXECUTE 'CREATE INDEX index_offer_codes_on_name_and_link_id ON public.offer_codes USING btree (name, link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_offer_codes_on_name_and_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_offer_codes_on_name_and_link_id: %', SQLERRM;
END $$;

-- Индекс 225/466: index_offer_codes_on_universal
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_offer_codes_on_universal') THEN
        EXECUTE 'CREATE INDEX index_offer_codes_on_universal ON public.offer_codes USING btree (universal);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_offer_codes_on_universal не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_offer_codes_on_universal: %', SQLERRM;
END $$;

-- Индекс 226/466: index_offer_codes_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_offer_codes_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_offer_codes_on_user_id ON public.offer_codes USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_offer_codes_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_offer_codes_on_user_id: %', SQLERRM;
END $$;

-- Индекс 227/466: index_offer_codes_products_on_offer_code_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_offer_codes_products_on_offer_code_id') THEN
        EXECUTE 'CREATE INDEX index_offer_codes_products_on_offer_code_id ON public.offer_codes_products USING btree (offer_code_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_offer_codes_products_on_offer_code_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_offer_codes_products_on_offer_code_id: %', SQLERRM;
END $$;

-- Индекс 228/466: index_offer_codes_products_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_offer_codes_products_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_offer_codes_products_on_product_id ON public.offer_codes_products USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_offer_codes_products_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_offer_codes_products_on_product_id: %', SQLERRM;
END $$;

-- Индекс 229/466: index_on_user_merchant_account_date
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_on_user_merchant_account_date') THEN
        EXECUTE 'CREATE INDEX index_on_user_merchant_account_date ON public.balances USING btree (user_id, merchant_account_id, date);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_on_user_merchant_account_date не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_on_user_merchant_account_date: %', SQLERRM;
END $$;

-- Индекс 230/466: index_order_purchases_on_order_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_order_purchases_on_order_id') THEN
        EXECUTE 'CREATE INDEX index_order_purchases_on_order_id ON public.order_purchases USING btree (order_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_order_purchases_on_order_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_order_purchases_on_order_id: %', SQLERRM;
END $$;

-- Индекс 231/466: index_order_purchases_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_order_purchases_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_order_purchases_on_purchase_id ON public.order_purchases USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_order_purchases_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_order_purchases_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 232/466: index_orders_on_purchaser_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_orders_on_purchaser_id') THEN
        EXECUTE 'CREATE INDEX index_orders_on_purchaser_id ON public.orders USING btree (purchaser_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_orders_on_purchaser_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_orders_on_purchaser_id: %', SQLERRM;
END $$;

-- Индекс 233/466: index_payment_options_on_price_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_payment_options_on_price_id') THEN
        EXECUTE 'CREATE INDEX index_payment_options_on_price_id ON public.payment_options USING btree (price_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_payment_options_on_price_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_payment_options_on_price_id: %', SQLERRM;
END $$;

-- Индекс 234/466: index_payment_options_on_product_installment_plan_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_payment_options_on_product_installment_plan_id') THEN
        EXECUTE 'CREATE INDEX index_payment_options_on_product_installment_plan_id ON public.payment_options USING btree (product_installment_plan_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_payment_options_on_product_installment_plan_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_payment_options_on_product_installment_plan_id: %', SQLERRM;
END $$;

-- Индекс 235/466: index_payment_options_on_subscription_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_payment_options_on_subscription_id') THEN
        EXECUTE 'CREATE INDEX index_payment_options_on_subscription_id ON public.payment_options USING btree (subscription_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_payment_options_on_subscription_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_payment_options_on_subscription_id: %', SQLERRM;
END $$;

-- Индекс 236/466: index_payments_balances_on_balance_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_payments_balances_on_balance_id') THEN
        EXECUTE 'CREATE INDEX index_payments_balances_on_balance_id ON public.payments_balances USING btree (balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_payments_balances_on_balance_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_payments_balances_on_balance_id: %', SQLERRM;
END $$;

-- Индекс 237/466: index_payments_balances_on_payment_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_payments_balances_on_payment_id') THEN
        EXECUTE 'CREATE INDEX index_payments_balances_on_payment_id ON public.payments_balances USING btree (payment_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_payments_balances_on_payment_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_payments_balances_on_payment_id: %', SQLERRM;
END $$;

-- Индекс 238/466: index_payments_on_stripe_transfer_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_payments_on_stripe_transfer_id') THEN
        EXECUTE 'CREATE INDEX index_payments_on_stripe_transfer_id ON public.payments USING btree (stripe_transfer_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_payments_on_stripe_transfer_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_payments_on_stripe_transfer_id: %', SQLERRM;
END $$;

-- Индекс 239/466: index_payments_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_payments_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_payments_on_user_id ON public.payments USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_payments_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_payments_on_user_id: %', SQLERRM;
END $$;

-- Индекс 240/466: index_post_email_blasts_on_post_id_and_requested_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_post_email_blasts_on_post_id_and_requested_at') THEN
        EXECUTE 'CREATE INDEX index_post_email_blasts_on_post_id_and_requested_at ON public.post_email_blasts USING btree (post_id, requested_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_post_email_blasts_on_post_id_and_requested_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_post_email_blasts_on_post_id_and_requested_at: %', SQLERRM;
END $$;

-- Индекс 241/466: index_post_email_blasts_on_requested_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_post_email_blasts_on_requested_at') THEN
        EXECUTE 'CREATE INDEX index_post_email_blasts_on_requested_at ON public.post_email_blasts USING btree (requested_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_post_email_blasts_on_requested_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_post_email_blasts_on_requested_at: %', SQLERRM;
END $$;

-- Индекс 242/466: index_post_email_blasts_on_seller_id_and_requested_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_post_email_blasts_on_seller_id_and_requested_at') THEN
        EXECUTE 'CREATE INDEX index_post_email_blasts_on_seller_id_and_requested_at ON public.post_email_blasts USING btree (seller_id, requested_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_post_email_blasts_on_seller_id_and_requested_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_post_email_blasts_on_seller_id_and_requested_at: %', SQLERRM;
END $$;

-- Индекс 243/466: index_preorder_links_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_preorder_links_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_preorder_links_on_link_id ON public.preorder_links USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_preorder_links_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_preorder_links_on_link_id: %', SQLERRM;
END $$;

-- Индекс 244/466: index_preorders_on_preorder_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_preorders_on_preorder_link_id') THEN
        EXECUTE 'CREATE INDEX index_preorders_on_preorder_link_id ON public.preorders USING btree (preorder_link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_preorders_on_preorder_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_preorders_on_preorder_link_id: %', SQLERRM;
END $$;

-- Индекс 245/466: index_preorders_on_purchaser_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_preorders_on_purchaser_id') THEN
        EXECUTE 'CREATE INDEX index_preorders_on_purchaser_id ON public.preorders USING btree (purchaser_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_preorders_on_purchaser_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_preorders_on_purchaser_id: %', SQLERRM;
END $$;

-- Индекс 246/466: index_preorders_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_preorders_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_preorders_on_seller_id ON public.preorders USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_preorders_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_preorders_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 247/466: index_prices_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_prices_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_prices_on_link_id ON public.prices USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_prices_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_prices_on_link_id: %', SQLERRM;
END $$;

-- Индекс 248/466: index_prices_on_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_prices_on_variant_id') THEN
        EXECUTE 'CREATE INDEX index_prices_on_variant_id ON public.prices USING btree (variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_prices_on_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_prices_on_variant_id: %', SQLERRM;
END $$;

-- Индекс 249/466: index_processor_payment_intents_on_intent_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_processor_payment_intents_on_intent_id') THEN
        EXECUTE 'CREATE INDEX index_processor_payment_intents_on_intent_id ON public.processor_payment_intents USING btree (intent_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_processor_payment_intents_on_intent_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_processor_payment_intents_on_intent_id: %', SQLERRM;
END $$;

-- Индекс 250/466: index_processor_payment_intents_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_processor_payment_intents_on_purchase_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_processor_payment_intents_on_purchase_id ON public.processor_payment_intents USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_processor_payment_intents_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_processor_payment_intents_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 251/466: index_product_cached_values_on_expired
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_cached_values_on_expired') THEN
        EXECUTE 'CREATE INDEX index_product_cached_values_on_expired ON public.product_cached_values USING btree (expired);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_cached_values_on_expired не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_cached_values_on_expired: %', SQLERRM;
END $$;

-- Индекс 252/466: index_product_cached_values_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_cached_values_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_product_cached_values_on_product_id ON public.product_cached_values USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_cached_values_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_cached_values_on_product_id: %', SQLERRM;
END $$;

-- Индекс 253/466: index_product_files_archives_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_archives_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_product_files_archives_on_deleted_at ON public.product_files_archives USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_archives_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_archives_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 254/466: index_product_files_archives_on_deleted_from_cdn_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_archives_on_deleted_from_cdn_at') THEN
        EXECUTE 'CREATE INDEX index_product_files_archives_on_deleted_from_cdn_at ON public.product_files_archives USING btree (deleted_from_cdn_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_archives_on_deleted_from_cdn_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_archives_on_deleted_from_cdn_at: %', SQLERRM;
END $$;

-- Индекс 255/466: index_product_files_archives_on_folder_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_archives_on_folder_id') THEN
        EXECUTE 'CREATE INDEX index_product_files_archives_on_folder_id ON public.product_files_archives USING btree (folder_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_archives_on_folder_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_archives_on_folder_id: %', SQLERRM;
END $$;

-- Индекс 256/466: index_product_files_archives_on_installment_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_archives_on_installment_id') THEN
        EXECUTE 'CREATE INDEX index_product_files_archives_on_installment_id ON public.product_files_archives USING btree (installment_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_archives_on_installment_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_archives_on_installment_id: %', SQLERRM;
END $$;

-- Индекс 257/466: index_product_files_archives_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_archives_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_product_files_archives_on_link_id ON public.product_files_archives USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_archives_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_archives_on_link_id: %', SQLERRM;
END $$;

-- Индекс 258/466: index_product_files_archives_on_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_archives_on_variant_id') THEN
        EXECUTE 'CREATE INDEX index_product_files_archives_on_variant_id ON public.product_files_archives USING btree (variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_archives_on_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_archives_on_variant_id: %', SQLERRM;
END $$;

-- Индекс 259/466: index_product_files_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_product_files_on_deleted_at ON public.product_files USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 260/466: index_product_files_on_deleted_from_cdn_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_on_deleted_from_cdn_at') THEN
        EXECUTE 'CREATE INDEX index_product_files_on_deleted_from_cdn_at ON public.product_files USING btree (deleted_from_cdn_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_on_deleted_from_cdn_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_on_deleted_from_cdn_at: %', SQLERRM;
END $$;

-- Индекс 261/466: index_product_files_on_installment_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_on_installment_id') THEN
        EXECUTE 'CREATE INDEX index_product_files_on_installment_id ON public.product_files USING btree (installment_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_on_installment_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_on_installment_id: %', SQLERRM;
END $$;

-- Индекс 262/466: index_product_files_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_product_files_on_link_id ON public.product_files USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_on_link_id: %', SQLERRM;
END $$;

-- Индекс 263/466: index_product_files_on_url
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_files_on_url') THEN
        EXECUTE 'CREATE INDEX index_product_files_on_url ON public.product_files USING btree (url);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_files_on_url не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_files_on_url: %', SQLERRM;
END $$;

-- Индекс 264/466: index_product_folders_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_folders_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_product_folders_on_product_id ON public.product_folders USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_folders_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_folders_on_product_id: %', SQLERRM;
END $$;

-- Индекс 265/466: index_product_installment_plans_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_installment_plans_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_product_installment_plans_on_deleted_at ON public.product_installment_plans USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_installment_plans_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_installment_plans_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 266/466: index_product_installment_plans_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_installment_plans_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_product_installment_plans_on_link_id ON public.product_installment_plans USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_installment_plans_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_installment_plans_on_link_id: %', SQLERRM;
END $$;

-- Индекс 267/466: index_product_integrations_on_integration_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_integrations_on_integration_id') THEN
        EXECUTE 'CREATE INDEX index_product_integrations_on_integration_id ON public.product_integrations USING btree (integration_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_integrations_on_integration_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_integrations_on_integration_id: %', SQLERRM;
END $$;

-- Индекс 268/466: index_product_integrations_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_integrations_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_product_integrations_on_product_id ON public.product_integrations USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_integrations_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_integrations_on_product_id: %', SQLERRM;
END $$;

-- Индекс 269/466: index_product_review_responses_on_product_review_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_review_responses_on_product_review_id') THEN
        EXECUTE 'CREATE INDEX index_product_review_responses_on_product_review_id ON public.product_review_responses USING btree (product_review_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_review_responses_on_product_review_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_review_responses_on_product_review_id: %', SQLERRM;
END $$;

-- Индекс 270/466: index_product_review_responses_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_review_responses_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_product_review_responses_on_user_id ON public.product_review_responses USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_review_responses_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_review_responses_on_user_id: %', SQLERRM;
END $$;

-- Индекс 271/466: index_product_review_stats_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_review_stats_on_link_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_product_review_stats_on_link_id ON public.product_review_stats USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_review_stats_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_review_stats_on_link_id: %', SQLERRM;
END $$;

-- Индекс 272/466: index_product_review_videos_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_review_videos_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_product_review_videos_on_deleted_at ON public.product_review_videos USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_review_videos_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_review_videos_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 273/466: index_product_review_videos_on_product_review_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_review_videos_on_product_review_id') THEN
        EXECUTE 'CREATE INDEX index_product_review_videos_on_product_review_id ON public.product_review_videos USING btree (product_review_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_review_videos_on_product_review_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_review_videos_on_product_review_id: %', SQLERRM;
END $$;

-- Индекс 274/466: index_product_reviews_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_reviews_on_purchase_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_product_reviews_on_purchase_id ON public.product_reviews USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_reviews_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_reviews_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 275/466: index_product_taggings_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_taggings_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_product_taggings_on_product_id ON public.product_taggings USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_taggings_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_taggings_on_product_id: %', SQLERRM;
END $$;

-- Индекс 276/466: index_product_taggings_on_tag_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_product_taggings_on_tag_id') THEN
        EXECUTE 'CREATE INDEX index_product_taggings_on_tag_id ON public.product_taggings USING btree (tag_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_product_taggings_on_tag_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_product_taggings_on_tag_id: %', SQLERRM;
END $$;

-- Индекс 277/466: index_public_files_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_public_files_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_public_files_on_deleted_at ON public.public_files USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_public_files_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_public_files_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 278/466: index_public_files_on_file_group
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_public_files_on_file_group') THEN
        EXECUTE 'CREATE INDEX index_public_files_on_file_group ON public.public_files USING btree (file_group);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_public_files_on_file_group не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_public_files_on_file_group: %', SQLERRM;
END $$;

-- Индекс 279/466: index_public_files_on_file_type
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_public_files_on_file_type') THEN
        EXECUTE 'CREATE INDEX index_public_files_on_file_type ON public.public_files USING btree (file_type);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_public_files_on_file_type не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_public_files_on_file_type: %', SQLERRM;
END $$;

-- Индекс 280/466: index_public_files_on_public_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_public_files_on_public_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_public_files_on_public_id ON public.public_files USING btree (public_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_public_files_on_public_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_public_files_on_public_id: %', SQLERRM;
END $$;

-- Индекс 281/466: index_public_files_on_resource
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_public_files_on_resource') THEN
        EXECUTE 'CREATE INDEX index_public_files_on_resource ON public.public_files USING btree (resource_type, resource_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_public_files_on_resource не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_public_files_on_resource: %', SQLERRM;
END $$;

-- Индекс 282/466: index_public_files_on_scheduled_for_deletion_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_public_files_on_scheduled_for_deletion_at') THEN
        EXECUTE 'CREATE INDEX index_public_files_on_scheduled_for_deletion_at ON public.public_files USING btree (scheduled_for_deletion_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_public_files_on_scheduled_for_deletion_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_public_files_on_scheduled_for_deletion_at: %', SQLERRM;
END $$;

-- Индекс 283/466: index_public_files_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_public_files_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_public_files_on_seller_id ON public.public_files USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_public_files_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_public_files_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 284/466: index_purchase_chargeback_balance_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_chargeback_balance_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_chargeback_balance_id ON public.purchases USING btree (purchase_chargeback_balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_chargeback_balance_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_chargeback_balance_id: %', SQLERRM;
END $$;

-- Индекс 285/466: index_purchase_custom_fields_on_custom_field_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_custom_fields_on_custom_field_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_custom_fields_on_custom_field_id ON public.purchase_custom_fields USING btree (custom_field_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_custom_fields_on_custom_field_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_custom_fields_on_custom_field_id: %', SQLERRM;
END $$;

-- Индекс 286/466: index_purchase_custom_fields_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_custom_fields_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_custom_fields_on_purchase_id ON public.purchase_custom_fields USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_custom_fields_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_custom_fields_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 287/466: index_purchase_early_fraud_warnings_on_charge_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_early_fraud_warnings_on_charge_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_purchase_early_fraud_warnings_on_charge_id ON public.purchase_early_fraud_warnings USING btree (charge_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_early_fraud_warnings_on_charge_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_early_fraud_warnings_on_charge_id: %', SQLERRM;
END $$;

-- Индекс 288/466: index_purchase_early_fraud_warnings_on_processor_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_early_fraud_warnings_on_processor_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_purchase_early_fraud_warnings_on_processor_id ON public.purchase_early_fraud_warnings USING btree (processor_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_early_fraud_warnings_on_processor_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_early_fraud_warnings_on_processor_id: %', SQLERRM;
END $$;

-- Индекс 289/466: index_purchase_early_fraud_warnings_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_early_fraud_warnings_on_purchase_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_purchase_early_fraud_warnings_on_purchase_id ON public.purchase_early_fraud_warnings USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_early_fraud_warnings_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_early_fraud_warnings_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 290/466: index_purchase_integrations_on_integration_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_integrations_on_integration_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_integrations_on_integration_id ON public.purchase_integrations USING btree (integration_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_integrations_on_integration_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_integrations_on_integration_id: %', SQLERRM;
END $$;

-- Индекс 291/466: index_purchase_integrations_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_integrations_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_integrations_on_purchase_id ON public.purchase_integrations USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_integrations_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_integrations_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 292/466: index_purchase_offer_code_discounts_on_offer_code_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_offer_code_discounts_on_offer_code_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_offer_code_discounts_on_offer_code_id ON public.purchase_offer_code_discounts USING btree (offer_code_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_offer_code_discounts_on_offer_code_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_offer_code_discounts_on_offer_code_id: %', SQLERRM;
END $$;

-- Индекс 293/466: index_purchase_offer_code_discounts_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_offer_code_discounts_on_purchase_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_purchase_offer_code_discounts_on_purchase_id ON public.purchase_offer_code_discounts USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_offer_code_discounts_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_offer_code_discounts_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 294/466: index_purchase_refund_balance_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_refund_balance_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_refund_balance_id ON public.purchases USING btree (purchase_refund_balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_refund_balance_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_refund_balance_id: %', SQLERRM;
END $$;

-- Индекс 295/466: index_purchase_refund_policies_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_refund_policies_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_refund_policies_on_purchase_id ON public.purchase_refund_policies USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_refund_policies_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_refund_policies_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 296/466: index_purchase_sales_tax_infos_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_sales_tax_infos_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_sales_tax_infos_on_purchase_id ON public.purchase_sales_tax_infos USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_sales_tax_infos_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_sales_tax_infos_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 297/466: index_purchase_success_balance_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_success_balance_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_success_balance_id ON public.purchases USING btree (purchase_success_balance_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_success_balance_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_success_balance_id: %', SQLERRM;
END $$;

-- Индекс 298/466: index_purchase_taxjar_infos_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_taxjar_infos_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_purchase_taxjar_infos_on_purchase_id ON public.purchase_taxjar_infos USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_taxjar_infos_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_taxjar_infos_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 299/466: index_purchase_wallet_types_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_wallet_types_on_purchase_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_purchase_wallet_types_on_purchase_id ON public.purchase_wallet_types USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_wallet_types_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_wallet_types_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 300/466: index_purchase_wallet_types_on_wallet_type
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchase_wallet_types_on_wallet_type') THEN
        EXECUTE 'CREATE INDEX index_purchase_wallet_types_on_wallet_type ON public.purchase_wallet_types USING btree (wallet_type);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchase_wallet_types_on_wallet_type не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchase_wallet_types_on_wallet_type: %', SQLERRM;
END $$;

-- Индекс 301/466: index_purchases_on_affiliate_id_and_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_affiliate_id_and_created_at') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_affiliate_id_and_created_at ON public.purchases USING btree (affiliate_id, created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_affiliate_id_and_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_affiliate_id_and_created_at: %', SQLERRM;
END $$;

-- Индекс 302/466: index_purchases_on_browser_guid
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_browser_guid') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_browser_guid ON public.purchases USING btree (browser_guid);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_browser_guid не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_browser_guid: %', SQLERRM;
END $$;

-- Индекс 303/466: index_purchases_on_card_type_visual_date_fingerprint
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_card_type_visual_date_fingerprint') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_card_type_visual_date_fingerprint ON public.purchases USING btree (card_type, card_visual, created_at, stripe_fingerprint);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_card_type_visual_date_fingerprint не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_card_type_visual_date_fingerprint: %', SQLERRM;
END $$;

-- Индекс 304/466: index_purchases_on_card_type_visual_fingerprint
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_card_type_visual_fingerprint') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_card_type_visual_fingerprint ON public.purchases USING btree (card_type, card_visual, stripe_fingerprint);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_card_type_visual_fingerprint не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_card_type_visual_fingerprint: %', SQLERRM;
END $$;

-- Индекс 305/466: index_purchases_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_created_at ON public.purchases USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_created_at: %', SQLERRM;
END $$;

-- Индекс 306/466: index_purchases_on_email_long
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_email_long') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_email_long ON public.purchases USING btree (email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_email_long не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_email_long: %', SQLERRM;
END $$;

-- Индекс 307/466: index_purchases_on_full_name
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_full_name') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_full_name ON public.purchases USING btree (full_name);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_full_name не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_full_name: %', SQLERRM;
END $$;

-- Индекс 308/466: index_purchases_on_ip_address
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_ip_address') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_ip_address ON public.purchases USING btree (ip_address);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_ip_address не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_ip_address: %', SQLERRM;
END $$;

-- Индекс 309/466: index_purchases_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_link_id ON public.purchases USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_link_id: %', SQLERRM;
END $$;

-- Индекс 310/466: index_purchases_on_link_id_and_purchase_state_and_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_link_id_and_purchase_state_and_created_at') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_link_id_and_purchase_state_and_created_at ON public.purchases USING btree (link_id, purchase_state, created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_link_id_and_purchase_state_and_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_link_id_and_purchase_state_and_created_at: %', SQLERRM;
END $$;

-- Индекс 311/466: index_purchases_on_offer_code_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_offer_code_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_offer_code_id ON public.purchases USING btree (offer_code_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_offer_code_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_offer_code_id: %', SQLERRM;
END $$;

-- Индекс 312/466: index_purchases_on_paypal_order_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_paypal_order_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_paypal_order_id ON public.purchases USING btree (paypal_order_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_paypal_order_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_paypal_order_id: %', SQLERRM;
END $$;

-- Индекс 313/466: index_purchases_on_preorder_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_preorder_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_preorder_id ON public.purchases USING btree (preorder_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_preorder_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_preorder_id: %', SQLERRM;
END $$;

-- Индекс 314/466: index_purchases_on_purchase_state_and_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_purchase_state_and_created_at') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_purchase_state_and_created_at ON public.purchases USING btree (purchase_state, created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_purchase_state_and_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_purchase_state_and_created_at: %', SQLERRM;
END $$;

-- Индекс 315/466: index_purchases_on_purchaser_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_purchaser_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_purchaser_id ON public.purchases USING btree (purchaser_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_purchaser_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_purchaser_id: %', SQLERRM;
END $$;

-- Индекс 316/466: index_purchases_on_rental_expired
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_rental_expired') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_rental_expired ON public.purchases USING btree (rental_expired);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_rental_expired не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_rental_expired: %', SQLERRM;
END $$;

-- Индекс 317/466: index_purchases_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_seller_id ON public.purchases USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 318/466: index_purchases_on_seller_id_and_chargeback_date
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_seller_id_and_chargeback_date') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_seller_id_and_chargeback_date ON public.purchases USING btree (seller_id, chargeback_date);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_seller_id_and_chargeback_date не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_seller_id_and_chargeback_date: %', SQLERRM;
END $$;

-- Индекс 319/466: index_purchases_on_seller_id_and_succeeded_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_seller_id_and_succeeded_at') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_seller_id_and_succeeded_at ON public.purchases USING btree (seller_id, succeeded_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_seller_id_and_succeeded_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_seller_id_and_succeeded_at: %', SQLERRM;
END $$;

-- Индекс 320/466: index_purchases_on_stripe_fingerprint
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_stripe_fingerprint') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_stripe_fingerprint ON public.purchases USING btree (stripe_fingerprint);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_stripe_fingerprint не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_stripe_fingerprint: %', SQLERRM;
END $$;

-- Индекс 321/466: index_purchases_on_stripe_transaction_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_stripe_transaction_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_stripe_transaction_id ON public.purchases USING btree (stripe_transaction_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_stripe_transaction_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_stripe_transaction_id: %', SQLERRM;
END $$;

-- Индекс 322/466: index_purchases_on_subscription_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_on_subscription_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_on_subscription_id ON public.purchases USING btree (subscription_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_on_subscription_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_on_subscription_id: %', SQLERRM;
END $$;

-- Индекс 323/466: index_purchases_variants_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_variants_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_variants_on_purchase_id ON public.base_variants_purchases USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_variants_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_variants_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 324/466: index_purchases_variants_on_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchases_variants_on_variant_id') THEN
        EXECUTE 'CREATE INDEX index_purchases_variants_on_variant_id ON public.base_variants_purchases USING btree (base_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchases_variants_on_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchases_variants_on_variant_id: %', SQLERRM;
END $$;

-- Индекс 325/466: index_purchasing_power_parity_infos_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_purchasing_power_parity_infos_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_purchasing_power_parity_infos_on_purchase_id ON public.purchasing_power_parity_infos USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_purchasing_power_parity_infos_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_purchasing_power_parity_infos_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 326/466: index_recommended_purchase_infos_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_recommended_purchase_infos_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_recommended_purchase_infos_on_purchase_id ON public.recommended_purchase_infos USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_recommended_purchase_infos_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_recommended_purchase_infos_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 327/466: index_recommended_purchase_infos_on_recommended_by_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_recommended_purchase_infos_on_recommended_by_link_id') THEN
        EXECUTE 'CREATE INDEX index_recommended_purchase_infos_on_recommended_by_link_id ON public.recommended_purchase_infos USING btree (recommended_by_link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_recommended_purchase_infos_on_recommended_by_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_recommended_purchase_infos_on_recommended_by_link_id: %', SQLERRM;
END $$;

-- Индекс 328/466: index_recommended_purchase_infos_on_recommended_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_recommended_purchase_infos_on_recommended_link_id') THEN
        EXECUTE 'CREATE INDEX index_recommended_purchase_infos_on_recommended_link_id ON public.recommended_purchase_infos USING btree (recommended_link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_recommended_purchase_infos_on_recommended_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_recommended_purchase_infos_on_recommended_link_id: %', SQLERRM;
END $$;

-- Индекс 329/466: index_recurring_services_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_recurring_services_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_recurring_services_on_user_id ON public.recurring_services USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_recurring_services_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_recurring_services_on_user_id: %', SQLERRM;
END $$;

-- Индекс 330/466: index_refund_policies_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_refund_policies_on_product_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_refund_policies_on_product_id ON public.refund_policies USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_refund_policies_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_refund_policies_on_product_id: %', SQLERRM;
END $$;

-- Индекс 331/466: index_refund_policies_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_refund_policies_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_refund_policies_on_seller_id ON public.refund_policies USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_refund_policies_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_refund_policies_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 332/466: index_refunds_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_refunds_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_refunds_on_link_id ON public.refunds USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_refunds_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_refunds_on_link_id: %', SQLERRM;
END $$;

-- Индекс 333/466: index_refunds_on_processor_refund_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_refunds_on_processor_refund_id') THEN
        EXECUTE 'CREATE INDEX index_refunds_on_processor_refund_id ON public.refunds USING btree (processor_refund_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_refunds_on_processor_refund_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_refunds_on_processor_refund_id: %', SQLERRM;
END $$;

-- Индекс 334/466: index_refunds_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_refunds_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_refunds_on_purchase_id ON public.refunds USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_refunds_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_refunds_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 335/466: index_refunds_on_seller_id_and_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_refunds_on_seller_id_and_created_at') THEN
        EXECUTE 'CREATE INDEX index_refunds_on_seller_id_and_created_at ON public.refunds USING btree (seller_id, created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_refunds_on_seller_id_and_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_refunds_on_seller_id_and_created_at: %', SQLERRM;
END $$;

-- Индекс 336/466: index_resource_subscriptions_on_oauth_application_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_resource_subscriptions_on_oauth_application_id') THEN
        EXECUTE 'CREATE INDEX index_resource_subscriptions_on_oauth_application_id ON public.resource_subscriptions USING btree (oauth_application_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_resource_subscriptions_on_oauth_application_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_resource_subscriptions_on_oauth_application_id: %', SQLERRM;
END $$;

-- Индекс 337/466: index_resource_subscriptions_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_resource_subscriptions_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_resource_subscriptions_on_user_id ON public.resource_subscriptions USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_resource_subscriptions_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_resource_subscriptions_on_user_id: %', SQLERRM;
END $$;

-- Индекс 338/466: index_rich_contents_on_entity_id_and_entity_type
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_rich_contents_on_entity_id_and_entity_type') THEN
        EXECUTE 'CREATE INDEX index_rich_contents_on_entity_id_and_entity_type ON public.rich_contents USING btree (entity_id, entity_type);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_rich_contents_on_entity_id_and_entity_type не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_rich_contents_on_entity_id_and_entity_type: %', SQLERRM;
END $$;

-- Индекс 339/466: index_sales_export_chunks_on_export_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_sales_export_chunks_on_export_id') THEN
        EXECUTE 'CREATE INDEX index_sales_export_chunks_on_export_id ON public.sales_export_chunks USING btree (export_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_sales_export_chunks_on_export_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_sales_export_chunks_on_export_id: %', SQLERRM;
END $$;

-- Индекс 340/466: index_sales_exports_on_recipient_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_sales_exports_on_recipient_id') THEN
        EXECUTE 'CREATE INDEX index_sales_exports_on_recipient_id ON public.sales_exports USING btree (recipient_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_sales_exports_on_recipient_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_sales_exports_on_recipient_id: %', SQLERRM;
END $$;

-- Индекс 341/466: index_self_service_affiliate_products_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_self_service_affiliate_products_on_product_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_self_service_affiliate_products_on_product_id ON public.self_service_affiliate_products USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_self_service_affiliate_products_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_self_service_affiliate_products_on_product_id: %', SQLERRM;
END $$;

-- Индекс 342/466: index_self_service_affiliate_products_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_self_service_affiliate_products_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_self_service_affiliate_products_on_seller_id ON public.self_service_affiliate_products USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_self_service_affiliate_products_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_self_service_affiliate_products_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 343/466: index_seller_profile_sections_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_seller_profile_sections_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_seller_profile_sections_on_product_id ON public.seller_profile_sections USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_seller_profile_sections_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_seller_profile_sections_on_product_id: %', SQLERRM;
END $$;

-- Индекс 344/466: index_seller_profile_sections_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_seller_profile_sections_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_seller_profile_sections_on_seller_id ON public.seller_profile_sections USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_seller_profile_sections_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_seller_profile_sections_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 345/466: index_seller_profiles_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_seller_profiles_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_seller_profiles_on_seller_id ON public.seller_profiles USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_seller_profiles_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_seller_profiles_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 346/466: index_sent_abandoned_cart_emails_on_cart_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_sent_abandoned_cart_emails_on_cart_id') THEN
        EXECUTE 'CREATE INDEX index_sent_abandoned_cart_emails_on_cart_id ON public.sent_abandoned_cart_emails USING btree (cart_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_sent_abandoned_cart_emails_on_cart_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_sent_abandoned_cart_emails_on_cart_id: %', SQLERRM;
END $$;

-- Индекс 347/466: index_sent_abandoned_cart_emails_on_installment_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_sent_abandoned_cart_emails_on_installment_id') THEN
        EXECUTE 'CREATE INDEX index_sent_abandoned_cart_emails_on_installment_id ON public.sent_abandoned_cart_emails USING btree (installment_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_sent_abandoned_cart_emails_on_installment_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_sent_abandoned_cart_emails_on_installment_id: %', SQLERRM;
END $$;

-- Индекс 348/466: index_sent_email_infos_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_sent_email_infos_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_sent_email_infos_on_created_at ON public.sent_email_infos USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_sent_email_infos_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_sent_email_infos_on_created_at: %', SQLERRM;
END $$;

-- Индекс 349/466: index_sent_email_infos_on_key
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_sent_email_infos_on_key') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_sent_email_infos_on_key ON public.sent_email_infos USING btree (key);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_sent_email_infos_on_key не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_sent_email_infos_on_key: %', SQLERRM;
END $$;

-- Индекс 350/466: index_sent_post_emails_on_post_id_and_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_sent_post_emails_on_post_id_and_email') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_sent_post_emails_on_post_id_and_email ON public.sent_post_emails USING btree (post_id, email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_sent_post_emails_on_post_id_and_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_sent_post_emails_on_post_id_and_email: %', SQLERRM;
END $$;

-- Индекс 351/466: index_service_charges_on_card_type_visual_date_fingerprint
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_service_charges_on_card_type_visual_date_fingerprint') THEN
        EXECUTE 'CREATE INDEX index_service_charges_on_card_type_visual_date_fingerprint ON public.service_charges USING btree (card_type, card_visual, created_at, charge_processor_fingerprint);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_service_charges_on_card_type_visual_date_fingerprint не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_service_charges_on_card_type_visual_date_fingerprint: %', SQLERRM;
END $$;

-- Индекс 352/466: index_service_charges_on_card_type_visual_fingerprint
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_service_charges_on_card_type_visual_fingerprint') THEN
        EXECUTE 'CREATE INDEX index_service_charges_on_card_type_visual_fingerprint ON public.service_charges USING btree (card_type, card_visual, charge_processor_fingerprint);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_service_charges_on_card_type_visual_fingerprint не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_service_charges_on_card_type_visual_fingerprint: %', SQLERRM;
END $$;

-- Индекс 353/466: index_service_charges_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_service_charges_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_service_charges_on_created_at ON public.service_charges USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_service_charges_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_service_charges_on_created_at: %', SQLERRM;
END $$;

-- Индекс 354/466: index_service_charges_on_recurring_service_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_service_charges_on_recurring_service_id') THEN
        EXECUTE 'CREATE INDEX index_service_charges_on_recurring_service_id ON public.service_charges USING btree (recurring_service_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_service_charges_on_recurring_service_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_service_charges_on_recurring_service_id: %', SQLERRM;
END $$;

-- Индекс 355/466: index_service_charges_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_service_charges_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_service_charges_on_user_id ON public.service_charges USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_service_charges_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_service_charges_on_user_id: %', SQLERRM;
END $$;

-- Индекс 356/466: index_shipments_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_shipments_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_shipments_on_purchase_id ON public.shipments USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_shipments_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_shipments_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 357/466: index_shipping_destinations_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_shipping_destinations_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_shipping_destinations_on_link_id ON public.shipping_destinations USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_shipping_destinations_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_shipping_destinations_on_link_id: %', SQLERRM;
END $$;

-- Индекс 358/466: index_shipping_destinations_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_shipping_destinations_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_shipping_destinations_on_user_id ON public.shipping_destinations USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_shipping_destinations_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_shipping_destinations_on_user_id: %', SQLERRM;
END $$;

-- Индекс 359/466: index_skus_variants_on_sku_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_skus_variants_on_sku_id') THEN
        EXECUTE 'CREATE INDEX index_skus_variants_on_sku_id ON public.skus_variants USING btree (sku_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_skus_variants_on_sku_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_skus_variants_on_sku_id: %', SQLERRM;
END $$;

-- Индекс 360/466: index_skus_variants_on_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_skus_variants_on_variant_id') THEN
        EXECUTE 'CREATE INDEX index_skus_variants_on_variant_id ON public.skus_variants USING btree (variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_skus_variants_on_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_skus_variants_on_variant_id: %', SQLERRM;
END $$;

-- Индекс 361/466: index_smaller_and_larger_product_ids
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_smaller_and_larger_product_ids') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_smaller_and_larger_product_ids ON public.sales_related_products_infos USING btree (smaller_product_id, larger_product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_smaller_and_larger_product_ids не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_smaller_and_larger_product_ids: %', SQLERRM;
END $$;

-- Индекс 362/466: index_smaller_product_id_and_sales_count
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_smaller_product_id_and_sales_count') THEN
        EXECUTE 'CREATE INDEX index_smaller_product_id_and_sales_count ON public.sales_related_products_infos USING btree (smaller_product_id, sales_count);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_smaller_product_id_and_sales_count не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_smaller_product_id_and_sales_count: %', SQLERRM;
END $$;

-- Индекс 363/466: index_staff_picked_products_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_staff_picked_products_on_product_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_staff_picked_products_on_product_id ON public.staff_picked_products USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_staff_picked_products_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_staff_picked_products_on_product_id: %', SQLERRM;
END $$;

-- Индекс 364/466: index_stamped_pdfs_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_stamped_pdfs_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_stamped_pdfs_on_created_at ON public.stamped_pdfs USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_stamped_pdfs_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_stamped_pdfs_on_created_at: %', SQLERRM;
END $$;

-- Индекс 365/466: index_stamped_pdfs_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_stamped_pdfs_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_stamped_pdfs_on_deleted_at ON public.stamped_pdfs USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_stamped_pdfs_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_stamped_pdfs_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 366/466: index_stamped_pdfs_on_deleted_from_cdn_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_stamped_pdfs_on_deleted_from_cdn_at') THEN
        EXECUTE 'CREATE INDEX index_stamped_pdfs_on_deleted_from_cdn_at ON public.stamped_pdfs USING btree (deleted_from_cdn_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_stamped_pdfs_on_deleted_from_cdn_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_stamped_pdfs_on_deleted_from_cdn_at: %', SQLERRM;
END $$;

-- Индекс 367/466: index_stamped_pdfs_on_product_file_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_stamped_pdfs_on_product_file_id') THEN
        EXECUTE 'CREATE INDEX index_stamped_pdfs_on_product_file_id ON public.stamped_pdfs USING btree (product_file_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_stamped_pdfs_on_product_file_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_stamped_pdfs_on_product_file_id: %', SQLERRM;
END $$;

-- Индекс 368/466: index_stamped_pdfs_on_url
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_stamped_pdfs_on_url') THEN
        EXECUTE 'CREATE INDEX index_stamped_pdfs_on_url ON public.stamped_pdfs USING btree (url);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_stamped_pdfs_on_url не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_stamped_pdfs_on_url: %', SQLERRM;
END $$;

-- Индекс 369/466: index_stamped_pdfs_on_url_redirect_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_stamped_pdfs_on_url_redirect_id') THEN
        EXECUTE 'CREATE INDEX index_stamped_pdfs_on_url_redirect_id ON public.stamped_pdfs USING btree (url_redirect_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_stamped_pdfs_on_url_redirect_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_stamped_pdfs_on_url_redirect_id: %', SQLERRM;
END $$;

-- Индекс 370/466: index_stripe_apple_pay_domains_on_domain
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_stripe_apple_pay_domains_on_domain') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_stripe_apple_pay_domains_on_domain ON public.stripe_apple_pay_domains USING btree (domain);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_stripe_apple_pay_domains_on_domain не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_stripe_apple_pay_domains_on_domain: %', SQLERRM;
END $$;

-- Индекс 371/466: index_stripe_apple_pay_domains_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_stripe_apple_pay_domains_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_stripe_apple_pay_domains_on_user_id ON public.stripe_apple_pay_domains USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_stripe_apple_pay_domains_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_stripe_apple_pay_domains_on_user_id: %', SQLERRM;
END $$;

-- Индекс 372/466: index_subscription_events_on_seller_id_and_occurred_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscription_events_on_seller_id_and_occurred_at') THEN
        EXECUTE 'CREATE INDEX index_subscription_events_on_seller_id_and_occurred_at ON public.subscription_events USING btree (seller_id, occurred_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscription_events_on_seller_id_and_occurred_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscription_events_on_seller_id_and_occurred_at: %', SQLERRM;
END $$;

-- Индекс 373/466: index_subscription_events_on_subscription_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscription_events_on_subscription_id') THEN
        EXECUTE 'CREATE INDEX index_subscription_events_on_subscription_id ON public.subscription_events USING btree (subscription_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscription_events_on_subscription_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscription_events_on_subscription_id: %', SQLERRM;
END $$;

-- Индекс 374/466: index_subscription_plan_changes_on_base_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscription_plan_changes_on_base_variant_id') THEN
        EXECUTE 'CREATE INDEX index_subscription_plan_changes_on_base_variant_id ON public.subscription_plan_changes USING btree (base_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscription_plan_changes_on_base_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscription_plan_changes_on_base_variant_id: %', SQLERRM;
END $$;

-- Индекс 375/466: index_subscription_plan_changes_on_subscription_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscription_plan_changes_on_subscription_id') THEN
        EXECUTE 'CREATE INDEX index_subscription_plan_changes_on_subscription_id ON public.subscription_plan_changes USING btree (subscription_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscription_plan_changes_on_subscription_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscription_plan_changes_on_subscription_id: %', SQLERRM;
END $$;

-- Индекс 376/466: index_subscriptions_on_cancelled_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscriptions_on_cancelled_at') THEN
        EXECUTE 'CREATE INDEX index_subscriptions_on_cancelled_at ON public.subscriptions USING btree (cancelled_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscriptions_on_cancelled_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscriptions_on_cancelled_at: %', SQLERRM;
END $$;

-- Индекс 377/466: index_subscriptions_on_deactivated_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscriptions_on_deactivated_at') THEN
        EXECUTE 'CREATE INDEX index_subscriptions_on_deactivated_at ON public.subscriptions USING btree (deactivated_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscriptions_on_deactivated_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscriptions_on_deactivated_at: %', SQLERRM;
END $$;

-- Индекс 378/466: index_subscriptions_on_ended_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscriptions_on_ended_at') THEN
        EXECUTE 'CREATE INDEX index_subscriptions_on_ended_at ON public.subscriptions USING btree (ended_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscriptions_on_ended_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscriptions_on_ended_at: %', SQLERRM;
END $$;

-- Индекс 379/466: index_subscriptions_on_failed_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscriptions_on_failed_at') THEN
        EXECUTE 'CREATE INDEX index_subscriptions_on_failed_at ON public.subscriptions USING btree (failed_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscriptions_on_failed_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscriptions_on_failed_at: %', SQLERRM;
END $$;

-- Индекс 380/466: index_subscriptions_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscriptions_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_subscriptions_on_link_id ON public.subscriptions USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscriptions_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscriptions_on_link_id: %', SQLERRM;
END $$;

-- Индекс 381/466: index_subscriptions_on_link_id_and_flags
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscriptions_on_link_id_and_flags') THEN
        EXECUTE 'CREATE INDEX index_subscriptions_on_link_id_and_flags ON public.subscriptions USING btree (link_id, flags);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscriptions_on_link_id_and_flags не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscriptions_on_link_id_and_flags: %', SQLERRM;
END $$;

-- Индекс 382/466: index_subscriptions_on_seller_id_and_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscriptions_on_seller_id_and_created_at') THEN
        EXECUTE 'CREATE INDEX index_subscriptions_on_seller_id_and_created_at ON public.subscriptions USING btree (seller_id, created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscriptions_on_seller_id_and_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscriptions_on_seller_id_and_created_at: %', SQLERRM;
END $$;

-- Индекс 383/466: index_subscriptions_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subscriptions_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_subscriptions_on_user_id ON public.subscriptions USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subscriptions_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subscriptions_on_user_id: %', SQLERRM;
END $$;

-- Индекс 384/466: index_subtitle_files_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subtitle_files_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_subtitle_files_on_deleted_at ON public.subtitle_files USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subtitle_files_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subtitle_files_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 385/466: index_subtitle_files_on_product_file_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subtitle_files_on_product_file_id') THEN
        EXECUTE 'CREATE INDEX index_subtitle_files_on_product_file_id ON public.subtitle_files USING btree (product_file_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subtitle_files_on_product_file_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subtitle_files_on_product_file_id: %', SQLERRM;
END $$;

-- Индекс 386/466: index_subtitle_files_on_url
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_subtitle_files_on_url') THEN
        EXECUTE 'CREATE INDEX index_subtitle_files_on_url ON public.subtitle_files USING btree (url);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_subtitle_files_on_url не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_subtitle_files_on_url: %', SQLERRM;
END $$;

-- Индекс 387/466: index_tags_on_name
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_tags_on_name') THEN
        EXECUTE 'CREATE INDEX index_tags_on_name ON public.tags USING btree (name);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_tags_on_name не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_tags_on_name: %', SQLERRM;
END $$;

-- Индекс 388/466: index_taxonomies_on_parent_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_taxonomies_on_parent_id') THEN
        EXECUTE 'CREATE INDEX index_taxonomies_on_parent_id ON public.taxonomies USING btree (parent_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_taxonomies_on_parent_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_taxonomies_on_parent_id: %', SQLERRM;
END $$;

-- Индекс 389/466: index_taxonomy_stats_on_taxonomy_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_taxonomy_stats_on_taxonomy_id') THEN
        EXECUTE 'CREATE INDEX index_taxonomy_stats_on_taxonomy_id ON public.taxonomy_stats USING btree (taxonomy_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_taxonomy_stats_on_taxonomy_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_taxonomy_stats_on_taxonomy_id: %', SQLERRM;
END $$;

-- Индекс 390/466: index_team_invitations_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_team_invitations_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_team_invitations_on_seller_id ON public.team_invitations USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_team_invitations_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_team_invitations_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 391/466: index_team_memberships_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_team_memberships_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_team_memberships_on_seller_id ON public.team_memberships USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_team_memberships_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_team_memberships_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 392/466: index_team_memberships_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_team_memberships_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_team_memberships_on_user_id ON public.team_memberships USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_team_memberships_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_team_memberships_on_user_id: %', SQLERRM;
END $$;

-- Индекс 393/466: index_third_party_analytics_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_third_party_analytics_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_third_party_analytics_on_link_id ON public.third_party_analytics USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_third_party_analytics_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_third_party_analytics_on_link_id: %', SQLERRM;
END $$;

-- Индекс 394/466: index_third_party_analytics_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_third_party_analytics_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_third_party_analytics_on_user_id ON public.third_party_analytics USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_third_party_analytics_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_third_party_analytics_on_user_id: %', SQLERRM;
END $$;

-- Индекс 395/466: index_thumbnails_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_thumbnails_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_thumbnails_on_product_id ON public.thumbnails USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_thumbnails_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_thumbnails_on_product_id: %', SQLERRM;
END $$;

-- Индекс 396/466: index_tips_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_tips_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_tips_on_purchase_id ON public.tips USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_tips_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_tips_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 397/466: index_top_sellers_on_rank
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_top_sellers_on_rank') THEN
        EXECUTE 'CREATE INDEX index_top_sellers_on_rank ON public.top_sellers USING btree (rank);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_top_sellers_on_rank не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_top_sellers_on_rank: %', SQLERRM;
END $$;

-- Индекс 398/466: index_top_sellers_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_top_sellers_on_user_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_top_sellers_on_user_id ON public.top_sellers USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_top_sellers_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_top_sellers_on_user_id: %', SQLERRM;
END $$;

-- Индекс 399/466: index_tos_agreements_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_tos_agreements_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_tos_agreements_on_user_id ON public.tos_agreements USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_tos_agreements_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_tos_agreements_on_user_id: %', SQLERRM;
END $$;

-- Индекс 400/466: index_transcoded_videos_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_deleted_at ON public.transcoded_videos USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 401/466: index_transcoded_videos_on_deleted_from_cdn_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_deleted_from_cdn_at') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_deleted_from_cdn_at ON public.transcoded_videos USING btree (deleted_from_cdn_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_deleted_from_cdn_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_deleted_from_cdn_at: %', SQLERRM;
END $$;

-- Индекс 402/466: index_transcoded_videos_on_job_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_job_id') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_job_id ON public.transcoded_videos USING btree (job_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_job_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_job_id: %', SQLERRM;
END $$;

-- Индекс 403/466: index_transcoded_videos_on_last_accessed_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_last_accessed_at') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_last_accessed_at ON public.transcoded_videos USING btree (last_accessed_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_last_accessed_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_last_accessed_at: %', SQLERRM;
END $$;

-- Индекс 404/466: index_transcoded_videos_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_link_id ON public.transcoded_videos USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_link_id: %', SQLERRM;
END $$;

-- Индекс 405/466: index_transcoded_videos_on_original_video_key
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_original_video_key') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_original_video_key ON public.transcoded_videos USING btree (original_video_key);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_original_video_key не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_original_video_key: %', SQLERRM;
END $$;

-- Индекс 406/466: index_transcoded_videos_on_product_file_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_product_file_id') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_product_file_id ON public.transcoded_videos USING btree (product_file_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_product_file_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_product_file_id: %', SQLERRM;
END $$;

-- Индекс 407/466: index_transcoded_videos_on_streamable_type_and_streamable_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_streamable_type_and_streamable_id') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_streamable_type_and_streamable_id ON public.transcoded_videos USING btree (streamable_type, streamable_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_streamable_type_and_streamable_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_streamable_type_and_streamable_id: %', SQLERRM;
END $$;

-- Индекс 408/466: index_transcoded_videos_on_transcoded_video_key
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_transcoded_videos_on_transcoded_video_key') THEN
        EXECUTE 'CREATE INDEX index_transcoded_videos_on_transcoded_video_key ON public.transcoded_videos USING btree (transcoded_video_key);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_transcoded_videos_on_transcoded_video_key не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_transcoded_videos_on_transcoded_video_key: %', SQLERRM;
END $$;

-- Индекс 409/466: index_upsell_purchases_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsell_purchases_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_upsell_purchases_on_purchase_id ON public.upsell_purchases USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsell_purchases_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsell_purchases_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 410/466: index_upsell_purchases_on_selected_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsell_purchases_on_selected_product_id') THEN
        EXECUTE 'CREATE INDEX index_upsell_purchases_on_selected_product_id ON public.upsell_purchases USING btree (selected_product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsell_purchases_on_selected_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsell_purchases_on_selected_product_id: %', SQLERRM;
END $$;

-- Индекс 411/466: index_upsell_purchases_on_upsell_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsell_purchases_on_upsell_id') THEN
        EXECUTE 'CREATE INDEX index_upsell_purchases_on_upsell_id ON public.upsell_purchases USING btree (upsell_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsell_purchases_on_upsell_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsell_purchases_on_upsell_id: %', SQLERRM;
END $$;

-- Индекс 412/466: index_upsell_purchases_on_upsell_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsell_purchases_on_upsell_variant_id') THEN
        EXECUTE 'CREATE INDEX index_upsell_purchases_on_upsell_variant_id ON public.upsell_purchases USING btree (upsell_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsell_purchases_on_upsell_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsell_purchases_on_upsell_variant_id: %', SQLERRM;
END $$;

-- Индекс 413/466: index_upsell_variants_on_offered_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsell_variants_on_offered_variant_id') THEN
        EXECUTE 'CREATE INDEX index_upsell_variants_on_offered_variant_id ON public.upsell_variants USING btree (offered_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsell_variants_on_offered_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsell_variants_on_offered_variant_id: %', SQLERRM;
END $$;

-- Индекс 414/466: index_upsell_variants_on_selected_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsell_variants_on_selected_variant_id') THEN
        EXECUTE 'CREATE INDEX index_upsell_variants_on_selected_variant_id ON public.upsell_variants USING btree (selected_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsell_variants_on_selected_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsell_variants_on_selected_variant_id: %', SQLERRM;
END $$;

-- Индекс 415/466: index_upsell_variants_on_upsell_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsell_variants_on_upsell_id') THEN
        EXECUTE 'CREATE INDEX index_upsell_variants_on_upsell_id ON public.upsell_variants USING btree (upsell_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsell_variants_on_upsell_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsell_variants_on_upsell_id: %', SQLERRM;
END $$;

-- Индекс 416/466: index_upsells_on_offer_code_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsells_on_offer_code_id') THEN
        EXECUTE 'CREATE INDEX index_upsells_on_offer_code_id ON public.upsells USING btree (offer_code_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsells_on_offer_code_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsells_on_offer_code_id: %', SQLERRM;
END $$;

-- Индекс 417/466: index_upsells_on_offered_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsells_on_offered_product_id') THEN
        EXECUTE 'CREATE INDEX index_upsells_on_offered_product_id ON public.upsells USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsells_on_offered_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsells_on_offered_product_id: %', SQLERRM;
END $$;

-- Индекс 418/466: index_upsells_on_offered_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsells_on_offered_variant_id') THEN
        EXECUTE 'CREATE INDEX index_upsells_on_offered_variant_id ON public.upsells USING btree (variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsells_on_offered_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsells_on_offered_variant_id: %', SQLERRM;
END $$;

-- Индекс 419/466: index_upsells_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsells_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_upsells_on_seller_id ON public.upsells USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsells_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsells_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 420/466: index_upsells_selected_products_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsells_selected_products_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_upsells_selected_products_on_product_id ON public.upsells_selected_products USING btree (selected_product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsells_selected_products_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsells_selected_products_on_product_id: %', SQLERRM;
END $$;

-- Индекс 421/466: index_upsells_selected_products_on_upsell_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_upsells_selected_products_on_upsell_id') THEN
        EXECUTE 'CREATE INDEX index_upsells_selected_products_on_upsell_id ON public.upsells_selected_products USING btree (upsell_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_upsells_selected_products_on_upsell_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_upsells_selected_products_on_upsell_id: %', SQLERRM;
END $$;

-- Индекс 422/466: index_url_redirects_on_imported_customer_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_url_redirects_on_imported_customer_id') THEN
        EXECUTE 'CREATE INDEX index_url_redirects_on_imported_customer_id ON public.url_redirects USING btree (imported_customer_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_url_redirects_on_imported_customer_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_url_redirects_on_imported_customer_id: %', SQLERRM;
END $$;

-- Индекс 423/466: index_url_redirects_on_installment_id_and_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_url_redirects_on_installment_id_and_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_url_redirects_on_installment_id_and_purchase_id ON public.url_redirects USING btree (installment_id, purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_url_redirects_on_installment_id_and_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_url_redirects_on_installment_id_and_purchase_id: %', SQLERRM;
END $$;

-- Индекс 424/466: index_url_redirects_on_installment_id_and_subscription_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_url_redirects_on_installment_id_and_subscription_id') THEN
        EXECUTE 'CREATE INDEX index_url_redirects_on_installment_id_and_subscription_id ON public.url_redirects USING btree (installment_id, subscription_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_url_redirects_on_installment_id_and_subscription_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_url_redirects_on_installment_id_and_subscription_id: %', SQLERRM;
END $$;

-- Индекс 425/466: index_url_redirects_on_preorder_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_url_redirects_on_preorder_id') THEN
        EXECUTE 'CREATE INDEX index_url_redirects_on_preorder_id ON public.url_redirects USING btree (preorder_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_url_redirects_on_preorder_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_url_redirects_on_preorder_id: %', SQLERRM;
END $$;

-- Индекс 426/466: index_url_redirects_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_url_redirects_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_url_redirects_on_purchase_id ON public.url_redirects USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_url_redirects_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_url_redirects_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 427/466: index_url_redirects_on_subscription_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_url_redirects_on_subscription_id') THEN
        EXECUTE 'CREATE INDEX index_url_redirects_on_subscription_id ON public.url_redirects USING btree (subscription_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_url_redirects_on_subscription_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_url_redirects_on_subscription_id: %', SQLERRM;
END $$;

-- Индекс 428/466: index_url_redirects_on_token
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_url_redirects_on_token') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_url_redirects_on_token ON public.url_redirects USING btree (token);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_url_redirects_on_token не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_url_redirects_on_token: %', SQLERRM;
END $$;

-- Индекс 429/466: index_user_compliance_info_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_user_compliance_info_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_user_compliance_info_on_user_id ON public.user_compliance_info USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_user_compliance_info_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_user_compliance_info_on_user_id: %', SQLERRM;
END $$;

-- Индекс 430/466: index_user_compliance_info_requests_on_user_id_and_state
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_user_compliance_info_requests_on_user_id_and_state') THEN
        EXECUTE 'CREATE INDEX index_user_compliance_info_requests_on_user_id_and_state ON public.user_compliance_info_requests USING btree (user_id, state);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_user_compliance_info_requests_on_user_id_and_state не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_user_compliance_info_requests_on_user_id_and_state: %', SQLERRM;
END $$;

-- Индекс 431/466: index_users_on_email
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_users_on_email') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_users_on_email не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_users_on_email: %', SQLERRM;
END $$;

-- Индекс 432/466: index_users_on_google_uid
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_users_on_google_uid') THEN
        EXECUTE 'CREATE INDEX index_users_on_google_uid ON public.users USING btree (google_uid);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_users_on_google_uid не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_users_on_google_uid: %', SQLERRM;
END $$;

-- Индекс 433/466: index_users_on_reset_password_token
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_users_on_reset_password_token') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_users_on_reset_password_token не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_users_on_reset_password_token: %', SQLERRM;
END $$;

-- Индекс 434/466: index_utm_link_driven_sales_on_purchase_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_link_driven_sales_on_purchase_id') THEN
        EXECUTE 'CREATE INDEX index_utm_link_driven_sales_on_purchase_id ON public.utm_link_driven_sales USING btree (purchase_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_link_driven_sales_on_purchase_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_link_driven_sales_on_purchase_id: %', SQLERRM;
END $$;

-- Индекс 435/466: index_utm_link_driven_sales_on_utm_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_link_driven_sales_on_utm_link_id') THEN
        EXECUTE 'CREATE INDEX index_utm_link_driven_sales_on_utm_link_id ON public.utm_link_driven_sales USING btree (utm_link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_link_driven_sales_on_utm_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_link_driven_sales_on_utm_link_id: %', SQLERRM;
END $$;

-- Индекс 436/466: index_utm_link_driven_sales_on_utm_link_visit_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_link_driven_sales_on_utm_link_visit_id') THEN
        EXECUTE 'CREATE INDEX index_utm_link_driven_sales_on_utm_link_visit_id ON public.utm_link_driven_sales USING btree (utm_link_visit_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_link_driven_sales_on_utm_link_visit_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_link_driven_sales_on_utm_link_visit_id: %', SQLERRM;
END $$;

-- Индекс 437/466: index_utm_link_visits_on_browser_guid
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_link_visits_on_browser_guid') THEN
        EXECUTE 'CREATE INDEX index_utm_link_visits_on_browser_guid ON public.utm_link_visits USING btree (browser_guid);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_link_visits_on_browser_guid не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_link_visits_on_browser_guid: %', SQLERRM;
END $$;

-- Индекс 438/466: index_utm_link_visits_on_created_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_link_visits_on_created_at') THEN
        EXECUTE 'CREATE INDEX index_utm_link_visits_on_created_at ON public.utm_link_visits USING btree (created_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_link_visits_on_created_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_link_visits_on_created_at: %', SQLERRM;
END $$;

-- Индекс 439/466: index_utm_link_visits_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_link_visits_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_utm_link_visits_on_user_id ON public.utm_link_visits USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_link_visits_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_link_visits_on_user_id: %', SQLERRM;
END $$;

-- Индекс 440/466: index_utm_link_visits_on_utm_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_link_visits_on_utm_link_id') THEN
        EXECUTE 'CREATE INDEX index_utm_link_visits_on_utm_link_id ON public.utm_link_visits USING btree (utm_link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_link_visits_on_utm_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_link_visits_on_utm_link_id: %', SQLERRM;
END $$;

-- Индекс 441/466: index_utm_links_on_deleted_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_links_on_deleted_at') THEN
        EXECUTE 'CREATE INDEX index_utm_links_on_deleted_at ON public.utm_links USING btree (deleted_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_links_on_deleted_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_links_on_deleted_at: %', SQLERRM;
END $$;

-- Индекс 442/466: index_utm_links_on_permalink
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_links_on_permalink') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_utm_links_on_permalink ON public.utm_links USING btree (permalink);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_links_on_permalink не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_links_on_permalink: %', SQLERRM;
END $$;

-- Индекс 443/466: index_utm_links_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_links_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_utm_links_on_seller_id ON public.utm_links USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_links_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_links_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 444/466: index_utm_links_on_utm_campaign
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_links_on_utm_campaign') THEN
        EXECUTE 'CREATE INDEX index_utm_links_on_utm_campaign ON public.utm_links USING btree (utm_campaign);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_links_on_utm_campaign не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_links_on_utm_campaign: %', SQLERRM;
END $$;

-- Индекс 445/466: index_utm_links_on_utm_fields_and_target_resource
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_utm_links_on_utm_fields_and_target_resource') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_utm_links_on_utm_fields_and_target_resource ON public.utm_links USING btree (seller_id, utm_source, utm_medium, utm_campaign, utm_term, utm_content, target_resource_type, target_resource_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_utm_links_on_utm_fields_and_target_resource не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_utm_links_on_utm_fields_and_target_resource: %', SQLERRM;
END $$;

-- Индекс 446/466: index_variant_categories_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_variant_categories_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_variant_categories_on_link_id ON public.variant_categories USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_variant_categories_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_variant_categories_on_link_id: %', SQLERRM;
END $$;

-- Индекс 447/466: index_variants_on_variant_category_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_variants_on_variant_category_id') THEN
        EXECUTE 'CREATE INDEX index_variants_on_variant_category_id ON public.base_variants USING btree (variant_category_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_variants_on_variant_category_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_variants_on_variant_category_id: %', SQLERRM;
END $$;

-- Индекс 448/466: index_versions_on_item_type_and_item_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_versions_on_item_type_and_item_id') THEN
        EXECUTE 'CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_versions_on_item_type_and_item_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_versions_on_item_type_and_item_id: %', SQLERRM;
END $$;

-- Индекс 449/466: index_video_files_on_record
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_video_files_on_record') THEN
        EXECUTE 'CREATE INDEX index_video_files_on_record ON public.video_files USING btree (record_type, record_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_video_files_on_record не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_video_files_on_record: %', SQLERRM;
END $$;

-- Индекс 450/466: index_video_files_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_video_files_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_video_files_on_user_id ON public.video_files USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_video_files_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_video_files_on_user_id: %', SQLERRM;
END $$;

-- Индекс 451/466: index_wishlist_followers_on_follower_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_wishlist_followers_on_follower_user_id') THEN
        EXECUTE 'CREATE INDEX index_wishlist_followers_on_follower_user_id ON public.wishlist_followers USING btree (follower_user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_wishlist_followers_on_follower_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_wishlist_followers_on_follower_user_id: %', SQLERRM;
END $$;

-- Индекс 452/466: index_wishlist_followers_on_wishlist_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_wishlist_followers_on_wishlist_id') THEN
        EXECUTE 'CREATE INDEX index_wishlist_followers_on_wishlist_id ON public.wishlist_followers USING btree (wishlist_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_wishlist_followers_on_wishlist_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_wishlist_followers_on_wishlist_id: %', SQLERRM;
END $$;

-- Индекс 453/466: index_wishlist_products_on_product_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_wishlist_products_on_product_id') THEN
        EXECUTE 'CREATE INDEX index_wishlist_products_on_product_id ON public.wishlist_products USING btree (product_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_wishlist_products_on_product_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_wishlist_products_on_product_id: %', SQLERRM;
END $$;

-- Индекс 454/466: index_wishlist_products_on_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_wishlist_products_on_variant_id') THEN
        EXECUTE 'CREATE INDEX index_wishlist_products_on_variant_id ON public.wishlist_products USING btree (variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_wishlist_products_on_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_wishlist_products_on_variant_id: %', SQLERRM;
END $$;

-- Индекс 455/466: index_wishlist_products_on_wishlist_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_wishlist_products_on_wishlist_id') THEN
        EXECUTE 'CREATE INDEX index_wishlist_products_on_wishlist_id ON public.wishlist_products USING btree (wishlist_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_wishlist_products_on_wishlist_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_wishlist_products_on_wishlist_id: %', SQLERRM;
END $$;

-- Индекс 456/466: index_wishlists_on_recommendable_and_recent_follower_count
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_wishlists_on_recommendable_and_recent_follower_count') THEN
        EXECUTE 'CREATE INDEX index_wishlists_on_recommendable_and_recent_follower_count ON public.wishlists USING btree (recommendable, recent_follower_count);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_wishlists_on_recommendable_and_recent_follower_count не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_wishlists_on_recommendable_and_recent_follower_count: %', SQLERRM;
END $$;

-- Индекс 457/466: index_wishlists_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_wishlists_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_wishlists_on_user_id ON public.wishlists USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_wishlists_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_wishlists_on_user_id: %', SQLERRM;
END $$;

-- Индекс 458/466: index_workflows_on_base_variant_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_workflows_on_base_variant_id') THEN
        EXECUTE 'CREATE INDEX index_workflows_on_base_variant_id ON public.workflows USING btree (base_variant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_workflows_on_base_variant_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_workflows_on_base_variant_id: %', SQLERRM;
END $$;

-- Индекс 459/466: index_workflows_on_link_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_workflows_on_link_id') THEN
        EXECUTE 'CREATE INDEX index_workflows_on_link_id ON public.workflows USING btree (link_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_workflows_on_link_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_workflows_on_link_id: %', SQLERRM;
END $$;

-- Индекс 460/466: index_workflows_on_seller_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_workflows_on_seller_id') THEN
        EXECUTE 'CREATE INDEX index_workflows_on_seller_id ON public.workflows USING btree (seller_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_workflows_on_seller_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_workflows_on_seller_id: %', SQLERRM;
END $$;

-- Индекс 461/466: index_workflows_on_workflow_type_and_published_at
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_workflows_on_workflow_type_and_published_at') THEN
        EXECUTE 'CREATE INDEX index_workflows_on_workflow_type_and_published_at ON public.workflows USING btree (workflow_type, published_at);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_workflows_on_workflow_type_and_published_at не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_workflows_on_workflow_type_and_published_at: %', SQLERRM;
END $$;

-- Индекс 462/466: index_yearly_stats_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_yearly_stats_on_user_id') THEN
        EXECUTE 'CREATE UNIQUE INDEX index_yearly_stats_on_user_id ON public.yearly_stats USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_yearly_stats_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_yearly_stats_on_user_id: %', SQLERRM;
END $$;

-- Индекс 463/466: index_zip_tax_rates_on_user_id
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_zip_tax_rates_on_user_id') THEN
        EXECUTE 'CREATE INDEX index_zip_tax_rates_on_user_id ON public.zip_tax_rates USING btree (user_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_zip_tax_rates_on_user_id не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_zip_tax_rates_on_user_id: %', SQLERRM;
END $$;

-- Индекс 464/466: index_zip_tax_rates_on_zip_code
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'index_zip_tax_rates_on_zip_code') THEN
        EXECUTE 'CREATE INDEX index_zip_tax_rates_on_zip_code ON public.zip_tax_rates USING btree (zip_code);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса index_zip_tax_rates_on_zip_code не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса index_zip_tax_rates_on_zip_code: %', SQLERRM;
END $$;

-- Индекс 465/466: taxonomy_anc_desc_idx
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'taxonomy_anc_desc_idx') THEN
        EXECUTE 'CREATE UNIQUE INDEX taxonomy_anc_desc_idx ON public.taxonomy_hierarchies USING btree (ancestor_id, descendant_id, generations);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса taxonomy_anc_desc_idx не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса taxonomy_anc_desc_idx: %', SQLERRM;
END $$;

-- Индекс 466/466: taxonomy_desc_idx
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'taxonomy_desc_idx') THEN
        EXECUTE 'CREATE INDEX taxonomy_desc_idx ON public.taxonomy_hierarchies USING btree (descendant_id);';
    END IF;
EXCEPTION
    WHEN duplicate_table THEN NULL; -- Индекс уже существует
    WHEN undefined_column THEN
        RAISE NOTICE 'Колонка для индекса taxonomy_desc_idx не существует';
    WHEN others THEN
        RAISE NOTICE 'Ошибка создания индекса taxonomy_desc_idx: %', SQLERRM;
END $$;

-- ==================================
-- ЭТАП 5: ДОБАВЛЕНИЕ ВНЕШНИХ КЛЮЧЕЙ
-- ==================================
-- ==================================
-- ПРОВЕРКА РЕЗУЛЬТАТОВ
-- ==================================
SELECT 'Таблиц создано:' as type, count(*) as count FROM information_schema.tables WHERE table_schema = 'public';
SELECT 'Индексов создано:' as type, count(*) as count FROM pg_indexes WHERE schemaname = 'public';
SELECT 'Sequences создано:' as type, count(*) as count FROM pg_sequences WHERE schemaname = 'public';

-- ИСПРАВЛЕННАЯ МИГРАЦИЯ ЗАВЕРШЕНА
