-- ОТКЛЮЧЕНИЕ RLS ПОЛИТИК ДЛЯ DEVELOPMENT
-- Row Level Security блокирует доступ к данным
-- Для development окружения можно отключить

SET client_min_messages TO WARNING;

-- ================================== 
-- ОТКЛЮЧЕНИЕ RLS ДЛЯ ОСНОВНЫХ ТАБЛИЦ
-- ==================================

-- Отключаем RLS для таблицы users
DO $$ BEGIN
    ALTER TABLE users DISABLE ROW LEVEL SECURITY;
    RAISE NOTICE 'RLS отключен для users';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка отключения RLS для users: %', SQLERRM;
END $$;

-- Отключаем RLS для таблицы links
DO $$ BEGIN
    ALTER TABLE links DISABLE ROW LEVEL SECURITY;
    RAISE NOTICE 'RLS отключен для links';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка отключения RLS для links: %', SQLERRM;
END $$;

-- Отключаем RLS для таблицы affiliates
DO $$ BEGIN
    ALTER TABLE affiliates DISABLE ROW LEVEL SECURITY;
    RAISE NOTICE 'RLS отключен для affiliates';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка отключения RLS для affiliates: %', SQLERRM;
END $$;

-- Отключаем RLS для таблицы events
DO $$ BEGIN
    ALTER TABLE events DISABLE ROW LEVEL SECURITY;
    RAISE NOTICE 'RLS отключен для events';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка отключения RLS для events: %', SQLERRM;
END $$;

-- Отключаем RLS для таблицы prices
DO $$ BEGIN
    ALTER TABLE prices DISABLE ROW LEVEL SECURITY;
    RAISE NOTICE 'RLS отключен для prices';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка отключения RLS для prices: %', SQLERRM;
END $$;

-- Отключаем RLS для таблицы refund_policies
DO $$ BEGIN
    ALTER TABLE refund_policies DISABLE ROW LEVEL SECURITY;
    RAISE NOTICE 'RLS отключен для refund_policies';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка отключения RLS для refund_policies: %', SQLERRM;
END $$;

-- Отключаем RLS для таблицы variant_categories
DO $$ BEGIN
    ALTER TABLE variant_categories DISABLE ROW LEVEL SECURITY;
    RAISE NOTICE 'RLS отключен для variant_categories';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка отключения RLS для variant_categories: %', SQLERRM;
END $$;

-- ================================== 
-- ОТКЛЮЧЕНИЕ RLS ДЛЯ ВСЕХ ОСТАЛЬНЫХ ТАБЛИЦ
-- ==================================

-- Получаем список всех таблиц и отключаем RLS
DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT tablename 
        FROM pg_tables 
        WHERE schemaname = 'public' 
        AND tablename NOT IN ('users', 'links', 'affiliates', 'events', 'prices', 'refund_policies', 'variant_categories')
    LOOP
        BEGIN
            EXECUTE 'ALTER TABLE ' || table_record.tablename || ' DISABLE ROW LEVEL SECURITY';
            RAISE NOTICE 'RLS отключен для %', table_record.tablename;
        EXCEPTION WHEN others THEN
            RAISE NOTICE 'Ошибка отключения RLS для %: %', table_record.tablename, SQLERRM;
        END;
    END LOOP;
END $$;

-- ================================== 
-- УДАЛЕНИЕ СУЩЕСТВУЮЩИХ RLS ПОЛИТИК
-- ==================================

-- Удаляем все существующие политики
DO $$
DECLARE
    policy_record RECORD;
BEGIN
    FOR policy_record IN 
        SELECT schemaname, tablename, policyname 
        FROM pg_policies 
        WHERE schemaname = 'public'
    LOOP
        BEGIN
            EXECUTE 'DROP POLICY IF EXISTS ' || policy_record.policyname || ' ON ' || policy_record.tablename;
            RAISE NOTICE 'Удалена политика % для %', policy_record.policyname, policy_record.tablename;
        EXCEPTION WHEN others THEN
            RAISE NOTICE 'Ошибка удаления политики % для %: %', policy_record.policyname, policy_record.tablename, SQLERRM;
        END;
    END LOOP;
END $$;

-- ================================== 
-- ПРОВЕРКА РЕЗУЛЬТАТОВ
-- ==================================

-- Показываем таблицы с включенным RLS
SELECT 
    tablename,
    rowsecurity as rls_enabled
FROM pg_tables t
JOIN pg_class c ON c.relname = t.tablename
WHERE t.schemaname = 'public'
  AND c.relrowsecurity = true
ORDER BY tablename;

SELECT 'Таблиц с активным RLS:' as info, count(*) as count
FROM pg_tables t
JOIN pg_class c ON c.relname = t.tablename
WHERE t.schemaname = 'public'
  AND c.relrowsecurity = true;

-- Показываем оставшиеся политики
SELECT 
    schemaname,
    tablename,
    policyname,
    cmd as command
FROM pg_policies 
WHERE schemaname = 'public'
ORDER BY tablename, policyname;

-- RLS ПОЛИТИКИ ОТКЛЮЧЕНЫ