-- УМНЫЙ ИМПОРТ ДАННЫХ GUMROAD В SUPABASE
-- Проверяет существование колонок перед вставкой
-- Создан: 2025-08-28 13:16:01 +0300

SET client_min_messages TO WARNING;

-- ========================================
-- AFFILIATE (2 записей)
-- ========================================

-- Запись 1/2 для affiliates
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку seller_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'seller_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'seller_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'seller_id';
    END IF;

    -- Проверяем колонку affiliate_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'affiliate_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_user_id';
        final_values := final_values || '7';
    ELSE
        missing_cols := missing_cols || 'affiliate_user_id';
    END IF;

    -- Проверяем колонку affiliate_basis_points
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'affiliate_basis_points' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_basis_points';
        final_values := final_values || '1000';
    ELSE
        missing_cols := missing_cols || 'affiliate_basis_points';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:51:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:51:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку destination_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'destination_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'destination_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'destination_url';
    END IF;

    -- Проверяем колонку type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'type';
        final_values := final_values || ''GlobalAffiliate'';
    ELSE
        missing_cols := missing_cols || 'type';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица affiliates: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO affiliates (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в affiliates: %', SQLERRM;
END $$;

-- Запись 2/2 для affiliates
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку seller_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'seller_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'seller_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'seller_id';
    END IF;

    -- Проверяем колонку affiliate_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'affiliate_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_user_id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'affiliate_user_id';
    END IF;

    -- Проверяем колонку affiliate_basis_points
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'affiliate_basis_points' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_basis_points';
        final_values := final_values || '1000';
    ELSE
        missing_cols := missing_cols || 'affiliate_basis_points';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку destination_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'destination_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'destination_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'destination_url';
    END IF;

    -- Проверяем колонку type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'type';
        final_values := final_values || ''GlobalAffiliate'';
    ELSE
        missing_cols := missing_cols || 'type';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица affiliates: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO affiliates (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в affiliates: %', SQLERRM;
END $$;

-- ========================================
-- BASEPRICE (5 записей)
-- ========================================

-- Запись 1/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:52:00'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:52:00'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 2/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '2500';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:39:51'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:39:51'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 3/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:39:52'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:39:52'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 4/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '2500';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 16:46:09'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 16:46:09'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 5/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 17:03:49'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 17:03:49'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- ========================================
-- EVENT (26 записей)
-- ========================================

-- Запись 1/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''emails_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:54:11'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:54:11'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/checkout/discounts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/emails'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 2/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''emails_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:54:12'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:54:12'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/checkout/discounts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/emails/published'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 3/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''workflows_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:54:15'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:54:15'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/emails/published'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/workflows'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 4/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:54:17'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:54:17'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/workflows'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 5/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''emails_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:12:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:12:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/collaborators'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/emails'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 6/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '6';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''emails_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:12:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:12:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/collaborators'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/emails/published'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 7/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '7';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''workflows_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:13:04'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:13:04'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/checkout/discounts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/workflows'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 8/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:13:10'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:13:10'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/workflows'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 9/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '9';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''emails_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:57:50'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:57:50'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/checkout/discounts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/emails'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 10/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '10';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''emails_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:57:51'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:57:51'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/checkout/discounts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/emails/published'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 11/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '11';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''workflows_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:57:55'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:57:55'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/emails/published'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/workflows'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 12/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '12';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:58:01'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:58:01'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/workflows'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 13/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '13';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 13:58:10'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 13:58:10'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/customers'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 14/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '14';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:00:52'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:00:52'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/payouts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 15/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '15';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:02:33'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:02:33'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/payouts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 16/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '16';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:05:38'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:05:38'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/payouts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 17/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '17';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:06:57'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:06:57'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/payouts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 18/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '18';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:11:04'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:11:04'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/payouts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 19/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '19';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:11:13'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:11:13'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/payouts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 20/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '20';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:25:11'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:25:11'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/payouts'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 21/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '21';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:32:24'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:32:24'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/products'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 22/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '22';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:41:35'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:41:35'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/dashboard/sales?from=2025-07-27&to=2025-08-27'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 23/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '23';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:51:48'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:51:48'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/dashboard'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 24/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '24';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''workflows_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 14:51:58'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:51:58'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/customers'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/workflows'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 25/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '25';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:40:11'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:40:11'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/products'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- Запись 26/26 для events
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '26';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку visit_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'visit_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'visit_id';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'visit_id';
    END IF;

    -- Проверяем колонку ip_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_address';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'ip_address';
    END IF;

    -- Проверяем колонку event_name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'event_name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'event_name';
        final_values := final_values || ''customers_view'';
    ELSE
        missing_cols := missing_cols || 'event_name';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 18:14:21'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 18:14:21'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer';
        final_values := final_values || ''http://localhost:3000/dashboard'';
    ELSE
        missing_cols := missing_cols || 'referrer';
    END IF;

    -- Проверяем колонку parent_referrer
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'parent_referrer' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'parent_referrer';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'parent_referrer';
    END IF;

    -- Проверяем колонку language
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'language' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'language';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'language';
    END IF;

    -- Проверяем колонку browser
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser';
        final_values := final_values || ''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36'';
    ELSE
        missing_cols := missing_cols || 'browser';
    END IF;

    -- Проверяем колонку is_mobile
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_mobile' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_mobile';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'is_mobile';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку purchase_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку credit_card_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'credit_card_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'credit_card_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'credit_card_id';
    END IF;

    -- Проверяем колонку card_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_type';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_type';
    END IF;

    -- Проверяем колонку card_visual
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'card_visual' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'card_visual';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'card_visual';
    END IF;

    -- Проверяем колонку purchase_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'purchase_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_state';
    END IF;

    -- Проверяем колонку billing_zip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'billing_zip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'billing_zip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'billing_zip';
    END IF;

    -- Проверяем колонку chargeback
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'chargeback' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'chargeback';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'chargeback';
    END IF;

    -- Проверяем колонку refunded
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'refunded' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'refunded';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'refunded';
    END IF;

    -- Проверяем колонку view_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'view_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'view_url';
        final_values := final_values || ''/customers'';
    ELSE
        missing_cols := missing_cols || 'view_url';
    END IF;

    -- Проверяем колонку fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fingerprint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fingerprint';
    END IF;

    -- Проверяем колонку ip_country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_country';
    END IF;

    -- Проверяем колонку ip_longitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_longitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_longitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_longitude';
    END IF;

    -- Проверяем колонку ip_latitude
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_latitude' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_latitude';
        final_values := final_values || '0.0';
    ELSE
        missing_cols := missing_cols || 'ip_latitude';
    END IF;

    -- Проверяем колонку is_modal
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'is_modal' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'is_modal';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'is_modal';
    END IF;

    -- Проверяем колонку friend_actions
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'friend_actions' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'friend_actions';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'friend_actions';
    END IF;

    -- Проверяем колонку browser_fingerprint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_fingerprint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_fingerprint';
        final_values := final_values || ''c8c5e239db9019680bf7a5d3fb32ffb0'';
    ELSE
        missing_cols := missing_cols || 'browser_fingerprint';
    END IF;

    -- Проверяем колонку browser_plugins
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_plugins' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_plugins';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'browser_plugins';
    END IF;

    -- Проверяем колонку browser_guid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'browser_guid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'browser_guid';
        final_values := final_values || ''c4148e78-a514-4622-8794-7c85ac397dd5'';
    ELSE
        missing_cols := missing_cols || 'browser_guid';
    END IF;

    -- Проверяем колонку referrer_domain
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'referrer_domain' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'referrer_domain';
        final_values := final_values || ''localhost'';
    ELSE
        missing_cols := missing_cols || 'referrer_domain';
    END IF;

    -- Проверяем колонку ip_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'ip_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'ip_state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'ip_state';
    END IF;

    -- Проверяем колонку service_charge_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'events' 
        AND column_name = 'service_charge_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'service_charge_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'service_charge_id';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица events: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO events (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в events: %', SQLERRM;
END $$;

-- ========================================
-- GLOBALAFFILIATE (2 записей)
-- ========================================

-- Запись 1/2 для affiliates
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку seller_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'seller_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'seller_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'seller_id';
    END IF;

    -- Проверяем колонку affiliate_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'affiliate_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_user_id';
        final_values := final_values || '7';
    ELSE
        missing_cols := missing_cols || 'affiliate_user_id';
    END IF;

    -- Проверяем колонку affiliate_basis_points
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'affiliate_basis_points' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_basis_points';
        final_values := final_values || '1000';
    ELSE
        missing_cols := missing_cols || 'affiliate_basis_points';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:51:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:51:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку destination_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'destination_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'destination_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'destination_url';
    END IF;

    -- Проверяем колонку type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'type';
        final_values := final_values || ''GlobalAffiliate'';
    ELSE
        missing_cols := missing_cols || 'type';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица affiliates: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO affiliates (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в affiliates: %', SQLERRM;
END $$;

-- Запись 2/2 для affiliates
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку seller_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'seller_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'seller_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'seller_id';
    END IF;

    -- Проверяем колонку affiliate_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'affiliate_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_user_id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'affiliate_user_id';
    END IF;

    -- Проверяем колонку affiliate_basis_points
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'affiliate_basis_points' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_basis_points';
        final_values := final_values || '1000';
    ELSE
        missing_cols := missing_cols || 'affiliate_basis_points';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку destination_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'destination_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'destination_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'destination_url';
    END IF;

    -- Проверяем колонку type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'affiliates' 
        AND column_name = 'type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'type';
        final_values := final_values || ''GlobalAffiliate'';
    ELSE
        missing_cols := missing_cols || 'type';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица affiliates: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO affiliates (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в affiliates: %', SQLERRM;
END $$;

-- ========================================
-- LINK (4 записей)
-- ========================================

-- Запись 1/4 для links
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || ''Тестовий цифровий продукт'';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку unique_permalink
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'unique_permalink' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unique_permalink';
        final_values := final_values || ''y'';
    ELSE
        missing_cols := missing_cols || 'unique_permalink';
    END IF;

    -- Проверяем колонку preview_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'preview_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'preview_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'preview_url';
    END IF;

    -- Проверяем колонку description
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'description' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'description';
        final_values := final_values || ''Це тестовий цифровий продукт для перевірки системи'';
    ELSE
        missing_cols := missing_cols || 'description';
    END IF;

    -- Проверяем колонку purchase_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'purchase_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_type';
        final_values := final_values || ''buy_only'';
    ELSE
        missing_cols := missing_cols || 'purchase_type';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:39:51'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:39:51'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку purchase_disabled_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'purchase_disabled_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_disabled_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_disabled_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '2500';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку price_currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'price_currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_currency_type';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'price_currency_type';
    END IF;

    -- Проверяем колонку customizable_price
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'customizable_price' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'customizable_price';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'customizable_price';
    END IF;

    -- Проверяем колонку max_purchase_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'max_purchase_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'max_purchase_count';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'max_purchase_count';
    END IF;

    -- Проверяем колонку bad_card_counter
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'bad_card_counter' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bad_card_counter';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'bad_card_counter';
    END IF;

    -- Проверяем колонку require_shipping
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'require_shipping' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'require_shipping';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'require_shipping';
    END IF;

    -- Проверяем колонку last_partner_sync
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'last_partner_sync' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_partner_sync';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_partner_sync';
    END IF;

    -- Проверяем колонку preview_oembed
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'preview_oembed' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'preview_oembed';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'preview_oembed';
    END IF;

    -- Проверяем колонку showcaseable
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'showcaseable' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'showcaseable';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'showcaseable';
    END IF;

    -- Проверяем колонку custom_receipt
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_receipt' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_receipt';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_receipt';
    END IF;

    -- Проверяем колонку custom_filetype
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_filetype' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_filetype';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_filetype';
    END IF;

    -- Проверяем колонку filetype
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'filetype' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'filetype';
        final_values := final_values || ''link'';
    ELSE
        missing_cols := missing_cols || 'filetype';
    END IF;

    -- Проверяем колонку filegroup
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'filegroup' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'filegroup';
        final_values := final_values || ''url'';
    ELSE
        missing_cols := missing_cols || 'filegroup';
    END IF;

    -- Проверяем колонку size
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'size' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'size';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'size';
    END IF;

    -- Проверяем колонку bitrate
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'bitrate' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bitrate';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bitrate';
    END IF;

    -- Проверяем колонку framerate
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'framerate' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'framerate';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'framerate';
    END IF;

    -- Проверяем колонку pagelength
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'pagelength' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'pagelength';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'pagelength';
    END IF;

    -- Проверяем колонку duration
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'duration' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'duration';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'duration';
    END IF;

    -- Проверяем колонку width
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'width' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'width';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'width';
    END IF;

    -- Проверяем колонку height
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'height' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'height';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'height';
    END IF;

    -- Проверяем колонку custom_permalink
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_permalink' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_permalink';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_permalink';
    END IF;

    -- Проверяем колонку common_color
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'common_color' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'common_color';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'common_color';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку risk_score
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'risk_score' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'risk_score';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'risk_score';
    END IF;

    -- Проверяем колонку risk_score_updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'risk_score_updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'risk_score_updated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'risk_score_updated_at';
    END IF;

    -- Проверяем колонку draft
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'draft' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'draft';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'draft';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку subscription_duration
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'subscription_duration' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'subscription_duration';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'subscription_duration';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку external_mapping_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'external_mapping_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_mapping_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'external_mapping_id';
    END IF;

    -- Проверяем колонку affiliate_application_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'affiliate_application_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_application_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'affiliate_application_id';
    END IF;

    -- Проверяем колонку rental_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'rental_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'rental_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'rental_price_cents';
    END IF;

    -- Проверяем колонку duration_in_months
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'duration_in_months' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'duration_in_months';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'duration_in_months';
    END IF;

    -- Проверяем колонку migrated_to_tiered_pricing_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'migrated_to_tiered_pricing_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'migrated_to_tiered_pricing_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'migrated_to_tiered_pricing_at';
    END IF;

    -- Проверяем колонку free_trial_duration_unit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'free_trial_duration_unit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'free_trial_duration_unit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'free_trial_duration_unit';
    END IF;

    -- Проверяем колонку free_trial_duration_amount
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'free_trial_duration_amount' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'free_trial_duration_amount';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'free_trial_duration_amount';
    END IF;

    -- Проверяем колонку content_updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'content_updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'content_updated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'content_updated_at';
    END IF;

    -- Проверяем колонку taxonomy_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'taxonomy_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'taxonomy_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'taxonomy_id';
    END IF;

    -- Проверяем колонку native_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'native_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'native_type';
        final_values := final_values || ''digital'';
    ELSE
        missing_cols := missing_cols || 'native_type';
    END IF;

    -- Проверяем колонку discover_fee_per_thousand
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'discover_fee_per_thousand' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'discover_fee_per_thousand';
        final_values := final_values || '300';
    ELSE
        missing_cols := missing_cols || 'discover_fee_per_thousand';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица links: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO links (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в links: %', SQLERRM;
END $$;

-- Запись 2/4 для links
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || ''Тестовий фізичний товар'';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку unique_permalink
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'unique_permalink' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unique_permalink';
        final_values := final_values || ''o'';
    ELSE
        missing_cols := missing_cols || 'unique_permalink';
    END IF;

    -- Проверяем колонку preview_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'preview_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'preview_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'preview_url';
    END IF;

    -- Проверяем колонку description
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'description' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'description';
        final_values := final_values || ''Це тестовий фізичний товар з доставкою'';
    ELSE
        missing_cols := missing_cols || 'description';
    END IF;

    -- Проверяем колонку purchase_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'purchase_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_type';
        final_values := final_values || ''buy_only'';
    ELSE
        missing_cols := missing_cols || 'purchase_type';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:39:52'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:39:52'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку purchase_disabled_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'purchase_disabled_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_disabled_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_disabled_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку price_currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'price_currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_currency_type';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'price_currency_type';
    END IF;

    -- Проверяем колонку customizable_price
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'customizable_price' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'customizable_price';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'customizable_price';
    END IF;

    -- Проверяем колонку max_purchase_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'max_purchase_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'max_purchase_count';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'max_purchase_count';
    END IF;

    -- Проверяем колонку bad_card_counter
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'bad_card_counter' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bad_card_counter';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'bad_card_counter';
    END IF;

    -- Проверяем колонку require_shipping
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'require_shipping' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'require_shipping';
        final_values := final_values || 'true';
    ELSE
        missing_cols := missing_cols || 'require_shipping';
    END IF;

    -- Проверяем колонку last_partner_sync
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'last_partner_sync' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_partner_sync';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_partner_sync';
    END IF;

    -- Проверяем колонку preview_oembed
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'preview_oembed' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'preview_oembed';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'preview_oembed';
    END IF;

    -- Проверяем колонку showcaseable
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'showcaseable' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'showcaseable';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'showcaseable';
    END IF;

    -- Проверяем колонку custom_receipt
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_receipt' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_receipt';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_receipt';
    END IF;

    -- Проверяем колонку custom_filetype
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_filetype' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_filetype';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_filetype';
    END IF;

    -- Проверяем колонку filetype
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'filetype' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'filetype';
        final_values := final_values || ''link'';
    ELSE
        missing_cols := missing_cols || 'filetype';
    END IF;

    -- Проверяем колонку filegroup
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'filegroup' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'filegroup';
        final_values := final_values || ''url'';
    ELSE
        missing_cols := missing_cols || 'filegroup';
    END IF;

    -- Проверяем колонку size
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'size' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'size';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'size';
    END IF;

    -- Проверяем колонку bitrate
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'bitrate' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bitrate';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bitrate';
    END IF;

    -- Проверяем колонку framerate
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'framerate' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'framerate';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'framerate';
    END IF;

    -- Проверяем колонку pagelength
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'pagelength' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'pagelength';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'pagelength';
    END IF;

    -- Проверяем колонку duration
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'duration' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'duration';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'duration';
    END IF;

    -- Проверяем колонку width
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'width' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'width';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'width';
    END IF;

    -- Проверяем колонку height
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'height' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'height';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'height';
    END IF;

    -- Проверяем колонку custom_permalink
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_permalink' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_permalink';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_permalink';
    END IF;

    -- Проверяем колонку common_color
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'common_color' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'common_color';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'common_color';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку risk_score
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'risk_score' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'risk_score';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'risk_score';
    END IF;

    -- Проверяем колонку risk_score_updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'risk_score_updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'risk_score_updated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'risk_score_updated_at';
    END IF;

    -- Проверяем колонку draft
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'draft' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'draft';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'draft';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '128';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку subscription_duration
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'subscription_duration' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'subscription_duration';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'subscription_duration';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку external_mapping_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'external_mapping_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_mapping_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'external_mapping_id';
    END IF;

    -- Проверяем колонку affiliate_application_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'affiliate_application_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_application_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'affiliate_application_id';
    END IF;

    -- Проверяем колонку rental_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'rental_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'rental_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'rental_price_cents';
    END IF;

    -- Проверяем колонку duration_in_months
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'duration_in_months' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'duration_in_months';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'duration_in_months';
    END IF;

    -- Проверяем колонку migrated_to_tiered_pricing_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'migrated_to_tiered_pricing_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'migrated_to_tiered_pricing_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'migrated_to_tiered_pricing_at';
    END IF;

    -- Проверяем колонку free_trial_duration_unit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'free_trial_duration_unit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'free_trial_duration_unit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'free_trial_duration_unit';
    END IF;

    -- Проверяем колонку free_trial_duration_amount
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'free_trial_duration_amount' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'free_trial_duration_amount';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'free_trial_duration_amount';
    END IF;

    -- Проверяем колонку content_updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'content_updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'content_updated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'content_updated_at';
    END IF;

    -- Проверяем колонку taxonomy_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'taxonomy_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'taxonomy_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'taxonomy_id';
    END IF;

    -- Проверяем колонку native_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'native_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'native_type';
        final_values := final_values || ''physical'';
    ELSE
        missing_cols := missing_cols || 'native_type';
    END IF;

    -- Проверяем колонку discover_fee_per_thousand
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'discover_fee_per_thousand' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'discover_fee_per_thousand';
        final_values := final_values || '300';
    ELSE
        missing_cols := missing_cols || 'discover_fee_per_thousand';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица links: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO links (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в links: %', SQLERRM;
END $$;

-- Запись 3/4 для links
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || ''Test Product Simple'';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку unique_permalink
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'unique_permalink' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unique_permalink';
        final_values := final_values || ''z'';
    ELSE
        missing_cols := missing_cols || 'unique_permalink';
    END IF;

    -- Проверяем колонку preview_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'preview_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'preview_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'preview_url';
    END IF;

    -- Проверяем колонку description
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'description' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'description';
        final_values := final_values || ''Simple test product'';
    ELSE
        missing_cols := missing_cols || 'description';
    END IF;

    -- Проверяем колонку purchase_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'purchase_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_type';
        final_values := final_values || ''buy_only'';
    ELSE
        missing_cols := missing_cols || 'purchase_type';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 16:46:09'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 16:46:09'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку purchase_disabled_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'purchase_disabled_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_disabled_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_disabled_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '2500';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку price_currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'price_currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_currency_type';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'price_currency_type';
    END IF;

    -- Проверяем колонку customizable_price
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'customizable_price' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'customizable_price';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'customizable_price';
    END IF;

    -- Проверяем колонку max_purchase_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'max_purchase_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'max_purchase_count';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'max_purchase_count';
    END IF;

    -- Проверяем колонку bad_card_counter
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'bad_card_counter' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bad_card_counter';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'bad_card_counter';
    END IF;

    -- Проверяем колонку require_shipping
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'require_shipping' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'require_shipping';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'require_shipping';
    END IF;

    -- Проверяем колонку last_partner_sync
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'last_partner_sync' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_partner_sync';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_partner_sync';
    END IF;

    -- Проверяем колонку preview_oembed
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'preview_oembed' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'preview_oembed';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'preview_oembed';
    END IF;

    -- Проверяем колонку showcaseable
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'showcaseable' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'showcaseable';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'showcaseable';
    END IF;

    -- Проверяем колонку custom_receipt
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_receipt' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_receipt';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_receipt';
    END IF;

    -- Проверяем колонку custom_filetype
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_filetype' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_filetype';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_filetype';
    END IF;

    -- Проверяем колонку filetype
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'filetype' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'filetype';
        final_values := final_values || ''link'';
    ELSE
        missing_cols := missing_cols || 'filetype';
    END IF;

    -- Проверяем колонку filegroup
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'filegroup' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'filegroup';
        final_values := final_values || ''url'';
    ELSE
        missing_cols := missing_cols || 'filegroup';
    END IF;

    -- Проверяем колонку size
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'size' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'size';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'size';
    END IF;

    -- Проверяем колонку bitrate
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'bitrate' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bitrate';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bitrate';
    END IF;

    -- Проверяем колонку framerate
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'framerate' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'framerate';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'framerate';
    END IF;

    -- Проверяем колонку pagelength
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'pagelength' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'pagelength';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'pagelength';
    END IF;

    -- Проверяем колонку duration
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'duration' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'duration';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'duration';
    END IF;

    -- Проверяем колонку width
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'width' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'width';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'width';
    END IF;

    -- Проверяем колонку height
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'height' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'height';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'height';
    END IF;

    -- Проверяем колонку custom_permalink
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_permalink' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_permalink';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_permalink';
    END IF;

    -- Проверяем колонку common_color
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'common_color' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'common_color';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'common_color';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку risk_score
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'risk_score' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'risk_score';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'risk_score';
    END IF;

    -- Проверяем колонку risk_score_updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'risk_score_updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'risk_score_updated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'risk_score_updated_at';
    END IF;

    -- Проверяем колонку draft
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'draft' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'draft';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'draft';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку subscription_duration
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'subscription_duration' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'subscription_duration';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'subscription_duration';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку external_mapping_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'external_mapping_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_mapping_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'external_mapping_id';
    END IF;

    -- Проверяем колонку affiliate_application_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'affiliate_application_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_application_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'affiliate_application_id';
    END IF;

    -- Проверяем колонку rental_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'rental_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'rental_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'rental_price_cents';
    END IF;

    -- Проверяем колонку duration_in_months
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'duration_in_months' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'duration_in_months';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'duration_in_months';
    END IF;

    -- Проверяем колонку migrated_to_tiered_pricing_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'migrated_to_tiered_pricing_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'migrated_to_tiered_pricing_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'migrated_to_tiered_pricing_at';
    END IF;

    -- Проверяем колонку free_trial_duration_unit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'free_trial_duration_unit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'free_trial_duration_unit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'free_trial_duration_unit';
    END IF;

    -- Проверяем колонку free_trial_duration_amount
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'free_trial_duration_amount' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'free_trial_duration_amount';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'free_trial_duration_amount';
    END IF;

    -- Проверяем колонку content_updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'content_updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'content_updated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'content_updated_at';
    END IF;

    -- Проверяем колонку taxonomy_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'taxonomy_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'taxonomy_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'taxonomy_id';
    END IF;

    -- Проверяем колонку native_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'native_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'native_type';
        final_values := final_values || ''digital'';
    ELSE
        missing_cols := missing_cols || 'native_type';
    END IF;

    -- Проверяем колонку discover_fee_per_thousand
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'discover_fee_per_thousand' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'discover_fee_per_thousand';
        final_values := final_values || '300';
    ELSE
        missing_cols := missing_cols || 'discover_fee_per_thousand';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица links: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO links (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в links: %', SQLERRM;
END $$;

-- Запись 4/4 для links
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'user_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || ''Цифровий товар основного користувача'';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку unique_permalink
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'unique_permalink' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unique_permalink';
        final_values := final_values || ''r'';
    ELSE
        missing_cols := missing_cols || 'unique_permalink';
    END IF;

    -- Проверяем колонку preview_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'preview_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'preview_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'preview_url';
    END IF;

    -- Проверяем колонку description
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'description' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'description';
        final_values := final_values || ''Тестовий цифровий товар'';
    ELSE
        missing_cols := missing_cols || 'description';
    END IF;

    -- Проверяем колонку purchase_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'purchase_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_type';
        final_values := final_values || ''buy_only'';
    ELSE
        missing_cols := missing_cols || 'purchase_type';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 17:03:49'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 17:03:49'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку purchase_disabled_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'purchase_disabled_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchase_disabled_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchase_disabled_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку price_currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'price_currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_currency_type';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'price_currency_type';
    END IF;

    -- Проверяем колонку customizable_price
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'customizable_price' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'customizable_price';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'customizable_price';
    END IF;

    -- Проверяем колонку max_purchase_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'max_purchase_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'max_purchase_count';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'max_purchase_count';
    END IF;

    -- Проверяем колонку bad_card_counter
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'bad_card_counter' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bad_card_counter';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'bad_card_counter';
    END IF;

    -- Проверяем колонку require_shipping
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'require_shipping' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'require_shipping';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'require_shipping';
    END IF;

    -- Проверяем колонку last_partner_sync
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'last_partner_sync' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_partner_sync';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_partner_sync';
    END IF;

    -- Проверяем колонку preview_oembed
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'preview_oembed' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'preview_oembed';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'preview_oembed';
    END IF;

    -- Проверяем колонку showcaseable
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'showcaseable' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'showcaseable';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'showcaseable';
    END IF;

    -- Проверяем колонку custom_receipt
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_receipt' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_receipt';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_receipt';
    END IF;

    -- Проверяем колонку custom_filetype
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_filetype' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_filetype';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_filetype';
    END IF;

    -- Проверяем колонку filetype
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'filetype' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'filetype';
        final_values := final_values || ''link'';
    ELSE
        missing_cols := missing_cols || 'filetype';
    END IF;

    -- Проверяем колонку filegroup
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'filegroup' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'filegroup';
        final_values := final_values || ''url'';
    ELSE
        missing_cols := missing_cols || 'filegroup';
    END IF;

    -- Проверяем колонку size
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'size' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'size';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'size';
    END IF;

    -- Проверяем колонку bitrate
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'bitrate' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bitrate';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bitrate';
    END IF;

    -- Проверяем колонку framerate
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'framerate' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'framerate';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'framerate';
    END IF;

    -- Проверяем колонку pagelength
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'pagelength' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'pagelength';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'pagelength';
    END IF;

    -- Проверяем колонку duration
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'duration' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'duration';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'duration';
    END IF;

    -- Проверяем колонку width
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'width' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'width';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'width';
    END IF;

    -- Проверяем колонку height
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'height' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'height';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'height';
    END IF;

    -- Проверяем колонку custom_permalink
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'custom_permalink' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'custom_permalink';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'custom_permalink';
    END IF;

    -- Проверяем колонку common_color
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'common_color' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'common_color';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'common_color';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку risk_score
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'risk_score' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'risk_score';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'risk_score';
    END IF;

    -- Проверяем колонку risk_score_updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'risk_score_updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'risk_score_updated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'risk_score_updated_at';
    END IF;

    -- Проверяем колонку draft
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'draft' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'draft';
        final_values := final_values || 'false';
    ELSE
        missing_cols := missing_cols || 'draft';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку subscription_duration
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'subscription_duration' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'subscription_duration';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'subscription_duration';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку external_mapping_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'external_mapping_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_mapping_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'external_mapping_id';
    END IF;

    -- Проверяем колонку affiliate_application_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'affiliate_application_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'affiliate_application_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'affiliate_application_id';
    END IF;

    -- Проверяем колонку rental_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'rental_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'rental_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'rental_price_cents';
    END IF;

    -- Проверяем колонку duration_in_months
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'duration_in_months' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'duration_in_months';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'duration_in_months';
    END IF;

    -- Проверяем колонку migrated_to_tiered_pricing_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'migrated_to_tiered_pricing_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'migrated_to_tiered_pricing_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'migrated_to_tiered_pricing_at';
    END IF;

    -- Проверяем колонку free_trial_duration_unit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'free_trial_duration_unit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'free_trial_duration_unit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'free_trial_duration_unit';
    END IF;

    -- Проверяем колонку free_trial_duration_amount
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'free_trial_duration_amount' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'free_trial_duration_amount';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'free_trial_duration_amount';
    END IF;

    -- Проверяем колонку content_updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'content_updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'content_updated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'content_updated_at';
    END IF;

    -- Проверяем колонку taxonomy_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'taxonomy_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'taxonomy_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'taxonomy_id';
    END IF;

    -- Проверяем колонку native_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'native_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'native_type';
        final_values := final_values || ''digital'';
    ELSE
        missing_cols := missing_cols || 'native_type';
    END IF;

    -- Проверяем колонку discover_fee_per_thousand
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'links' 
        AND column_name = 'discover_fee_per_thousand' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'discover_fee_per_thousand';
        final_values := final_values || '300';
    ELSE
        missing_cols := missing_cols || 'discover_fee_per_thousand';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица links: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO links (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в links: %', SQLERRM;
END $$;

-- ========================================
-- PRICE (5 записей)
-- ========================================

-- Запись 1/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:52:00'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:52:00'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 2/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '2500';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:39:51'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:39:51'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 3/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:39:52'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:39:52'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 4/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '2500';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 16:46:09'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 16:46:09'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 5/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 17:03:49'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 17:03:49'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- ========================================
-- PRODUCTREFUNDPOLICY (1 записей)
-- ========================================

-- Запись 1/1 для refund_policies
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку seller_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'seller_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'seller_id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'seller_id';
    END IF;

    -- Проверяем колонку product_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'product_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'product_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'product_id';
    END IF;

    -- Проверяем колонку title
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'title' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'title';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'title';
    END IF;

    -- Проверяем колонку fine_print
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'fine_print' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fine_print';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fine_print';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку max_refund_period_in_days
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'max_refund_period_in_days' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'max_refund_period_in_days';
        final_values := final_values || '30';
    ELSE
        missing_cols := missing_cols || 'max_refund_period_in_days';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица refund_policies: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO refund_policies (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в refund_policies: %', SQLERRM;
END $$;

-- ========================================
-- REFUNDPOLICY (1 записей)
-- ========================================

-- Запись 1/1 для refund_policies
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку seller_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'seller_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'seller_id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'seller_id';
    END IF;

    -- Проверяем колонку product_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'product_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'product_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'product_id';
    END IF;

    -- Проверяем колонку title
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'title' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'title';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'title';
    END IF;

    -- Проверяем колонку fine_print
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'fine_print' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fine_print';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fine_print';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку max_refund_period_in_days
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'max_refund_period_in_days' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'max_refund_period_in_days';
        final_values := final_values || '30';
    ELSE
        missing_cols := missing_cols || 'max_refund_period_in_days';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица refund_policies: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO refund_policies (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в refund_policies: %', SQLERRM;
END $$;

-- ========================================
-- SELLERREFUNDPOLICY (1 записей)
-- ========================================

-- Запись 1/1 для refund_policies
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку seller_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'seller_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'seller_id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'seller_id';
    END IF;

    -- Проверяем колонку product_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'product_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'product_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'product_id';
    END IF;

    -- Проверяем колонку title
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'title' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'title';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'title';
    END IF;

    -- Проверяем колонку fine_print
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'fine_print' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'fine_print';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'fine_print';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку max_refund_period_in_days
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'refund_policies' 
        AND column_name = 'max_refund_period_in_days' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'max_refund_period_in_days';
        final_values := final_values || '30';
    ELSE
        missing_cols := missing_cols || 'max_refund_period_in_days';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица refund_policies: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO refund_policies (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в refund_policies: %', SQLERRM;
END $$;

-- ========================================
-- USER (5 записей)
-- ========================================

-- Запись 1/5 для users
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || ''test@example.com'';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку encrypted_password
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'encrypted_password' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'encrypted_password';
        final_values := final_values || ''$2a$11$aDbFr03VvZ7OPrbycz.JnezMQZATV5ESCRE/ihDnOmi32GGjUzeBG'';
    ELSE
        missing_cols := missing_cols || 'encrypted_password';
    END IF;

    -- Проверяем колонку reset_password_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_token';
    END IF;

    -- Проверяем колонку reset_password_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_sent_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_sent_at';
    END IF;

    -- Проверяем колонку remember_created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'remember_created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'remember_created_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'remember_created_at';
    END IF;

    -- Проверяем колонку sign_in_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'sign_in_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'sign_in_count';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'sign_in_count';
    END IF;

    -- Проверяем колонку current_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_at';
    END IF;

    -- Проверяем колонку last_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_at';
    END IF;

    -- Проверяем колонку current_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_ip';
    END IF;

    -- Проверяем колонку last_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_ip';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-26 07:10:57'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-26 07:10:57'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку google_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_uid';
    END IF;

    -- Проверяем колонку username
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'username' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'username';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'username';
    END IF;

    -- Проверяем колонку user_risk_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'user_risk_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_risk_state';
        final_values := final_values || ''not_reviewed'';
    ELSE
        missing_cols := missing_cols || 'user_risk_state';
    END IF;

    -- Проверяем колонку external_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'external_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_id';
        final_values := final_values || ''8899095974529'';
    ELSE
        missing_cols := missing_cols || 'external_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку provider
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'provider' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'provider';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'provider';
    END IF;

    -- Проверяем колонку confirmed_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmed_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmed_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'confirmed_at';
    END IF;

    -- Проверяем колонку confirmation_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_token';
        final_values := final_values || ''ZpAdZyDwFfguwbNMY7-d'';
    ELSE
        missing_cols := missing_cols || 'confirmation_token';
    END IF;

    -- Проверяем колонку confirmation_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_sent_at';
        final_values := final_values || ''2025-08-26 07:10:57'';
    ELSE
        missing_cols := missing_cols || 'confirmation_sent_at';
    END IF;

    -- Проверяем колонку unconfirmed_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'unconfirmed_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unconfirmed_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'unconfirmed_email';
    END IF;

    -- Проверяем колонку tier_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tier_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tier_state';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'tier_state';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '22123376574785';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку locale
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'locale' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'locale';
        final_values := final_values || ''en'';
    ELSE
        missing_cols := missing_cols || 'locale';
    END IF;

    -- Проверяем колонку timezone
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'timezone' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'timezone';
        final_values := final_values || ''Pacific Time (US & Canada)'';
    ELSE
        missing_cols := missing_cols || 'timezone';
    END IF;

    -- Проверяем колонку currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency_type';
        final_values := final_values || ''usd'';
    ELSE
        missing_cols := missing_cols || 'currency_type';
    END IF;

    -- Проверяем колонку recommendation_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'recommendation_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recommendation_type';
        final_values := final_values || ''own_products'';
    ELSE
        missing_cols := missing_cols || 'recommendation_type';
    END IF;

    -- Проверяем колонку facebook_meta_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_meta_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_meta_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_meta_tag';
    END IF;

    -- Проверяем колонку google_analytics_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_id';
    END IF;

    -- Проверяем колонку support_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'support_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'support_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'support_email';
    END IF;

    -- Проверяем колонку bio
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'bio' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bio';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bio';
    END IF;

    -- Проверяем колонку profile_picture_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'profile_picture_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'profile_picture_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'profile_picture_url';
    END IF;

    -- Проверяем колонку country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'country';
    END IF;

    -- Проверяем колонку verified
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'verified' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'verified';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'verified';
    END IF;

    -- Проверяем колонку payment_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_notification';
        final_values := final_values || 'true';
    ELSE
        missing_cols := missing_cols || 'payment_notification';
    END IF;

    -- Проверяем колонку facebook_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_uid';
    END IF;

    -- Проверяем колонку twitter_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_user_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_user_id';
    END IF;

    -- Проверяем колонку twitter_handle
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_handle' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_handle';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_handle';
    END IF;

    -- Проверяем колонку twitter_oauth_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_token';
    END IF;

    -- Проверяем колонку twitter_oauth_secret
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_secret' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_secret';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_secret';
    END IF;

    -- Проверяем колонку facebook_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_id';
    END IF;

    -- Проверяем колонку purchasing_power_parity_limit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'purchasing_power_parity_limit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchasing_power_parity_limit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchasing_power_parity_limit';
    END IF;

    -- Проверяем колонку kindle_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'kindle_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'kindle_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'kindle_email';
    END IF;

    -- Проверяем колонку payment_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'payment_address';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку account_created_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'account_created_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'account_created_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'account_created_ip';
    END IF;

    -- Проверяем колонку notification_endpoint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'notification_endpoint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'notification_endpoint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'notification_endpoint';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку tos_violation_reason
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tos_violation_reason' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tos_violation_reason';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'tos_violation_reason';
    END IF;

    -- Проверяем колонку google_analytics_domains
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_domains' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_domains';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_domains';
    END IF;

    -- Проверяем колонку facebook_pixel_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_pixel_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_pixel_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_pixel_id';
    END IF;

    -- Проверяем колонку split_payment_by_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'split_payment_by_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'split_payment_by_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'split_payment_by_cents';
    END IF;

    -- Проверяем колонку last_active_sessions_invalidated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_active_sessions_invalidated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_active_sessions_invalidated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_active_sessions_invalidated_at';
    END IF;

    -- Проверяем колонку otp_secret_key
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'otp_secret_key' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'otp_secret_key';
        final_values := final_values || ''J7BVDRCF672MRHQCC727LTY2E4EU6GJZ'';
    ELSE
        missing_cols := missing_cols || 'otp_secret_key';
    END IF;

    -- Проверяем колонку orientation_priority_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'orientation_priority_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'orientation_priority_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'orientation_priority_tag';
    END IF;

    -- Проверяем колонку facebook_access_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_access_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_access_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_access_token';
    END IF;

    -- Проверяем колонку manage_pages
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'manage_pages' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'manage_pages';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'manage_pages';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку weekly_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'weekly_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'weekly_notification';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'weekly_notification';
    END IF;

    -- Проверяем колонку state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'state';
    END IF;

    -- Проверяем колонку city
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'city' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'city';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'city';
    END IF;

    -- Проверяем колонку zip_code
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'zip_code' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'zip_code';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'zip_code';
    END IF;

    -- Проверяем колонку street_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'street_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'street_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'street_address';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица users: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO users (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в users: %', SQLERRM;
END $$;

-- Запись 2/5 для users
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || ''test_final@example.com'';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку encrypted_password
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'encrypted_password' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'encrypted_password';
        final_values := final_values || ''$2a$11$ffqGpHFR5yNHbOvvzJv.VOh6BMTXWa6oafDca7RZnleYdrgPrGD0C'';
    ELSE
        missing_cols := missing_cols || 'encrypted_password';
    END IF;

    -- Проверяем колонку reset_password_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_token';
    END IF;

    -- Проверяем колонку reset_password_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_sent_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_sent_at';
    END IF;

    -- Проверяем колонку remember_created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'remember_created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'remember_created_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'remember_created_at';
    END IF;

    -- Проверяем колонку sign_in_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'sign_in_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'sign_in_count';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'sign_in_count';
    END IF;

    -- Проверяем колонку current_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_at';
    END IF;

    -- Проверяем колонку last_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_at';
    END IF;

    -- Проверяем колонку current_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_ip';
    END IF;

    -- Проверяем колонку last_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_ip';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-26 12:20:38'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-26 12:20:38'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку google_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_uid';
    END IF;

    -- Проверяем колонку username
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'username' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'username';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'username';
    END IF;

    -- Проверяем колонку user_risk_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'user_risk_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_risk_state';
        final_values := final_values || ''not_reviewed'';
    ELSE
        missing_cols := missing_cols || 'user_risk_state';
    END IF;

    -- Проверяем колонку external_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'external_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_id';
        final_values := final_values || ''7968955700359'';
    ELSE
        missing_cols := missing_cols || 'external_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку provider
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'provider' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'provider';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'provider';
    END IF;

    -- Проверяем колонку confirmed_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmed_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmed_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'confirmed_at';
    END IF;

    -- Проверяем колонку confirmation_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_token';
        final_values := final_values || ''vjx82xu8Etd4CtK_xdT9'';
    ELSE
        missing_cols := missing_cols || 'confirmation_token';
    END IF;

    -- Проверяем колонку confirmation_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_sent_at';
        final_values := final_values || ''2025-08-26 12:20:38'';
    ELSE
        missing_cols := missing_cols || 'confirmation_sent_at';
    END IF;

    -- Проверяем колонку unconfirmed_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'unconfirmed_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unconfirmed_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'unconfirmed_email';
    END IF;

    -- Проверяем колонку tier_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tier_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tier_state';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'tier_state';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '22123376574785';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку locale
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'locale' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'locale';
        final_values := final_values || ''en'';
    ELSE
        missing_cols := missing_cols || 'locale';
    END IF;

    -- Проверяем колонку timezone
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'timezone' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'timezone';
        final_values := final_values || ''Pacific Time (US & Canada)'';
    ELSE
        missing_cols := missing_cols || 'timezone';
    END IF;

    -- Проверяем колонку currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency_type';
        final_values := final_values || ''usd'';
    ELSE
        missing_cols := missing_cols || 'currency_type';
    END IF;

    -- Проверяем колонку recommendation_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'recommendation_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recommendation_type';
        final_values := final_values || ''own_products'';
    ELSE
        missing_cols := missing_cols || 'recommendation_type';
    END IF;

    -- Проверяем колонку facebook_meta_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_meta_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_meta_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_meta_tag';
    END IF;

    -- Проверяем колонку google_analytics_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_id';
    END IF;

    -- Проверяем колонку support_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'support_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'support_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'support_email';
    END IF;

    -- Проверяем колонку bio
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'bio' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bio';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bio';
    END IF;

    -- Проверяем колонку profile_picture_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'profile_picture_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'profile_picture_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'profile_picture_url';
    END IF;

    -- Проверяем колонку country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'country';
    END IF;

    -- Проверяем колонку verified
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'verified' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'verified';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'verified';
    END IF;

    -- Проверяем колонку payment_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_notification';
        final_values := final_values || 'true';
    ELSE
        missing_cols := missing_cols || 'payment_notification';
    END IF;

    -- Проверяем колонку facebook_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_uid';
    END IF;

    -- Проверяем колонку twitter_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_user_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_user_id';
    END IF;

    -- Проверяем колонку twitter_handle
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_handle' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_handle';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_handle';
    END IF;

    -- Проверяем колонку twitter_oauth_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_token';
    END IF;

    -- Проверяем колонку twitter_oauth_secret
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_secret' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_secret';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_secret';
    END IF;

    -- Проверяем колонку facebook_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_id';
    END IF;

    -- Проверяем колонку purchasing_power_parity_limit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'purchasing_power_parity_limit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchasing_power_parity_limit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchasing_power_parity_limit';
    END IF;

    -- Проверяем колонку kindle_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'kindle_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'kindle_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'kindle_email';
    END IF;

    -- Проверяем колонку payment_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'payment_address';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку account_created_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'account_created_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'account_created_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'account_created_ip';
    END IF;

    -- Проверяем колонку notification_endpoint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'notification_endpoint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'notification_endpoint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'notification_endpoint';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку tos_violation_reason
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tos_violation_reason' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tos_violation_reason';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'tos_violation_reason';
    END IF;

    -- Проверяем колонку google_analytics_domains
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_domains' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_domains';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_domains';
    END IF;

    -- Проверяем колонку facebook_pixel_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_pixel_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_pixel_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_pixel_id';
    END IF;

    -- Проверяем колонку split_payment_by_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'split_payment_by_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'split_payment_by_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'split_payment_by_cents';
    END IF;

    -- Проверяем колонку last_active_sessions_invalidated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_active_sessions_invalidated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_active_sessions_invalidated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_active_sessions_invalidated_at';
    END IF;

    -- Проверяем колонку otp_secret_key
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'otp_secret_key' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'otp_secret_key';
        final_values := final_values || ''JD4ARAKW65EJTEROKZHFRXSCXQGKJPKG'';
    ELSE
        missing_cols := missing_cols || 'otp_secret_key';
    END IF;

    -- Проверяем колонку orientation_priority_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'orientation_priority_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'orientation_priority_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'orientation_priority_tag';
    END IF;

    -- Проверяем колонку facebook_access_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_access_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_access_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_access_token';
    END IF;

    -- Проверяем колонку manage_pages
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'manage_pages' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'manage_pages';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'manage_pages';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку weekly_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'weekly_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'weekly_notification';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'weekly_notification';
    END IF;

    -- Проверяем колонку state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'state';
    END IF;

    -- Проверяем колонку city
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'city' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'city';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'city';
    END IF;

    -- Проверяем колонку zip_code
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'zip_code' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'zip_code';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'zip_code';
    END IF;

    -- Проверяем колонку street_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'street_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'street_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'street_address';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица users: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO users (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в users: %', SQLERRM;
END $$;

-- Запись 3/5 для users
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '6';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || ''final_test@example.com'';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку encrypted_password
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'encrypted_password' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'encrypted_password';
        final_values := final_values || ''$2a$11$3NPFyrk/l8Opg2hCCAWe7uHEQHs23oovIBncpy3.XCGGiw9lGs09C'';
    ELSE
        missing_cols := missing_cols || 'encrypted_password';
    END IF;

    -- Проверяем колонку reset_password_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_token';
    END IF;

    -- Проверяем колонку reset_password_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_sent_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_sent_at';
    END IF;

    -- Проверяем колонку remember_created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'remember_created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'remember_created_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'remember_created_at';
    END IF;

    -- Проверяем колонку sign_in_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'sign_in_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'sign_in_count';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'sign_in_count';
    END IF;

    -- Проверяем колонку current_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_at';
    END IF;

    -- Проверяем колонку last_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_at';
    END IF;

    -- Проверяем колонку current_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_ip';
    END IF;

    -- Проверяем колонку last_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_ip';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-26 12:24:53'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-26 12:24:53'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку google_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_uid';
    END IF;

    -- Проверяем колонку username
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'username' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'username';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'username';
    END IF;

    -- Проверяем колонку user_risk_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'user_risk_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_risk_state';
        final_values := final_values || ''not_reviewed'';
    ELSE
        missing_cols := missing_cols || 'user_risk_state';
    END IF;

    -- Проверяем колонку external_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'external_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_id';
        final_values := final_values || ''8634327479571'';
    ELSE
        missing_cols := missing_cols || 'external_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || ''Final Test User'';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку provider
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'provider' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'provider';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'provider';
    END IF;

    -- Проверяем колонку confirmed_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmed_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmed_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'confirmed_at';
    END IF;

    -- Проверяем колонку confirmation_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_token';
        final_values := final_values || ''JymJWcXunjzHF83z4mEA'';
    ELSE
        missing_cols := missing_cols || 'confirmation_token';
    END IF;

    -- Проверяем колонку confirmation_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_sent_at';
        final_values := final_values || ''2025-08-26 12:24:53'';
    ELSE
        missing_cols := missing_cols || 'confirmation_sent_at';
    END IF;

    -- Проверяем колонку unconfirmed_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'unconfirmed_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unconfirmed_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'unconfirmed_email';
    END IF;

    -- Проверяем колонку tier_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tier_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tier_state';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'tier_state';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '22123376574785';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку locale
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'locale' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'locale';
        final_values := final_values || ''en'';
    ELSE
        missing_cols := missing_cols || 'locale';
    END IF;

    -- Проверяем колонку timezone
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'timezone' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'timezone';
        final_values := final_values || ''Pacific Time (US & Canada)'';
    ELSE
        missing_cols := missing_cols || 'timezone';
    END IF;

    -- Проверяем колонку currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency_type';
        final_values := final_values || ''usd'';
    ELSE
        missing_cols := missing_cols || 'currency_type';
    END IF;

    -- Проверяем колонку recommendation_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'recommendation_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recommendation_type';
        final_values := final_values || ''own_products'';
    ELSE
        missing_cols := missing_cols || 'recommendation_type';
    END IF;

    -- Проверяем колонку facebook_meta_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_meta_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_meta_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_meta_tag';
    END IF;

    -- Проверяем колонку google_analytics_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_id';
    END IF;

    -- Проверяем колонку support_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'support_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'support_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'support_email';
    END IF;

    -- Проверяем колонку bio
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'bio' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bio';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bio';
    END IF;

    -- Проверяем колонку profile_picture_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'profile_picture_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'profile_picture_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'profile_picture_url';
    END IF;

    -- Проверяем колонку country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'country';
    END IF;

    -- Проверяем колонку verified
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'verified' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'verified';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'verified';
    END IF;

    -- Проверяем колонку payment_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_notification';
        final_values := final_values || 'true';
    ELSE
        missing_cols := missing_cols || 'payment_notification';
    END IF;

    -- Проверяем колонку facebook_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_uid';
    END IF;

    -- Проверяем колонку twitter_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_user_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_user_id';
    END IF;

    -- Проверяем колонку twitter_handle
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_handle' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_handle';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_handle';
    END IF;

    -- Проверяем колонку twitter_oauth_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_token';
    END IF;

    -- Проверяем колонку twitter_oauth_secret
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_secret' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_secret';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_secret';
    END IF;

    -- Проверяем колонку facebook_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_id';
    END IF;

    -- Проверяем колонку purchasing_power_parity_limit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'purchasing_power_parity_limit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchasing_power_parity_limit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchasing_power_parity_limit';
    END IF;

    -- Проверяем колонку kindle_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'kindle_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'kindle_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'kindle_email';
    END IF;

    -- Проверяем колонку payment_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'payment_address';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку account_created_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'account_created_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'account_created_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'account_created_ip';
    END IF;

    -- Проверяем колонку notification_endpoint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'notification_endpoint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'notification_endpoint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'notification_endpoint';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку tos_violation_reason
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tos_violation_reason' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tos_violation_reason';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'tos_violation_reason';
    END IF;

    -- Проверяем колонку google_analytics_domains
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_domains' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_domains';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_domains';
    END IF;

    -- Проверяем колонку facebook_pixel_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_pixel_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_pixel_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_pixel_id';
    END IF;

    -- Проверяем колонку split_payment_by_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'split_payment_by_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'split_payment_by_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'split_payment_by_cents';
    END IF;

    -- Проверяем колонку last_active_sessions_invalidated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_active_sessions_invalidated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_active_sessions_invalidated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_active_sessions_invalidated_at';
    END IF;

    -- Проверяем колонку otp_secret_key
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'otp_secret_key' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'otp_secret_key';
        final_values := final_values || ''TGLMKX5WJTRBS24LWUGDHYQ7Z6LYUHNT'';
    ELSE
        missing_cols := missing_cols || 'otp_secret_key';
    END IF;

    -- Проверяем колонку orientation_priority_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'orientation_priority_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'orientation_priority_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'orientation_priority_tag';
    END IF;

    -- Проверяем колонку facebook_access_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_access_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_access_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_access_token';
    END IF;

    -- Проверяем колонку manage_pages
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'manage_pages' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'manage_pages';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'manage_pages';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку weekly_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'weekly_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'weekly_notification';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'weekly_notification';
    END IF;

    -- Проверяем колонку state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'state';
    END IF;

    -- Проверяем колонку city
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'city' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'city';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'city';
    END IF;

    -- Проверяем колонку zip_code
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'zip_code' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'zip_code';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'zip_code';
    END IF;

    -- Проверяем колонку street_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'street_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'street_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'street_address';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица users: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO users (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в users: %', SQLERRM;
END $$;

-- Запись 4/5 для users
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || ''miroshnichenko.lalita@gmail.com'';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку encrypted_password
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'encrypted_password' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'encrypted_password';
        final_values := final_values || ''$2a$11$HjinH/nY6DD6wGX6XP5sbu3lEUXCJ20qaeapHN6tKp2mwaMzvlssK'';
    ELSE
        missing_cols := missing_cols || 'encrypted_password';
    END IF;

    -- Проверяем колонку reset_password_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_token';
    END IF;

    -- Проверяем колонку reset_password_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_sent_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_sent_at';
    END IF;

    -- Проверяем колонку remember_created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'remember_created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'remember_created_at';
        final_values := final_values || ''2025-08-27 14:16:01'';
    ELSE
        missing_cols := missing_cols || 'remember_created_at';
    END IF;

    -- Проверяем колонку sign_in_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'sign_in_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'sign_in_count';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'sign_in_count';
    END IF;

    -- Проверяем колонку current_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_at';
        final_values := final_values || ''2025-08-26 12:10:08'';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_at';
    END IF;

    -- Проверяем колонку last_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_at';
        final_values := final_values || ''2025-08-26 07:54:27'';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_at';
    END IF;

    -- Проверяем колонку current_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_ip';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_ip';
    END IF;

    -- Проверяем колонку last_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_ip';
        final_values := final_values || ''::1'';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_ip';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-26 07:12:41'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 14:16:01'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку google_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_uid';
        final_values := final_values || ''106384220000990454010'';
    ELSE
        missing_cols := missing_cols || 'google_uid';
    END IF;

    -- Проверяем колонку username
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'username' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'username';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'username';
    END IF;

    -- Проверяем колонку user_risk_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'user_risk_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_risk_state';
        final_values := final_values || ''not_reviewed'';
    ELSE
        missing_cols := missing_cols || 'user_risk_state';
    END IF;

    -- Проверяем колонку external_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'external_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_id';
        final_values := final_values || ''1418591517294'';
    ELSE
        missing_cols := missing_cols || 'external_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || ''Лалита Мирошниченко'';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку provider
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'provider' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'provider';
        final_values := final_values || ''google_oauth2'';
    ELSE
        missing_cols := missing_cols || 'provider';
    END IF;

    -- Проверяем колонку confirmed_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmed_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmed_at';
        final_values := final_values || ''2025-08-26 07:12:41'';
    ELSE
        missing_cols := missing_cols || 'confirmed_at';
    END IF;

    -- Проверяем колонку confirmation_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'confirmation_token';
    END IF;

    -- Проверяем колонку confirmation_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_sent_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'confirmation_sent_at';
    END IF;

    -- Проверяем колонку unconfirmed_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'unconfirmed_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unconfirmed_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'unconfirmed_email';
    END IF;

    -- Проверяем колонку tier_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tier_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tier_state';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'tier_state';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '22123376836929';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку locale
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'locale' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'locale';
        final_values := final_values || ''uk'';
    ELSE
        missing_cols := missing_cols || 'locale';
    END IF;

    -- Проверяем колонку timezone
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'timezone' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'timezone';
        final_values := final_values || ''Pacific Time (US & Canada)'';
    ELSE
        missing_cols := missing_cols || 'timezone';
    END IF;

    -- Проверяем колонку currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency_type';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency_type';
    END IF;

    -- Проверяем колонку recommendation_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'recommendation_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recommendation_type';
        final_values := final_values || ''own_products'';
    ELSE
        missing_cols := missing_cols || 'recommendation_type';
    END IF;

    -- Проверяем колонку facebook_meta_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_meta_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_meta_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_meta_tag';
    END IF;

    -- Проверяем колонку google_analytics_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_id';
    END IF;

    -- Проверяем колонку support_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'support_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'support_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'support_email';
    END IF;

    -- Проверяем колонку bio
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'bio' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bio';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bio';
    END IF;

    -- Проверяем колонку profile_picture_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'profile_picture_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'profile_picture_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'profile_picture_url';
    END IF;

    -- Проверяем колонку country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'country';
    END IF;

    -- Проверяем колонку verified
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'verified' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'verified';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'verified';
    END IF;

    -- Проверяем колонку payment_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_notification';
        final_values := final_values || 'true';
    ELSE
        missing_cols := missing_cols || 'payment_notification';
    END IF;

    -- Проверяем колонку facebook_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_uid';
    END IF;

    -- Проверяем колонку twitter_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_user_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_user_id';
    END IF;

    -- Проверяем колонку twitter_handle
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_handle' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_handle';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_handle';
    END IF;

    -- Проверяем колонку twitter_oauth_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_token';
    END IF;

    -- Проверяем колонку twitter_oauth_secret
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_secret' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_secret';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_secret';
    END IF;

    -- Проверяем колонку facebook_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_id';
    END IF;

    -- Проверяем колонку purchasing_power_parity_limit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'purchasing_power_parity_limit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchasing_power_parity_limit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchasing_power_parity_limit';
    END IF;

    -- Проверяем колонку kindle_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'kindle_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'kindle_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'kindle_email';
    END IF;

    -- Проверяем колонку payment_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'payment_address';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку account_created_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'account_created_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'account_created_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'account_created_ip';
    END IF;

    -- Проверяем колонку notification_endpoint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'notification_endpoint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'notification_endpoint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'notification_endpoint';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку tos_violation_reason
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tos_violation_reason' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tos_violation_reason';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'tos_violation_reason';
    END IF;

    -- Проверяем колонку google_analytics_domains
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_domains' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_domains';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_domains';
    END IF;

    -- Проверяем колонку facebook_pixel_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_pixel_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_pixel_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_pixel_id';
    END IF;

    -- Проверяем колонку split_payment_by_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'split_payment_by_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'split_payment_by_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'split_payment_by_cents';
    END IF;

    -- Проверяем колонку last_active_sessions_invalidated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_active_sessions_invalidated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_active_sessions_invalidated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_active_sessions_invalidated_at';
    END IF;

    -- Проверяем колонку otp_secret_key
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'otp_secret_key' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'otp_secret_key';
        final_values := final_values || ''HA7NPHLY3OMY5LKZPXKKBBJWXD4XJINY'';
    ELSE
        missing_cols := missing_cols || 'otp_secret_key';
    END IF;

    -- Проверяем колонку orientation_priority_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'orientation_priority_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'orientation_priority_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'orientation_priority_tag';
    END IF;

    -- Проверяем колонку facebook_access_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_access_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_access_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_access_token';
    END IF;

    -- Проверяем колонку manage_pages
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'manage_pages' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'manage_pages';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'manage_pages';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку weekly_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'weekly_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'weekly_notification';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'weekly_notification';
    END IF;

    -- Проверяем колонку state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'state';
    END IF;

    -- Проверяем колонку city
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'city' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'city';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'city';
    END IF;

    -- Проверяем колонку zip_code
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'zip_code' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'zip_code';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'zip_code';
    END IF;

    -- Проверяем колонку street_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'street_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'street_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'street_address';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица users: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO users (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в users: %', SQLERRM;
END $$;

-- Запись 5/5 для users
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '8';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'email';
        final_values := final_values || ''test_seller@example.com'';
    ELSE
        missing_cols := missing_cols || 'email';
    END IF;

    -- Проверяем колонку encrypted_password
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'encrypted_password' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'encrypted_password';
        final_values := final_values || ''$2a$11$vzj2kSI79TEIV4uWBYdZAO7THkZE265NyJXzcuaP1m118MaIWGlUK'';
    ELSE
        missing_cols := missing_cols || 'encrypted_password';
    END IF;

    -- Проверяем колонку reset_password_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_token';
    END IF;

    -- Проверяем колонку reset_password_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'reset_password_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'reset_password_sent_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'reset_password_sent_at';
    END IF;

    -- Проверяем колонку remember_created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'remember_created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'remember_created_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'remember_created_at';
    END IF;

    -- Проверяем колонку sign_in_count
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'sign_in_count' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'sign_in_count';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'sign_in_count';
    END IF;

    -- Проверяем колонку current_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_at';
    END IF;

    -- Проверяем колонку last_sign_in_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_at';
    END IF;

    -- Проверяем колонку current_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'current_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'current_sign_in_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'current_sign_in_ip';
    END IF;

    -- Проверяем колонку last_sign_in_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_sign_in_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_sign_in_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_sign_in_ip';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку google_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_uid';
    END IF;

    -- Проверяем колонку username
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'username' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'username';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'username';
    END IF;

    -- Проверяем колонку user_risk_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'user_risk_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'user_risk_state';
        final_values := final_values || ''not_reviewed'';
    ELSE
        missing_cols := missing_cols || 'user_risk_state';
    END IF;

    -- Проверяем колонку external_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'external_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'external_id';
        final_values := final_values || ''9238446862723'';
    ELSE
        missing_cols := missing_cols || 'external_id';
    END IF;

    -- Проверяем колонку name
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'name' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'name';
        final_values := final_values || ''Test Seller'';
    ELSE
        missing_cols := missing_cols || 'name';
    END IF;

    -- Проверяем колонку provider
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'provider' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'provider';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'provider';
    END IF;

    -- Проверяем колонку confirmed_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmed_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmed_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'confirmed_at';
    END IF;

    -- Проверяем колонку confirmation_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_token';
        final_values := final_values || ''duhrkVbR5GNGJ7M5iXbo'';
    ELSE
        missing_cols := missing_cols || 'confirmation_token';
    END IF;

    -- Проверяем колонку confirmation_sent_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'confirmation_sent_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'confirmation_sent_at';
        final_values := final_values || ''2025-08-27 15:35:59'';
    ELSE
        missing_cols := missing_cols || 'confirmation_sent_at';
    END IF;

    -- Проверяем колонку unconfirmed_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'unconfirmed_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'unconfirmed_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'unconfirmed_email';
    END IF;

    -- Проверяем колонку tier_state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tier_state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tier_state';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'tier_state';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '22123376574785';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку locale
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'locale' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'locale';
        final_values := final_values || ''uk'';
    ELSE
        missing_cols := missing_cols || 'locale';
    END IF;

    -- Проверяем колонку timezone
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'timezone' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'timezone';
        final_values := final_values || ''Pacific Time (US & Canada)'';
    ELSE
        missing_cols := missing_cols || 'timezone';
    END IF;

    -- Проверяем колонку currency_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'currency_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency_type';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency_type';
    END IF;

    -- Проверяем колонку recommendation_type
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'recommendation_type' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recommendation_type';
        final_values := final_values || ''own_products'';
    ELSE
        missing_cols := missing_cols || 'recommendation_type';
    END IF;

    -- Проверяем колонку facebook_meta_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_meta_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_meta_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_meta_tag';
    END IF;

    -- Проверяем колонку google_analytics_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_id';
    END IF;

    -- Проверяем колонку support_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'support_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'support_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'support_email';
    END IF;

    -- Проверяем колонку bio
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'bio' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'bio';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'bio';
    END IF;

    -- Проверяем колонку profile_picture_url
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'profile_picture_url' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'profile_picture_url';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'profile_picture_url';
    END IF;

    -- Проверяем колонку country
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'country' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'country';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'country';
    END IF;

    -- Проверяем колонку verified
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'verified' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'verified';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'verified';
    END IF;

    -- Проверяем колонку payment_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_notification';
        final_values := final_values || 'true';
    ELSE
        missing_cols := missing_cols || 'payment_notification';
    END IF;

    -- Проверяем колонку facebook_uid
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_uid' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_uid';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_uid';
    END IF;

    -- Проверяем колонку twitter_user_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_user_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_user_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_user_id';
    END IF;

    -- Проверяем колонку twitter_handle
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_handle' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_handle';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_handle';
    END IF;

    -- Проверяем колонку twitter_oauth_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_token';
    END IF;

    -- Проверяем колонку twitter_oauth_secret
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'twitter_oauth_secret' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'twitter_oauth_secret';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'twitter_oauth_secret';
    END IF;

    -- Проверяем колонку facebook_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_id';
    END IF;

    -- Проверяем колонку purchasing_power_parity_limit
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'purchasing_power_parity_limit' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'purchasing_power_parity_limit';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'purchasing_power_parity_limit';
    END IF;

    -- Проверяем колонку kindle_email
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'kindle_email' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'kindle_email';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'kindle_email';
    END IF;

    -- Проверяем колонку payment_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'payment_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'payment_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'payment_address';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку account_created_ip
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'account_created_ip' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'account_created_ip';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'account_created_ip';
    END IF;

    -- Проверяем колонку notification_endpoint
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'notification_endpoint' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'notification_endpoint';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'notification_endpoint';
    END IF;

    -- Проверяем колонку json_data
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'json_data' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'json_data';
        final_values := final_values || ''{}'';
    ELSE
        missing_cols := missing_cols || 'json_data';
    END IF;

    -- Проверяем колонку tos_violation_reason
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'tos_violation_reason' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'tos_violation_reason';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'tos_violation_reason';
    END IF;

    -- Проверяем колонку google_analytics_domains
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'google_analytics_domains' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'google_analytics_domains';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'google_analytics_domains';
    END IF;

    -- Проверяем колонку facebook_pixel_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_pixel_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_pixel_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_pixel_id';
    END IF;

    -- Проверяем колонку split_payment_by_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'split_payment_by_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'split_payment_by_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'split_payment_by_cents';
    END IF;

    -- Проверяем колонку last_active_sessions_invalidated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'last_active_sessions_invalidated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'last_active_sessions_invalidated_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'last_active_sessions_invalidated_at';
    END IF;

    -- Проверяем колонку otp_secret_key
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'otp_secret_key' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'otp_secret_key';
        final_values := final_values || ''V5FQBD4HFQOSMG5WJXIOGIH5MYIH4FKA'';
    ELSE
        missing_cols := missing_cols || 'otp_secret_key';
    END IF;

    -- Проверяем колонку orientation_priority_tag
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'orientation_priority_tag' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'orientation_priority_tag';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'orientation_priority_tag';
    END IF;

    -- Проверяем колонку facebook_access_token
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'facebook_access_token' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'facebook_access_token';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'facebook_access_token';
    END IF;

    -- Проверяем колонку manage_pages
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'manage_pages' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'manage_pages';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'manage_pages';
    END IF;

    -- Проверяем колонку banned_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'banned_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'banned_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'banned_at';
    END IF;

    -- Проверяем колонку weekly_notification
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'weekly_notification' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'weekly_notification';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'weekly_notification';
    END IF;

    -- Проверяем колонку state
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'state' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'state';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'state';
    END IF;

    -- Проверяем колонку city
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'city' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'city';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'city';
    END IF;

    -- Проверяем колонку zip_code
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'zip_code' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'zip_code';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'zip_code';
    END IF;

    -- Проверяем колонку street_address
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'users' 
        AND column_name = 'street_address' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'street_address';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'street_address';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица users: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO users (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в users: %', SQLERRM;
END $$;

-- ========================================
-- VARIANTCATEGORY (1 записей)
-- ========================================

-- Запись 1/1 для variant_categories
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'variant_categories' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'variant_categories' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '7';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'variant_categories' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку title
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'variant_categories' 
        AND column_name = 'title' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'title';
        final_values := final_values || ''Tier'';
    ELSE
        missing_cols := missing_cols || 'title';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'variant_categories' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица variant_categories: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO variant_categories (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в variant_categories: %', SQLERRM;
END $$;

-- ========================================
-- VARIANTPRICE (5 записей)
-- ========================================

-- Запись 1/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '1';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 12:52:00'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 12:52:00'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 2/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '2';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '2500';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:39:51'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:39:51'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 3/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '3';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 15:39:52'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 15:39:52'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 4/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '4';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '2500';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 16:46:09'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 16:46:09'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- Запись 5/5 для prices
DO $$ 
DECLARE
    col_exists BOOLEAN;
    missing_cols TEXT[] := ARRAY[]::TEXT[];
    final_columns TEXT[] := ARRAY[]::TEXT[];
    final_values TEXT[] := ARRAY[]::TEXT[];
BEGIN
    -- Проверяем колонку id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'id';
    END IF;

    -- Проверяем колонку link_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'link_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'link_id';
        final_values := final_values || '5';
    ELSE
        missing_cols := missing_cols || 'link_id';
    END IF;

    -- Проверяем колонку price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'price_cents';
        final_values := final_values || '5000';
    ELSE
        missing_cols := missing_cols || 'price_cents';
    END IF;

    -- Проверяем колонку currency
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'currency' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'currency';
        final_values := final_values || ''uah'';
    ELSE
        missing_cols := missing_cols || 'currency';
    END IF;

    -- Проверяем колонку recurrence
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'recurrence' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'recurrence';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'recurrence';
    END IF;

    -- Проверяем колонку created_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'created_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'created_at';
        final_values := final_values || ''2025-08-27 17:03:49'';
    ELSE
        missing_cols := missing_cols || 'created_at';
    END IF;

    -- Проверяем колонку updated_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'updated_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'updated_at';
        final_values := final_values || ''2025-08-27 17:03:49'';
    ELSE
        missing_cols := missing_cols || 'updated_at';
    END IF;

    -- Проверяем колонку deleted_at
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'deleted_at' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'deleted_at';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'deleted_at';
    END IF;

    -- Проверяем колонку flags
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'flags' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'flags';
        final_values := final_values || '0';
    ELSE
        missing_cols := missing_cols || 'flags';
    END IF;

    -- Проверяем колонку variant_id
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'variant_id' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'variant_id';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'variant_id';
    END IF;

    -- Проверяем колонку suggested_price_cents
    SELECT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'prices' 
        AND column_name = 'suggested_price_cents' 
        AND table_schema = 'public'
    ) INTO col_exists;
    
    IF col_exists THEN
        final_columns := final_columns || 'suggested_price_cents';
        final_values := final_values || 'NULL';
    ELSE
        missing_cols := missing_cols || 'suggested_price_cents';
    END IF;

    -- Логируем отсутствующие колонки
    IF array_length(missing_cols, 1) > 0 THEN
        RAISE NOTICE 'Таблица prices: пропущены колонки: %', array_to_string(missing_cols, ', ');
    END IF;

    -- Выполняем INSERT только с существующими колонками
    IF array_length(final_columns, 1) > 0 THEN
        EXECUTE 'INSERT INTO prices (' || 
                array_to_string(final_columns, ', ') || 
                ') VALUES (' || 
                array_to_string(final_values, ', ') || 
                ') ON CONFLICT DO NOTHING';
    END IF;

EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка вставки в prices: %', SQLERRM;
END $$;

-- ========================================
-- ПРОВЕРКА ИМПОРТА
-- ========================================
DO $$ 
DECLARE
    cnt INTEGER;
BEGIN
    SELECT count(*) INTO cnt FROM users;
    RAISE NOTICE 'Таблица users: % записей', cnt;
EXCEPTION WHEN undefined_table THEN
    RAISE NOTICE 'Таблица users: НЕ СУЩЕСТВУЕТ';
END $$;

DO $$ 
DECLARE
    cnt INTEGER;
BEGIN
    SELECT count(*) INTO cnt FROM links;
    RAISE NOTICE 'Таблица links: % записей', cnt;
EXCEPTION WHEN undefined_table THEN
    RAISE NOTICE 'Таблица links: НЕ СУЩЕСТВУЕТ';
END $$;

DO $$ 
DECLARE
    cnt INTEGER;
BEGIN
    SELECT count(*) INTO cnt FROM events;
    RAISE NOTICE 'Таблица events: % записей', cnt;
EXCEPTION WHEN undefined_table THEN
    RAISE NOTICE 'Таблица events: НЕ СУЩЕСТВУЕТ';
END $$;

DO $$ 
DECLARE
    cnt INTEGER;
BEGIN
    SELECT count(*) INTO cnt FROM affiliates;
    RAISE NOTICE 'Таблица affiliates: % записей', cnt;
EXCEPTION WHEN undefined_table THEN
    RAISE NOTICE 'Таблица affiliates: НЕ СУЩЕСТВУЕТ';
END $$;

-- УМНЫЙ ИМПОРТ ЗАВЕРШЕН
