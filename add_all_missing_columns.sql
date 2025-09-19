-- ДОБАВЛЕНИЕ ВСЕХ НЕДОСТАЮЩИХ КОЛОНОК ВО ВСЕ ТАБЛИЦЫ
-- Создан: 2025-08-28 13:54:48 +0300

SET client_min_messages TO WARNING;

-- ========================================
-- ТАБЛИЦА: AFFILIATES (модель: Affiliate)
-- ========================================

-- Колонка: seller_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'seller_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN seller_id BIGINT;
        RAISE NOTICE 'Добавлена колонка affiliates.seller_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.seller_id: %', SQLERRM;
END $$;

-- Колонка: affiliate_user_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'affiliate_user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN affiliate_user_id BIGINT;
        RAISE NOTICE 'Добавлена колонка affiliates.affiliate_user_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.affiliate_user_id: %', SQLERRM;
END $$;

-- Колонка: affiliate_basis_points (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'affiliate_basis_points' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN affiliate_basis_points INTEGER;
        RAISE NOTICE 'Добавлена колонка affiliates.affiliate_basis_points (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.affiliate_basis_points: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.updated_at: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.deleted_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.deleted_at: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN flags BIGINT DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка affiliates.flags (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.flags: %', SQLERRM;
END $$;

-- Колонка: destination_url (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'destination_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN destination_url VARCHAR(2083);
        RAISE NOTICE 'Добавлена колонка affiliates.destination_url (VARCHAR(2083))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.destination_url: %', SQLERRM;
END $$;

-- Колонка: type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN type VARCHAR(255) NOT NULL;
        RAISE NOTICE 'Добавлена колонка affiliates.type (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.type: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: PRICES (модель: BasePrice)
-- ========================================

-- Колонка: link_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'link_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN link_id BIGINT;
        RAISE NOTICE 'Добавлена колонка prices.link_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.link_id: %', SQLERRM;
END $$;

-- Колонка: price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN price_cents INTEGER DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка prices.price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.price_cents: %', SQLERRM;
END $$;

-- Колонка: currency (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'currency' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN currency VARCHAR(255) DEFAULT 'usd';
        RAISE NOTICE 'Добавлена колонка prices.currency (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.currency: %', SQLERRM;
END $$;

-- Колонка: recurrence (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'recurrence' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN recurrence VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка prices.recurrence (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.recurrence: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.updated_at: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.deleted_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.deleted_at: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN flags BIGINT DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка prices.flags (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.flags: %', SQLERRM;
END $$;

-- Колонка: variant_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'variant_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN variant_id BIGINT;
        RAISE NOTICE 'Добавлена колонка prices.variant_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.variant_id: %', SQLERRM;
END $$;

-- Колонка: suggested_price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'suggested_price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN suggested_price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка prices.suggested_price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.suggested_price_cents: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: EVENTS (модель: Event)
-- ========================================

-- Колонка: visit_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'visit_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN visit_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.visit_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.visit_id: %', SQLERRM;
END $$;

-- Колонка: ip_address (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_address' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_address VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.ip_address (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.ip_address: %', SQLERRM;
END $$;

-- Колонка: event_name (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'event_name' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN event_name VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.event_name (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.event_name: %', SQLERRM;
END $$;

-- Колонка: user_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN user_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.user_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.user_id: %', SQLERRM;
END $$;

-- Колонка: link_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'link_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN link_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.link_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.link_id: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка events.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка events.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.updated_at: %', SQLERRM;
END $$;

-- Колонка: referrer (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'referrer' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN referrer VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.referrer (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.referrer: %', SQLERRM;
END $$;

-- Колонка: parent_referrer (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'parent_referrer' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN parent_referrer VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.parent_referrer (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.parent_referrer: %', SQLERRM;
END $$;

-- Колонка: language (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'language' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN language VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.language (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.language: %', SQLERRM;
END $$;

-- Колонка: browser (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'browser' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN browser VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.browser (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.browser: %', SQLERRM;
END $$;

-- Колонка: is_mobile (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'is_mobile' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN is_mobile BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка events.is_mobile (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.is_mobile: %', SQLERRM;
END $$;

-- Колонка: email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN email VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.email (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.email: %', SQLERRM;
END $$;

-- Колонка: purchase_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'purchase_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN purchase_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.purchase_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.purchase_id: %', SQLERRM;
END $$;

-- Колонка: price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка events.price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.price_cents: %', SQLERRM;
END $$;

-- Колонка: credit_card_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'credit_card_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN credit_card_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.credit_card_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.credit_card_id: %', SQLERRM;
END $$;

-- Колонка: card_type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'card_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN card_type VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.card_type (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.card_type: %', SQLERRM;
END $$;

-- Колонка: card_visual (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'card_visual' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN card_visual VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.card_visual (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.card_visual: %', SQLERRM;
END $$;

-- Колонка: purchase_state (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'purchase_state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN purchase_state VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.purchase_state (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.purchase_state: %', SQLERRM;
END $$;

-- Колонка: billing_zip (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'billing_zip' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN billing_zip VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.billing_zip (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.billing_zip: %', SQLERRM;
END $$;

-- Колонка: chargeback (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'chargeback' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN chargeback BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка events.chargeback (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.chargeback: %', SQLERRM;
END $$;

-- Колонка: refunded (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'refunded' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN refunded BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка events.refunded (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.refunded: %', SQLERRM;
END $$;

-- Колонка: view_url (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'view_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN view_url VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.view_url (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.view_url: %', SQLERRM;
END $$;

-- Колонка: fingerprint (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'fingerprint' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN fingerprint VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.fingerprint (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.fingerprint: %', SQLERRM;
END $$;

-- Колонка: ip_country (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_country' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_country VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.ip_country (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.ip_country: %', SQLERRM;
END $$;

-- Колонка: ip_longitude (float)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_longitude' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_longitude DOUBLE PRECISION;
        RAISE NOTICE 'Добавлена колонка events.ip_longitude (DOUBLE PRECISION)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.ip_longitude: %', SQLERRM;
END $$;

-- Колонка: ip_latitude (float)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_latitude' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_latitude DOUBLE PRECISION;
        RAISE NOTICE 'Добавлена колонка events.ip_latitude (DOUBLE PRECISION)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.ip_latitude: %', SQLERRM;
END $$;

-- Колонка: is_modal (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'is_modal' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN is_modal BOOLEAN;
        RAISE NOTICE 'Добавлена колонка events.is_modal (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.is_modal: %', SQLERRM;
END $$;

-- Колонка: friend_actions (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'friend_actions' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN friend_actions TEXT;
        RAISE NOTICE 'Добавлена колонка events.friend_actions (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.friend_actions: %', SQLERRM;
END $$;

-- Колонка: browser_fingerprint (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'browser_fingerprint' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN browser_fingerprint VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.browser_fingerprint (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.browser_fingerprint: %', SQLERRM;
END $$;

-- Колонка: browser_plugins (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'browser_plugins' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN browser_plugins VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.browser_plugins (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.browser_plugins: %', SQLERRM;
END $$;

-- Колонка: browser_guid (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'browser_guid' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN browser_guid VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.browser_guid (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.browser_guid: %', SQLERRM;
END $$;

-- Колонка: referrer_domain (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'referrer_domain' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN referrer_domain VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.referrer_domain (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.referrer_domain: %', SQLERRM;
END $$;

-- Колонка: ip_state (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_state VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.ip_state (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.ip_state: %', SQLERRM;
END $$;

-- Колонка: active_test_path_assignments (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'active_test_path_assignments' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN active_test_path_assignments VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.active_test_path_assignments (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.active_test_path_assignments: %', SQLERRM;
END $$;

-- Колонка: service_charge_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'service_charge_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN service_charge_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.service_charge_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления events.service_charge_id: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: AFFILIATES (модель: GlobalAffiliate)
-- ========================================

-- Колонка: seller_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'seller_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN seller_id BIGINT;
        RAISE NOTICE 'Добавлена колонка affiliates.seller_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.seller_id: %', SQLERRM;
END $$;

-- Колонка: affiliate_user_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'affiliate_user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN affiliate_user_id BIGINT;
        RAISE NOTICE 'Добавлена колонка affiliates.affiliate_user_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.affiliate_user_id: %', SQLERRM;
END $$;

-- Колонка: affiliate_basis_points (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'affiliate_basis_points' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN affiliate_basis_points INTEGER;
        RAISE NOTICE 'Добавлена колонка affiliates.affiliate_basis_points (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.affiliate_basis_points: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.updated_at: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.deleted_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.deleted_at: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN flags BIGINT DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка affiliates.flags (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.flags: %', SQLERRM;
END $$;

-- Колонка: destination_url (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'destination_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN destination_url VARCHAR(2083);
        RAISE NOTICE 'Добавлена колонка affiliates.destination_url (VARCHAR(2083))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.destination_url: %', SQLERRM;
END $$;

-- Колонка: type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN type VARCHAR(255) NOT NULL;
        RAISE NOTICE 'Добавлена колонка affiliates.type (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления affiliates.type: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: LINKS (модель: Link)
-- ========================================

-- Колонка: user_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN user_id BIGINT;
        RAISE NOTICE 'Добавлена колонка links.user_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.user_id: %', SQLERRM;
END $$;

-- Колонка: name (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'name' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN name VARCHAR(255) NOT NULL;
        RAISE NOTICE 'Добавлена колонка links.name (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.name: %', SQLERRM;
END $$;

-- Колонка: unique_permalink (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'unique_permalink' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN unique_permalink VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.unique_permalink (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.unique_permalink: %', SQLERRM;
END $$;

-- Колонка: preview_url (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'preview_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN preview_url TEXT;
        RAISE NOTICE 'Добавлена колонка links.preview_url (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.preview_url: %', SQLERRM;
END $$;

-- Колонка: description (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'description' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN description TEXT;
        RAISE NOTICE 'Добавлена колонка links.description (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.description: %', SQLERRM;
END $$;

-- Колонка: purchase_type (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'purchase_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN purchase_type INTEGER DEFAULT 0;
        RAISE NOTICE 'Добавлена колонка links.purchase_type (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.purchase_type: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.updated_at: %', SQLERRM;
END $$;

-- Колонка: purchase_disabled_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'purchase_disabled_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN purchase_disabled_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.purchase_disabled_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.purchase_disabled_at: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.deleted_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.deleted_at: %', SQLERRM;
END $$;

-- Колонка: price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка links.price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.price_cents: %', SQLERRM;
END $$;

-- Колонка: price_currency_type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'price_currency_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN price_currency_type VARCHAR(255) DEFAULT 'usd';
        RAISE NOTICE 'Добавлена колонка links.price_currency_type (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.price_currency_type: %', SQLERRM;
END $$;

-- Колонка: customizable_price (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'customizable_price' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN customizable_price BOOLEAN;
        RAISE NOTICE 'Добавлена колонка links.customizable_price (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.customizable_price: %', SQLERRM;
END $$;

-- Колонка: max_purchase_count (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'max_purchase_count' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN max_purchase_count INTEGER;
        RAISE NOTICE 'Добавлена колонка links.max_purchase_count (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.max_purchase_count: %', SQLERRM;
END $$;

-- Колонка: bad_card_counter (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'bad_card_counter' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN bad_card_counter INTEGER DEFAULT 0;
        RAISE NOTICE 'Добавлена колонка links.bad_card_counter (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.bad_card_counter: %', SQLERRM;
END $$;

-- Колонка: require_shipping (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'require_shipping' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN require_shipping BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка links.require_shipping (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.require_shipping: %', SQLERRM;
END $$;

-- Колонка: last_partner_sync (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'last_partner_sync' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN last_partner_sync TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.last_partner_sync (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.last_partner_sync: %', SQLERRM;
END $$;

-- Колонка: preview_oembed (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'preview_oembed' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN preview_oembed TEXT;
        RAISE NOTICE 'Добавлена колонка links.preview_oembed (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.preview_oembed: %', SQLERRM;
END $$;

-- Колонка: showcaseable (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'showcaseable' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN showcaseable BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка links.showcaseable (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.showcaseable: %', SQLERRM;
END $$;

-- Колонка: custom_receipt (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'custom_receipt' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN custom_receipt TEXT;
        RAISE NOTICE 'Добавлена колонка links.custom_receipt (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.custom_receipt: %', SQLERRM;
END $$;

-- Колонка: custom_filetype (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'custom_filetype' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN custom_filetype VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.custom_filetype (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.custom_filetype: %', SQLERRM;
END $$;

-- Колонка: filetype (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'filetype' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN filetype VARCHAR(255) DEFAULT 'link';
        RAISE NOTICE 'Добавлена колонка links.filetype (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.filetype: %', SQLERRM;
END $$;

-- Колонка: filegroup (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'filegroup' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN filegroup VARCHAR(255) DEFAULT 'url';
        RAISE NOTICE 'Добавлена колонка links.filegroup (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.filegroup: %', SQLERRM;
END $$;

-- Колонка: size (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'size' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN size INTEGER;
        RAISE NOTICE 'Добавлена колонка links.size (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.size: %', SQLERRM;
END $$;

-- Колонка: bitrate (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'bitrate' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN bitrate INTEGER;
        RAISE NOTICE 'Добавлена колонка links.bitrate (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.bitrate: %', SQLERRM;
END $$;

-- Колонка: framerate (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'framerate' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN framerate INTEGER;
        RAISE NOTICE 'Добавлена колонка links.framerate (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.framerate: %', SQLERRM;
END $$;

-- Колонка: pagelength (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'pagelength' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN pagelength INTEGER;
        RAISE NOTICE 'Добавлена колонка links.pagelength (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.pagelength: %', SQLERRM;
END $$;

-- Колонка: duration (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'duration' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN duration INTEGER;
        RAISE NOTICE 'Добавлена колонка links.duration (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.duration: %', SQLERRM;
END $$;

-- Колонка: width (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'width' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN width INTEGER;
        RAISE NOTICE 'Добавлена колонка links.width (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.width: %', SQLERRM;
END $$;

-- Колонка: height (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'height' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN height INTEGER;
        RAISE NOTICE 'Добавлена колонка links.height (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.height: %', SQLERRM;
END $$;

-- Колонка: custom_permalink (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'custom_permalink' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN custom_permalink VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.custom_permalink (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.custom_permalink: %', SQLERRM;
END $$;

-- Колонка: common_color (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'common_color' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN common_color VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.common_color (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.common_color: %', SQLERRM;
END $$;

-- Колонка: suggested_price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'suggested_price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN suggested_price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка links.suggested_price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.suggested_price_cents: %', SQLERRM;
END $$;

-- Колонка: banned_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'banned_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN banned_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.banned_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.banned_at: %', SQLERRM;
END $$;

-- Колонка: risk_score (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'risk_score' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN risk_score INTEGER;
        RAISE NOTICE 'Добавлена колонка links.risk_score (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.risk_score: %', SQLERRM;
END $$;

-- Колонка: risk_score_updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'risk_score_updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN risk_score_updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.risk_score_updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.risk_score_updated_at: %', SQLERRM;
END $$;

-- Колонка: draft (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'draft' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN draft BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка links.draft (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.draft: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN flags BIGINT DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка links.flags (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.flags: %', SQLERRM;
END $$;

-- Колонка: subscription_duration (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'subscription_duration' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN subscription_duration INTEGER;
        RAISE NOTICE 'Добавлена колонка links.subscription_duration (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.subscription_duration: %', SQLERRM;
END $$;

-- Колонка: json_data (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'json_data' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN json_data TEXT;
        RAISE NOTICE 'Добавлена колонка links.json_data (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.json_data: %', SQLERRM;
END $$;

-- Колонка: external_mapping_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'external_mapping_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN external_mapping_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.external_mapping_id (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.external_mapping_id: %', SQLERRM;
END $$;

-- Колонка: affiliate_application_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'affiliate_application_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN affiliate_application_id BIGINT;
        RAISE NOTICE 'Добавлена колонка links.affiliate_application_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.affiliate_application_id: %', SQLERRM;
END $$;

-- Колонка: rental_price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'rental_price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN rental_price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка links.rental_price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.rental_price_cents: %', SQLERRM;
END $$;

-- Колонка: duration_in_months (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'duration_in_months' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN duration_in_months INTEGER;
        RAISE NOTICE 'Добавлена колонка links.duration_in_months (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.duration_in_months: %', SQLERRM;
END $$;

-- Колонка: migrated_to_tiered_pricing_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'migrated_to_tiered_pricing_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN migrated_to_tiered_pricing_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.migrated_to_tiered_pricing_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.migrated_to_tiered_pricing_at: %', SQLERRM;
END $$;

-- Колонка: free_trial_duration_unit (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'free_trial_duration_unit' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN free_trial_duration_unit INTEGER;
        RAISE NOTICE 'Добавлена колонка links.free_trial_duration_unit (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.free_trial_duration_unit: %', SQLERRM;
END $$;

-- Колонка: free_trial_duration_amount (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'free_trial_duration_amount' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN free_trial_duration_amount INTEGER;
        RAISE NOTICE 'Добавлена колонка links.free_trial_duration_amount (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.free_trial_duration_amount: %', SQLERRM;
END $$;

-- Колонка: content_updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'content_updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN content_updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.content_updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.content_updated_at: %', SQLERRM;
END $$;

-- Колонка: taxonomy_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'taxonomy_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN taxonomy_id BIGINT;
        RAISE NOTICE 'Добавлена колонка links.taxonomy_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.taxonomy_id: %', SQLERRM;
END $$;

-- Колонка: native_type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'native_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN native_type VARCHAR(255) DEFAULT 'digital' NOT NULL;
        RAISE NOTICE 'Добавлена колонка links.native_type (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.native_type: %', SQLERRM;
END $$;

-- Колонка: discover_fee_per_thousand (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'discover_fee_per_thousand' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN discover_fee_per_thousand INTEGER DEFAULT 100 NOT NULL;
        RAISE NOTICE 'Добавлена колонка links.discover_fee_per_thousand (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления links.discover_fee_per_thousand: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: PRICES (модель: Price)
-- ========================================

-- Колонка: link_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'link_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN link_id BIGINT;
        RAISE NOTICE 'Добавлена колонка prices.link_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.link_id: %', SQLERRM;
END $$;

-- Колонка: price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN price_cents INTEGER DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка prices.price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.price_cents: %', SQLERRM;
END $$;

-- Колонка: currency (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'currency' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN currency VARCHAR(255) DEFAULT 'usd';
        RAISE NOTICE 'Добавлена колонка prices.currency (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.currency: %', SQLERRM;
END $$;

-- Колонка: recurrence (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'recurrence' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN recurrence VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка prices.recurrence (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.recurrence: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.updated_at: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.deleted_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.deleted_at: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN flags BIGINT DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка prices.flags (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.flags: %', SQLERRM;
END $$;

-- Колонка: variant_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'variant_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN variant_id BIGINT;
        RAISE NOTICE 'Добавлена колонка prices.variant_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.variant_id: %', SQLERRM;
END $$;

-- Колонка: suggested_price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'suggested_price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN suggested_price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка prices.suggested_price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.suggested_price_cents: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: REFUND_POLICIES (модель: ProductRefundPolicy)
-- ========================================

-- Колонка: seller_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'seller_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN seller_id BIGINT NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.seller_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.seller_id: %', SQLERRM;
END $$;

-- Колонка: product_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'product_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN product_id BIGINT;
        RAISE NOTICE 'Добавлена колонка refund_policies.product_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.product_id: %', SQLERRM;
END $$;

-- Колонка: title (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'title' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN title VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка refund_policies.title (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.title: %', SQLERRM;
END $$;

-- Колонка: fine_print (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'fine_print' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN fine_print TEXT;
        RAISE NOTICE 'Добавлена колонка refund_policies.fine_print (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.fine_print: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN created_at TIMESTAMP NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN updated_at TIMESTAMP NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.updated_at: %', SQLERRM;
END $$;

-- Колонка: max_refund_period_in_days (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'max_refund_period_in_days' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN max_refund_period_in_days INTEGER;
        RAISE NOTICE 'Добавлена колонка refund_policies.max_refund_period_in_days (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.max_refund_period_in_days: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: REFUND_POLICIES (модель: RefundPolicy)
-- ========================================

-- Колонка: seller_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'seller_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN seller_id BIGINT NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.seller_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.seller_id: %', SQLERRM;
END $$;

-- Колонка: product_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'product_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN product_id BIGINT;
        RAISE NOTICE 'Добавлена колонка refund_policies.product_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.product_id: %', SQLERRM;
END $$;

-- Колонка: title (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'title' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN title VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка refund_policies.title (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.title: %', SQLERRM;
END $$;

-- Колонка: fine_print (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'fine_print' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN fine_print TEXT;
        RAISE NOTICE 'Добавлена колонка refund_policies.fine_print (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.fine_print: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN created_at TIMESTAMP NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN updated_at TIMESTAMP NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.updated_at: %', SQLERRM;
END $$;

-- Колонка: max_refund_period_in_days (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'max_refund_period_in_days' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN max_refund_period_in_days INTEGER;
        RAISE NOTICE 'Добавлена колонка refund_policies.max_refund_period_in_days (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.max_refund_period_in_days: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: REFUND_POLICIES (модель: SellerRefundPolicy)
-- ========================================

-- Колонка: seller_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'seller_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN seller_id BIGINT NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.seller_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.seller_id: %', SQLERRM;
END $$;

-- Колонка: product_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'product_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN product_id BIGINT;
        RAISE NOTICE 'Добавлена колонка refund_policies.product_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.product_id: %', SQLERRM;
END $$;

-- Колонка: title (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'title' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN title VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка refund_policies.title (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.title: %', SQLERRM;
END $$;

-- Колонка: fine_print (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'fine_print' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN fine_print TEXT;
        RAISE NOTICE 'Добавлена колонка refund_policies.fine_print (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.fine_print: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN created_at TIMESTAMP NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN updated_at TIMESTAMP NOT NULL;
        RAISE NOTICE 'Добавлена колонка refund_policies.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.updated_at: %', SQLERRM;
END $$;

-- Колонка: max_refund_period_in_days (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'refund_policies' AND column_name = 'max_refund_period_in_days' 
                   AND table_schema = 'public') THEN
        ALTER TABLE refund_policies ADD COLUMN max_refund_period_in_days INTEGER;
        RAISE NOTICE 'Добавлена колонка refund_policies.max_refund_period_in_days (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления refund_policies.max_refund_period_in_days: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: USERS (модель: User)
-- ========================================

-- Колонка: email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN email VARCHAR(255) DEFAULT '';
        RAISE NOTICE 'Добавлена колонка users.email (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.email: %', SQLERRM;
END $$;

-- Колонка: encrypted_password (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'encrypted_password' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN encrypted_password VARCHAR(255) DEFAULT '' NOT NULL;
        RAISE NOTICE 'Добавлена колонка users.encrypted_password (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.encrypted_password: %', SQLERRM;
END $$;

-- Колонка: reset_password_token (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'reset_password_token' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN reset_password_token VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.reset_password_token (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.reset_password_token: %', SQLERRM;
END $$;

-- Колонка: reset_password_sent_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'reset_password_sent_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN reset_password_sent_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.reset_password_sent_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.reset_password_sent_at: %', SQLERRM;
END $$;

-- Колонка: remember_created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'remember_created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN remember_created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.remember_created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.remember_created_at: %', SQLERRM;
END $$;

-- Колонка: sign_in_count (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'sign_in_count' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN sign_in_count INTEGER DEFAULT 0;
        RAISE NOTICE 'Добавлена колонка users.sign_in_count (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.sign_in_count: %', SQLERRM;
END $$;

-- Колонка: current_sign_in_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'current_sign_in_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN current_sign_in_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.current_sign_in_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.current_sign_in_at: %', SQLERRM;
END $$;

-- Колонка: last_sign_in_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'last_sign_in_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN last_sign_in_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.last_sign_in_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.last_sign_in_at: %', SQLERRM;
END $$;

-- Колонка: current_sign_in_ip (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'current_sign_in_ip' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN current_sign_in_ip VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.current_sign_in_ip (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.current_sign_in_ip: %', SQLERRM;
END $$;

-- Колонка: last_sign_in_ip (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'last_sign_in_ip' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN last_sign_in_ip VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.last_sign_in_ip (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.last_sign_in_ip: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.updated_at: %', SQLERRM;
END $$;

-- Колонка: google_uid (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'google_uid' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN google_uid VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.google_uid (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.google_uid: %', SQLERRM;
END $$;

-- Колонка: username (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'username' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN username VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.username (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.username: %', SQLERRM;
END $$;

-- Колонка: user_risk_state (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'user_risk_state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN user_risk_state VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.user_risk_state (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.user_risk_state: %', SQLERRM;
END $$;

-- Колонка: external_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'external_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN external_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.external_id (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.external_id: %', SQLERRM;
END $$;

-- Колонка: name (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'name' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN name VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.name (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.name: %', SQLERRM;
END $$;

-- Колонка: provider (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'provider' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN provider VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.provider (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.provider: %', SQLERRM;
END $$;

-- Колонка: confirmed_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'confirmed_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN confirmed_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.confirmed_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.confirmed_at: %', SQLERRM;
END $$;

-- Колонка: confirmation_token (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'confirmation_token' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN confirmation_token VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.confirmation_token (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.confirmation_token: %', SQLERRM;
END $$;

-- Колонка: confirmation_sent_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'confirmation_sent_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN confirmation_sent_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.confirmation_sent_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.confirmation_sent_at: %', SQLERRM;
END $$;

-- Колонка: unconfirmed_email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'unconfirmed_email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN unconfirmed_email VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.unconfirmed_email (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.unconfirmed_email: %', SQLERRM;
END $$;

-- Колонка: tier_state (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'tier_state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN tier_state INTEGER DEFAULT 0;
        RAISE NOTICE 'Добавлена колонка users.tier_state (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.tier_state: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN flags BIGINT DEFAULT 1 NOT NULL;
        RAISE NOTICE 'Добавлена колонка users.flags (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.flags: %', SQLERRM;
END $$;

-- Колонка: locale (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'locale' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN locale VARCHAR(255) DEFAULT 'en';
        RAISE NOTICE 'Добавлена колонка users.locale (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.locale: %', SQLERRM;
END $$;

-- Колонка: timezone (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'timezone' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN timezone VARCHAR(255) DEFAULT 'Pacific Time (US & Canada)' NOT NULL;
        RAISE NOTICE 'Добавлена колонка users.timezone (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.timezone: %', SQLERRM;
END $$;

-- Колонка: currency_type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'currency_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN currency_type VARCHAR(255) DEFAULT 'usd';
        RAISE NOTICE 'Добавлена колонка users.currency_type (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.currency_type: %', SQLERRM;
END $$;

-- Колонка: recommendation_type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'recommendation_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN recommendation_type VARCHAR(255) DEFAULT 'trending' NOT NULL;
        RAISE NOTICE 'Добавлена колонка users.recommendation_type (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.recommendation_type: %', SQLERRM;
END $$;

-- Колонка: facebook_meta_tag (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_meta_tag' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_meta_tag VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_meta_tag (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.facebook_meta_tag: %', SQLERRM;
END $$;

-- Колонка: google_analytics_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'google_analytics_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN google_analytics_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.google_analytics_id (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.google_analytics_id: %', SQLERRM;
END $$;

-- Колонка: support_email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'support_email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN support_email VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.support_email (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.support_email: %', SQLERRM;
END $$;

-- Колонка: bio (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'bio' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN bio TEXT;
        RAISE NOTICE 'Добавлена колонка users.bio (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.bio: %', SQLERRM;
END $$;

-- Колонка: profile_picture_url (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'profile_picture_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN profile_picture_url VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.profile_picture_url (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.profile_picture_url: %', SQLERRM;
END $$;

-- Колонка: country (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'country' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN country VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.country (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.country: %', SQLERRM;
END $$;

-- Колонка: verified (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'verified' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN verified BOOLEAN;
        RAISE NOTICE 'Добавлена колонка users.verified (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.verified: %', SQLERRM;
END $$;

-- Колонка: payment_notification (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'payment_notification' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN payment_notification BOOLEAN DEFAULT true;
        RAISE NOTICE 'Добавлена колонка users.payment_notification (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.payment_notification: %', SQLERRM;
END $$;

-- Колонка: facebook_uid (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_uid' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_uid VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_uid (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.facebook_uid: %', SQLERRM;
END $$;

-- Колонка: twitter_user_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'twitter_user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN twitter_user_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.twitter_user_id (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.twitter_user_id: %', SQLERRM;
END $$;

-- Колонка: twitter_handle (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'twitter_handle' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN twitter_handle VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.twitter_handle (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.twitter_handle: %', SQLERRM;
END $$;

-- Колонка: twitter_oauth_token (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'twitter_oauth_token' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN twitter_oauth_token VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.twitter_oauth_token (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.twitter_oauth_token: %', SQLERRM;
END $$;

-- Колонка: twitter_oauth_secret (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'twitter_oauth_secret' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN twitter_oauth_secret VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.twitter_oauth_secret (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.twitter_oauth_secret: %', SQLERRM;
END $$;

-- Колонка: facebook_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_id (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.facebook_id: %', SQLERRM;
END $$;

-- Колонка: purchasing_power_parity_limit (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'purchasing_power_parity_limit' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN purchasing_power_parity_limit INTEGER;
        RAISE NOTICE 'Добавлена колонка users.purchasing_power_parity_limit (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.purchasing_power_parity_limit: %', SQLERRM;
END $$;

-- Колонка: kindle_email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'kindle_email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN kindle_email VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.kindle_email (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.kindle_email: %', SQLERRM;
END $$;

-- Колонка: payment_address (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'payment_address' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN payment_address VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.payment_address (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.payment_address: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.deleted_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.deleted_at: %', SQLERRM;
END $$;

-- Колонка: account_created_ip (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'account_created_ip' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN account_created_ip VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.account_created_ip (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.account_created_ip: %', SQLERRM;
END $$;

-- Колонка: notification_endpoint (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'notification_endpoint' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN notification_endpoint TEXT;
        RAISE NOTICE 'Добавлена колонка users.notification_endpoint (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.notification_endpoint: %', SQLERRM;
END $$;

-- Колонка: json_data (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'json_data' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN json_data TEXT;
        RAISE NOTICE 'Добавлена колонка users.json_data (TEXT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.json_data: %', SQLERRM;
END $$;

-- Колонка: tos_violation_reason (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'tos_violation_reason' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN tos_violation_reason VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.tos_violation_reason (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.tos_violation_reason: %', SQLERRM;
END $$;

-- Колонка: google_analytics_domains (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'google_analytics_domains' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN google_analytics_domains VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.google_analytics_domains (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.google_analytics_domains: %', SQLERRM;
END $$;

-- Колонка: facebook_pixel_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_pixel_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_pixel_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_pixel_id (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.facebook_pixel_id: %', SQLERRM;
END $$;

-- Колонка: split_payment_by_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'split_payment_by_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN split_payment_by_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка users.split_payment_by_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.split_payment_by_cents: %', SQLERRM;
END $$;

-- Колонка: last_active_sessions_invalidated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'last_active_sessions_invalidated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN last_active_sessions_invalidated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.last_active_sessions_invalidated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.last_active_sessions_invalidated_at: %', SQLERRM;
END $$;

-- Колонка: otp_secret_key (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'otp_secret_key' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN otp_secret_key VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.otp_secret_key (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.otp_secret_key: %', SQLERRM;
END $$;

-- Колонка: orientation_priority_tag (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'orientation_priority_tag' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN orientation_priority_tag VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.orientation_priority_tag (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.orientation_priority_tag: %', SQLERRM;
END $$;

-- Колонка: facebook_access_token (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_access_token' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_access_token VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_access_token (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.facebook_access_token: %', SQLERRM;
END $$;

-- Колонка: manage_pages (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'manage_pages' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN manage_pages BOOLEAN;
        RAISE NOTICE 'Добавлена колонка users.manage_pages (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.manage_pages: %', SQLERRM;
END $$;

-- Колонка: banned_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'banned_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN banned_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.banned_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.banned_at: %', SQLERRM;
END $$;

-- Колонка: weekly_notification (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'weekly_notification' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN weekly_notification BOOLEAN;
        RAISE NOTICE 'Добавлена колонка users.weekly_notification (BOOLEAN)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.weekly_notification: %', SQLERRM;
END $$;

-- Колонка: state (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN state VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.state (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.state: %', SQLERRM;
END $$;

-- Колонка: city (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'city' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN city VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.city (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.city: %', SQLERRM;
END $$;

-- Колонка: zip_code (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'zip_code' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN zip_code VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.zip_code (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.zip_code: %', SQLERRM;
END $$;

-- Колонка: street_address (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'street_address' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN street_address VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.street_address (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления users.street_address: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: VARIANT_CATEGORIES (модель: VariantCategory)
-- ========================================

-- Колонка: link_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'variant_categories' AND column_name = 'link_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE variant_categories ADD COLUMN link_id BIGINT;
        RAISE NOTICE 'Добавлена колонка variant_categories.link_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления variant_categories.link_id: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'variant_categories' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE variant_categories ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка variant_categories.deleted_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления variant_categories.deleted_at: %', SQLERRM;
END $$;

-- Колонка: title (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'variant_categories' AND column_name = 'title' 
                   AND table_schema = 'public') THEN
        ALTER TABLE variant_categories ADD COLUMN title VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка variant_categories.title (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления variant_categories.title: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'variant_categories' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE variant_categories ADD COLUMN flags BIGINT DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка variant_categories.flags (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления variant_categories.flags: %', SQLERRM;
END $$;


-- ========================================
-- ТАБЛИЦА: PRICES (модель: VariantPrice)
-- ========================================

-- Колонка: link_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'link_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN link_id BIGINT;
        RAISE NOTICE 'Добавлена колонка prices.link_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.link_id: %', SQLERRM;
END $$;

-- Колонка: price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN price_cents INTEGER DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка prices.price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.price_cents: %', SQLERRM;
END $$;

-- Колонка: currency (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'currency' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN currency VARCHAR(255) DEFAULT 'usd';
        RAISE NOTICE 'Добавлена колонка prices.currency (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.currency: %', SQLERRM;
END $$;

-- Колонка: recurrence (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'recurrence' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN recurrence VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка prices.recurrence (VARCHAR(255))';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.recurrence: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.created_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.updated_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.updated_at: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка prices.deleted_at (TIMESTAMP)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.deleted_at: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN flags BIGINT DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка prices.flags (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.flags: %', SQLERRM;
END $$;

-- Колонка: variant_id (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'variant_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN variant_id BIGINT;
        RAISE NOTICE 'Добавлена колонка prices.variant_id (BIGINT)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.variant_id: %', SQLERRM;
END $$;

-- Колонка: suggested_price_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'prices' AND column_name = 'suggested_price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE prices ADD COLUMN suggested_price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка prices.suggested_price_cents (INTEGER)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления prices.suggested_price_cents: %', SQLERRM;
END $$;


-- ========================================
-- ПРОВЕРКА РЕЗУЛЬТАТОВ
-- ========================================
SELECT 'affiliates' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'affiliates' AND table_schema = 'public';
SELECT 'prices' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'prices' AND table_schema = 'public';
SELECT 'events' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'events' AND table_schema = 'public';
SELECT 'affiliates' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'affiliates' AND table_schema = 'public';
SELECT 'links' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'links' AND table_schema = 'public';
SELECT 'prices' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'prices' AND table_schema = 'public';
SELECT 'refund_policies' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'refund_policies' AND table_schema = 'public';
SELECT 'refund_policies' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'refund_policies' AND table_schema = 'public';
SELECT 'refund_policies' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'refund_policies' AND table_schema = 'public';
SELECT 'users' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'users' AND table_schema = 'public';
SELECT 'variant_categories' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'variant_categories' AND table_schema = 'public';
SELECT 'prices' as table_name, count(*) as columns_count 
FROM information_schema.columns 
WHERE table_name = 'prices' AND table_schema = 'public';

-- ДОБАВЛЕНИЕ ВСЕХ КОЛОНОК ЗАВЕРШЕНО
