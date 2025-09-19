-- ИСПРАВЛЕНИЕ ПРАВ ДОСТУПА К ТАБЛИЦАМ
-- Предоставляем полные права для anon и service_role

SET client_min_messages TO WARNING;

-- ================================== 
-- ПРЕДОСТАВЛЕНИЕ ПРАВ ДЛЯ ANON РОЛИ
-- ==================================

-- Права на SELECT, INSERT, UPDATE, DELETE для всех таблиц
DO $$ 
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT tablename 
        FROM pg_tables 
        WHERE schemaname = 'public'
    LOOP
        BEGIN
            -- Даем все права anon роли
            EXECUTE 'GRANT ALL PRIVILEGES ON TABLE ' || table_record.tablename || ' TO anon';
            EXECUTE 'GRANT ALL PRIVILEGES ON TABLE ' || table_record.tablename || ' TO authenticated';
            EXECUTE 'GRANT ALL PRIVILEGES ON TABLE ' || table_record.tablename || ' TO service_role';
            
            RAISE NOTICE 'Права предоставлены для таблицы %', table_record.tablename;
        EXCEPTION WHEN others THEN
            RAISE NOTICE 'Ошибка предоставления прав для %: %', table_record.tablename, SQLERRM;
        END;
    END LOOP;
END $$;

-- ================================== 
-- ПРЕДОСТАВЛЕНИЕ ПРАВ НА SEQUENCES
-- ==================================

DO $$ 
DECLARE
    seq_record RECORD;
BEGIN
    FOR seq_record IN 
        SELECT sequencename 
        FROM pg_sequences 
        WHERE schemaname = 'public'
    LOOP
        BEGIN
            EXECUTE 'GRANT ALL PRIVILEGES ON SEQUENCE ' || seq_record.sequencename || ' TO anon';
            EXECUTE 'GRANT ALL PRIVILEGES ON SEQUENCE ' || seq_record.sequencename || ' TO authenticated';
            EXECUTE 'GRANT ALL PRIVILEGES ON SEQUENCE ' || seq_record.sequencename || ' TO service_role';
            
            RAISE NOTICE 'Права на sequence предоставлены для %', seq_record.sequencename;
        EXCEPTION WHEN others THEN
            RAISE NOTICE 'Ошибка прав sequence для %: %', seq_record.sequencename, SQLERRM;
        END;
    END LOOP;
END $$;

-- ================================== 
-- ОТКЛЮЧЕНИЕ RLS ЕЩЕ РАЗ
-- ==================================

DO $$ 
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT tablename 
        FROM pg_tables 
        WHERE schemaname = 'public'
    LOOP
        BEGIN
            EXECUTE 'ALTER TABLE ' || table_record.tablename || ' DISABLE ROW LEVEL SECURITY';
            RAISE NOTICE 'RLS отключен для %', table_record.tablename;
        EXCEPTION WHEN others THEN
            RAISE NOTICE 'RLS уже отключен для %', table_record.tablename;
        END;
    END LOOP;
END $$;

-- ================================== 
-- СОЗДАНИЕ БАЗОВЫХ ПОЛИТИК (НА ВСЯКИЙ СЛУЧАЙ)
-- ==================================

-- Если RLS все равно включится, создаем разрешающие политики
DO $$ 
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT tablename 
        FROM pg_tables 
        WHERE schemaname = 'public'
        AND tablename IN ('users', 'links', 'affiliates', 'events', 'prices')
    LOOP
        BEGIN
            -- Создаем политику разрешающую все операции для всех ролей
            EXECUTE 'CREATE POLICY allow_all_for_' || table_record.tablename || ' ON ' || table_record.tablename || ' FOR ALL USING (true) WITH CHECK (true)';
            RAISE NOTICE 'Создана разрешающая политика для %', table_record.tablename;
        EXCEPTION WHEN duplicate_object THEN
            RAISE NOTICE 'Политика для % уже существует', table_record.tablename;
        WHEN others THEN
            RAISE NOTICE 'Ошибка создания политики для %: %', table_record.tablename, SQLERRM;
        END;
    END LOOP;
END $$;

-- ================================== 
-- ПРОВЕРКА РЕЗУЛЬТАТОВ
-- ==================================

-- Проверяем права доступа
SELECT 
    grantee,
    table_name,
    privilege_type
FROM information_schema.table_privileges 
WHERE table_schema = 'public' 
  AND table_name IN ('users', 'links', 'affiliates')
  AND grantee IN ('anon', 'authenticated', 'service_role')
ORDER BY table_name, grantee;

-- ПРАВА ДОСТУПА НАСТРОЕНЫ