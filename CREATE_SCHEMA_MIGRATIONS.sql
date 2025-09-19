-- ========================================
-- СОЗДАНИЕ ТАБЛИЦЫ SCHEMA_MIGRATIONS
-- Чтобы Rails не пытался применять все локальные миграции
-- ========================================

-- Создаем таблицу schema_migrations (стандартная таблица Rails)
CREATE TABLE IF NOT EXISTS schema_migrations (
    version VARCHAR(255) NOT NULL PRIMARY KEY
);

-- Создаем таблицу ar_internal_metadata (тоже нужна Rails)
CREATE TABLE IF NOT EXISTS ar_internal_metadata (
    key VARCHAR(255) NOT NULL PRIMARY KEY,
    value VARCHAR(255),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- Добавляем запись о том, что база данных "готова"
-- Это говорит Rails что база инициализирована
INSERT INTO ar_internal_metadata (key, value, created_at, updated_at) 
VALUES (
    'environment', 
    'development',
    NOW(),
    NOW()
) ON CONFLICT (key) DO UPDATE SET 
    value = EXCLUDED.value,
    updated_at = NOW();

-- Помечаем все наши Supabase миграции как "выполненные"
-- Чтобы Rails не пытался их применять
INSERT INTO schema_migrations (version) VALUES 
('20250820000001'),  -- initial_schema
('20250825000001'),  -- create_core_tables  
('20250825000002'),  -- add_supabase_user_id
('20250825000003')   -- enhanced_rls_policies
ON CONFLICT (version) DO NOTHING;

-- Проверяем что создалось
SELECT 'schema_migrations' as table_name, COUNT(*) as records FROM schema_migrations
UNION ALL
SELECT 'ar_internal_metadata' as table_name, COUNT(*) as records FROM ar_internal_metadata;

SELECT '✅ Schema migrations таблица создана. Rails должен теперь запуститься!' as result;