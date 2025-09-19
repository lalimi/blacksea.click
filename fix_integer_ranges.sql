-- ИСПРАВЛЕНИЕ ТИПОВ ДАННЫХ ДЛЯ БОЛЬШИХ ЧИСЕЛ
-- Изменяем INTEGER на BIGINT для колонок с большими значениями
-- Создан: автоматически для решения ошибки "integer out of range"

SET client_min_messages TO WARNING;

-- ================================== 
-- ИСПРАВЛЕНИЕ ТИПОВ В ТАБЛИЦЕ USERS
-- ==================================

-- ID колонки должны быть BIGINT
DO $$ BEGIN
    ALTER TABLE users ALTER COLUMN id TYPE BIGINT;
    RAISE NOTICE 'users.id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения users.id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE users ALTER COLUMN external_id TYPE BIGINT;
    RAISE NOTICE 'users.external_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения users.external_id: %', SQLERRM;
END $$;

-- Флаги и большие числа
DO $$ BEGIN
    ALTER TABLE users ALTER COLUMN flags TYPE BIGINT;
    RAISE NOTICE 'users.flags изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения users.flags: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE users ALTER COLUMN split_payment_by_cents TYPE BIGINT;
    RAISE NOTICE 'users.split_payment_by_cents изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения users.split_payment_by_cents: %', SQLERRM;
END $$;

-- ================================== 
-- ИСПРАВЛЕНИЕ ТИПОВ В ТАБЛИЦЕ LINKS
-- ==================================

DO $$ BEGIN
    ALTER TABLE links ALTER COLUMN id TYPE BIGINT;
    RAISE NOTICE 'links.id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE links ALTER COLUMN user_id TYPE BIGINT;
    RAISE NOTICE 'links.user_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.user_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE links ALTER COLUMN external_id TYPE BIGINT;
    RAISE NOTICE 'links.external_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.external_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE links ALTER COLUMN flags TYPE BIGINT;
    RAISE NOTICE 'links.flags изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.flags: %', SQLERRM;
END $$;

-- Цены в центах
DO $$ BEGIN
    ALTER TABLE links ALTER COLUMN price_cents TYPE BIGINT;
    RAISE NOTICE 'links.price_cents изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.price_cents: %', SQLERRM;
END $$;

-- ================================== 
-- ИСПРАВЛЕНИЕ ТИПОВ В ТАБЛИЦЕ AFFILIATES
-- ==================================

DO $$ BEGIN
    ALTER TABLE affiliates ALTER COLUMN id TYPE BIGINT;
    RAISE NOTICE 'affiliates.id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения affiliates.id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE affiliates ALTER COLUMN seller_id TYPE BIGINT;
    RAISE NOTICE 'affiliates.seller_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения affiliates.seller_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE affiliates ALTER COLUMN affiliate_user_id TYPE BIGINT;
    RAISE NOTICE 'affiliates.affiliate_user_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения affiliates.affiliate_user_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE affiliates ALTER COLUMN flags TYPE BIGINT;
    RAISE NOTICE 'affiliates.flags изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения affiliates.flags: %', SQLERRM;
END $$;

-- ================================== 
-- ИСПРАВЛЕНИЕ ТИПОВ В ТАБЛИЦЕ EVENTS
-- ==================================

DO $$ BEGIN
    ALTER TABLE events ALTER COLUMN id TYPE BIGINT;
    RAISE NOTICE 'events.id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE events ALTER COLUMN visit_id TYPE BIGINT;
    RAISE NOTICE 'events.visit_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.visit_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE events ALTER COLUMN user_id TYPE BIGINT;
    RAISE NOTICE 'events.user_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.user_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE events ALTER COLUMN link_id TYPE BIGINT;
    RAISE NOTICE 'events.link_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.link_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE events ALTER COLUMN purchase_id TYPE BIGINT;
    RAISE NOTICE 'events.purchase_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.purchase_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE events ALTER COLUMN price_cents TYPE BIGINT;
    RAISE NOTICE 'events.price_cents изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.price_cents: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE events ALTER COLUMN credit_card_id TYPE BIGINT;
    RAISE NOTICE 'events.credit_card_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.credit_card_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE events ALTER COLUMN service_charge_id TYPE BIGINT;
    RAISE NOTICE 'events.service_charge_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.service_charge_id: %', SQLERRM;
END $$;

-- ================================== 
-- ИСПРАВЛЕНИЕ ТИПОВ В ТАБЛИЦЕ PRICES
-- ==================================

DO $$ BEGIN
    ALTER TABLE prices ALTER COLUMN id TYPE BIGINT;
    RAISE NOTICE 'prices.id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения prices.id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE prices ALTER COLUMN link_id TYPE BIGINT;
    RAISE NOTICE 'prices.link_id изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения prices.link_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    ALTER TABLE prices ALTER COLUMN cents TYPE BIGINT;
    RAISE NOTICE 'prices.cents изменен на BIGINT';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения prices.cents: %', SQLERRM;
END $$;

-- ==================================
-- ПРОВЕРКА РЕЗУЛЬТАТОВ
-- ==================================

SELECT 
    table_name, 
    column_name, 
    data_type 
FROM information_schema.columns 
WHERE table_name IN ('users', 'links', 'affiliates', 'events', 'prices')
  AND table_schema = 'public'
  AND (column_name LIKE '%id%' OR column_name LIKE '%cents%' OR column_name = 'flags')
ORDER BY table_name, column_name;

-- ИСПРАВЛЕНИЕ ТИПОВ ЗАВЕРШЕНО