-- ========================================
-- УЛЬТРА ПРОСТЫЕ МИГРАЦИИ ДЛЯ SUPABASE
-- Только таблицы без связей и сложной логики
-- ========================================

-- ========================================  
-- 1. Active Storage Blobs
-- ========================================
CREATE TABLE IF NOT EXISTS active_storage_blobs (
  id BIGSERIAL PRIMARY KEY,
  key VARCHAR(191) NOT NULL,
  filename VARCHAR(191) NOT NULL,
  content_type VARCHAR(191),
  metadata TEXT,
  byte_size BIGINT NOT NULL,
  checksum VARCHAR(191),
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  service_name VARCHAR NOT NULL
);

-- ========================================  
-- 2. Active Storage Attachments  
-- ========================================
CREATE TABLE IF NOT EXISTS active_storage_attachments (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(191) NOT NULL,
  record_type VARCHAR(191) NOT NULL,
  record_id BIGINT NOT NULL,
  blob_id BIGINT NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

-- ========================================  
-- 3. Active Storage Variant Records
-- ========================================
CREATE TABLE IF NOT EXISTS active_storage_variant_records (
  id BIGSERIAL PRIMARY KEY,
  blob_id BIGINT NOT NULL,
  variation_digest VARCHAR NOT NULL
);

-- ========================================  
-- 4. Users Table
-- ========================================
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    encrypted_password VARCHAR(255) DEFAULT '',
    name VARCHAR(255),
    username VARCHAR(255),
    bio TEXT,
    website VARCHAR(255),
    supabase_user_id UUID,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- ========================================  
-- 5. Products Table
-- ========================================
CREATE TABLE IF NOT EXISTS products (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price_cents INTEGER DEFAULT 0,
    currency VARCHAR(3) DEFAULT 'USD',
    published BOOLEAN DEFAULT false,
    permalink VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- ========================================  
-- 6. Purchases Table
-- ========================================
CREATE TABLE IF NOT EXISTS purchases (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT,
    user_id BIGINT,
    customer_email VARCHAR(255),
    price_cents INTEGER DEFAULT 0,
    currency VARCHAR(3) DEFAULT 'USD',
    purchase_token VARCHAR(255),
    status VARCHAR(50) DEFAULT 'completed',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- ========================================  
-- 7. Product Files Table
-- ========================================
CREATE TABLE IF NOT EXISTS product_files (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT,
    name VARCHAR(255),
    file_size BIGINT,
    content_type VARCHAR(255),
    file_key VARCHAR(500),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- ========================================  
-- 8. Comments Table
-- ========================================
CREATE TABLE IF NOT EXISTS comments (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT,
    user_id BIGINT,
    author_name VARCHAR(255),
    author_email VARCHAR(255),
    content TEXT,
    rating INTEGER,
    published BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- ========================================
-- 9. Базовые индексы (только уникальные)
-- ========================================

-- Users
CREATE UNIQUE INDEX IF NOT EXISTS idx_users_email ON users (email);
CREATE UNIQUE INDEX IF NOT EXISTS idx_users_username ON users (username) WHERE username IS NOT NULL;
CREATE UNIQUE INDEX IF NOT EXISTS idx_users_supabase_id ON users (supabase_user_id) WHERE supabase_user_id IS NOT NULL;

-- Active Storage
CREATE UNIQUE INDEX IF NOT EXISTS idx_blobs_key ON active_storage_blobs (key);

-- Products  
CREATE INDEX IF NOT EXISTS idx_products_user_id ON products (user_id) WHERE user_id IS NOT NULL;
CREATE UNIQUE INDEX IF NOT EXISTS idx_products_permalink ON products (permalink) WHERE permalink IS NOT NULL;

-- Purchases
CREATE INDEX IF NOT EXISTS idx_purchases_product_id ON purchases (product_id) WHERE product_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_purchases_user_id ON purchases (user_id) WHERE user_id IS NOT NULL;
CREATE UNIQUE INDEX IF NOT EXISTS idx_purchases_token ON purchases (purchase_token) WHERE purchase_token IS NOT NULL;

-- Product Files
CREATE INDEX IF NOT EXISTS idx_product_files_product_id ON product_files (product_id) WHERE product_id IS NOT NULL;

-- Comments
CREATE INDEX IF NOT EXISTS idx_comments_product_id ON comments (product_id) WHERE product_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_comments_user_id ON comments (user_id) WHERE user_id IS NOT NULL;

-- ========================================
-- 10. Проверка результата
-- ========================================

-- Список всех созданных таблиц
SELECT 
    table_name as "Table Name",
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = t.table_name AND table_schema = 'public') as "Columns"
FROM information_schema.tables t
WHERE table_schema = 'public' 
    AND table_type = 'BASE TABLE'
    AND table_name IN (
        'active_storage_blobs', 'active_storage_attachments', 'active_storage_variant_records',
        'users', 'products', 'purchases', 'product_files', 'comments'
    )
ORDER BY table_name;

-- Подсчет записей в каждой таблице  
SELECT 
    'active_storage_blobs' as table_name, 
    COUNT(*) as record_count 
FROM active_storage_blobs
UNION ALL
SELECT 'users', COUNT(*) FROM users
UNION ALL  
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'purchases', COUNT(*) FROM purchases
UNION ALL
SELECT 'product_files', COUNT(*) FROM product_files  
UNION ALL
SELECT 'comments', COUNT(*) FROM comments;

-- Финальное сообщение
SELECT '🎉 Все таблицы созданы успешно! Готово к тестированию.' as status;