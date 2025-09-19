-- ========================================
-- ВРЕМЕННОЕ ОТКЛЮЧЕНИЕ RLS ДЛЯ ТЕСТИРОВАНИЯ
-- Это позволит тестировать таблицы через API
-- ========================================

-- Отключаем RLS на всех основных таблицах
ALTER TABLE IF EXISTS users DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS products DISABLE ROW LEVEL SECURITY;  
ALTER TABLE IF EXISTS purchases DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS product_files DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS comments DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS active_storage_blobs DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS active_storage_attachments DISABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS active_storage_variant_records DISABLE ROW LEVEL SECURITY;

-- Проверяем статус RLS
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

-- Финальное сообщение
SELECT '✅ RLS отключен для тестирования. Теперь можно тестировать CRUD операции!' as status;