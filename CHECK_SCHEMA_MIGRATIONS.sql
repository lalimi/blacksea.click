-- ========================================
-- ПРОВЕРИМ SCHEMA_MIGRATIONS ТАБЛИЦУ
-- ========================================

-- Проверим содержимое schema_migrations
SELECT COUNT(*) as total_migrations FROM schema_migrations;

-- Проверим последние несколько записей
SELECT version FROM schema_migrations 
ORDER BY version DESC 
LIMIT 10;

-- Проверим первые несколько записей
SELECT version FROM schema_migrations 
ORDER BY version ASC 
LIMIT 10;

-- Проверим есть ли наши Supabase миграции
SELECT version FROM schema_migrations 
WHERE version IN ('20250820000001', '20250825000001', '20250825000002', '20250825000003');

SELECT '✅ Проверка завершена' as status;