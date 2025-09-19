-- ========================================
-- ПРЯМОЕ ТЕСТИРОВАНИЕ ТАБЛИЦ ЧЕРЕЗ SQL
-- Проверим создание записей напрямую в SQL Editor
-- ========================================

-- Проверим текущий статус RLS
SELECT 
    schemaname,
    tablename,
    CASE 
        WHEN rowsecurity THEN '🔒 RLS Enabled' 
        ELSE '🔓 RLS Disabled' 
    END as rls_status
FROM pg_tables 
WHERE schemaname = 'public' 
    AND tablename IN ('users', 'products', 'purchases', 'product_files', 'comments')
ORDER BY tablename;

-- Попробуем создать тестового пользователя напрямую
INSERT INTO users (email, name, username, created_at, updated_at) 
VALUES (
    'test_direct_' || extract(epoch from now()) || '@example.com',
    'Direct Test User',
    'direct_user_' || extract(epoch from now()),
    NOW(),
    NOW()
) RETURNING id, email, name, username;

-- Проверим количество пользователей
SELECT COUNT(*) as total_users FROM users;

-- Попробуем создать тестовый продукт
INSERT INTO products (name, description, price_cents, published, created_at, updated_at)
VALUES (
    'Test Product ' || extract(epoch from now()),
    'Test product created directly in SQL',
    999,
    false,
    NOW(),
    NOW()
) RETURNING id, name, price_cents;

-- Проверим количество продуктов
SELECT COUNT(*) as total_products FROM products;

-- Покажем все таблицы и их размеры
SELECT 
    table_name,
    (xpath('/row/c/text()', query_to_xml(format('select count(*) as c from %I.%I', table_schema, table_name), false, true, '')))[1]::text::int AS row_count
FROM information_schema.tables 
WHERE table_schema = 'public' 
    AND table_type = 'BASE TABLE'
    AND table_name IN ('users', 'products', 'purchases', 'product_files', 'comments')
ORDER BY table_name;

-- Финальное сообщение
SELECT '✅ Прямые SQL операции выполнены. Если записи создались - таблицы работают!' as result;