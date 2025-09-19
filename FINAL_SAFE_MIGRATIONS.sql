-- ========================================
-- ФИНАЛЬНЫЕ БЕЗОПАСНЫЕ МИГРАЦИИ ДЛЯ SUPABASE
-- Исправлены все проблемы с синтаксисом
-- ========================================

-- ========================================  
-- STEP 1: Active Storage Tables
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

CREATE UNIQUE INDEX IF NOT EXISTS index_active_storage_blobs_on_key ON active_storage_blobs (key);

CREATE TABLE IF NOT EXISTS active_storage_attachments (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(191) NOT NULL,
  record_type VARCHAR(191) NOT NULL,
  record_id BIGINT NOT NULL,
  blob_id BIGINT NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

CREATE INDEX IF NOT EXISTS index_active_storage_attachments_on_blob_id ON active_storage_attachments (blob_id);
CREATE UNIQUE INDEX IF NOT EXISTS index_active_storage_attachments_uniqueness ON active_storage_attachments (record_type, record_id, name, blob_id);

CREATE TABLE IF NOT EXISTS active_storage_variant_records (
  id BIGSERIAL PRIMARY KEY,
  blob_id BIGINT NOT NULL,
  variation_digest VARCHAR NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS index_active_storage_variant_records_uniqueness ON active_storage_variant_records (blob_id, variation_digest);

-- ========================================  
-- STEP 2: Users Table (безопасное создание/обновление)
-- ========================================

-- Создаем базовую таблицу users если не существует
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Исправленная функция для добавления колонок
CREATE OR REPLACE FUNCTION safe_add_column(
    tbl_name text,
    col_name text,
    col_type text
) RETURNS void AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public'
        AND table_name = tbl_name 
        AND column_name = col_name
    ) THEN
        EXECUTE format('ALTER TABLE %I ADD COLUMN %I %s', tbl_name, col_name, col_type);
        RAISE NOTICE 'Added column %.% %', tbl_name, col_name, col_type;
    ELSE
        RAISE NOTICE 'Column %.% already exists', tbl_name, col_name;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Добавляем все колонки users безопасно
SELECT safe_add_column('users', 'encrypted_password', 'VARCHAR(255) DEFAULT ''''');
SELECT safe_add_column('users', 'reset_password_token', 'VARCHAR(255)');
SELECT safe_add_column('users', 'reset_password_sent_at', 'TIMESTAMP WITH TIME ZONE');
SELECT safe_add_column('users', 'remember_created_at', 'TIMESTAMP WITH TIME ZONE');
SELECT safe_add_column('users', 'sign_in_count', 'INTEGER DEFAULT 0');
SELECT safe_add_column('users', 'current_sign_in_at', 'TIMESTAMP WITH TIME ZONE');
SELECT safe_add_column('users', 'last_sign_in_at', 'TIMESTAMP WITH TIME ZONE');
SELECT safe_add_column('users', 'current_sign_in_ip', 'VARCHAR(255)');
SELECT safe_add_column('users', 'last_sign_in_ip', 'VARCHAR(255)');
SELECT safe_add_column('users', 'confirmation_token', 'VARCHAR(255)');
SELECT safe_add_column('users', 'confirmed_at', 'TIMESTAMP WITH TIME ZONE');
SELECT safe_add_column('users', 'confirmation_sent_at', 'TIMESTAMP WITH TIME ZONE');
SELECT safe_add_column('users', 'unconfirmed_email', 'VARCHAR(255)');
SELECT safe_add_column('users', 'failed_attempts', 'INTEGER DEFAULT 0');
SELECT safe_add_column('users', 'unlock_token', 'VARCHAR(255)');
SELECT safe_add_column('users', 'locked_at', 'TIMESTAMP WITH TIME ZONE');
SELECT safe_add_column('users', 'name', 'VARCHAR(255)');
SELECT safe_add_column('users', 'username', 'VARCHAR(255)');
SELECT safe_add_column('users', 'bio', 'TEXT');
SELECT safe_add_column('users', 'website', 'VARCHAR(255)');
SELECT safe_add_column('users', 'profile_image_url', 'VARCHAR(500)');
SELECT safe_add_column('users', 'supabase_user_id', 'UUID');
SELECT safe_add_column('users', 'deleted_at', 'TIMESTAMP WITH TIME ZONE');

-- Создаем индексы для users
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_email ON users (email);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_username ON users (username);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_supabase_user_id ON users (supabase_user_id);
CREATE INDEX IF NOT EXISTS index_users_on_deleted_at ON users (deleted_at);

-- ========================================  
-- STEP 3: Products Table
-- ========================================

CREATE TABLE IF NOT EXISTS products (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price_cents INTEGER DEFAULT 0 NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD' NOT NULL,
    published BOOLEAN DEFAULT false NOT NULL,
    permalink VARCHAR(255),
    preview_text TEXT,
    tags TEXT[] DEFAULT '{}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE INDEX IF NOT EXISTS index_products_on_user_id ON products (user_id);
CREATE UNIQUE INDEX IF NOT EXISTS index_products_on_permalink ON products (permalink);
CREATE INDEX IF NOT EXISTS index_products_on_published ON products (published);
CREATE INDEX IF NOT EXISTS index_products_on_created_at ON products (created_at);

-- ========================================  
-- STEP 4: Purchases Table
-- ========================================

CREATE TABLE IF NOT EXISTS purchases (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    user_id BIGINT,
    customer_email VARCHAR(255) NOT NULL,
    price_cents INTEGER DEFAULT 0 NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD' NOT NULL,
    purchase_token VARCHAR(255) NOT NULL,
    status VARCHAR(50) DEFAULT 'completed' NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE INDEX IF NOT EXISTS index_purchases_on_product_id ON purchases (product_id);
CREATE INDEX IF NOT EXISTS index_purchases_on_user_id ON purchases (user_id);
CREATE INDEX IF NOT EXISTS index_purchases_on_customer_email ON purchases (customer_email);
CREATE INDEX IF NOT EXISTS index_purchases_on_created_at ON purchases (created_at);

-- Добавляем уникальный индекс безопасно
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_class c 
        JOIN pg_namespace n ON n.oid = c.relnamespace 
        WHERE c.relname = 'index_purchases_on_purchase_token' 
        AND n.nspname = 'public'
    ) THEN
        CREATE UNIQUE INDEX index_purchases_on_purchase_token ON purchases (purchase_token);
    END IF;
END $$;

-- ========================================  
-- STEP 5: Product Files Table
-- ========================================

CREATE TABLE IF NOT EXISTS product_files (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    file_size BIGINT,
    content_type VARCHAR(255),
    file_key VARCHAR(500),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE INDEX IF NOT EXISTS index_product_files_on_product_id ON product_files (product_id);

-- ========================================  
-- STEP 6: Comments Table
-- ========================================

CREATE TABLE IF NOT EXISTS comments (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    user_id BIGINT,
    author_name VARCHAR(255),
    author_email VARCHAR(255),
    content TEXT NOT NULL,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    published BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE INDEX IF NOT EXISTS index_comments_on_product_id ON comments (product_id);
CREATE INDEX IF NOT EXISTS index_comments_on_user_id ON comments (user_id);
CREATE INDEX IF NOT EXISTS index_comments_on_published ON comments (published);

-- ========================================
-- STEP 7: Updated At Triggers
-- ========================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Создаем триггеры безопасно
DO $$
BEGIN
    -- Users trigger
    IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'update_users_updated_at') THEN
        CREATE TRIGGER update_users_updated_at 
        BEFORE UPDATE ON users 
        FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
    END IF;
    
    -- Products trigger
    IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'update_products_updated_at') THEN
        CREATE TRIGGER update_products_updated_at 
        BEFORE UPDATE ON products 
        FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
    END IF;
    
    -- Purchases trigger
    IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'update_purchases_updated_at') THEN
        CREATE TRIGGER update_purchases_updated_at 
        BEFORE UPDATE ON purchases 
        FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
    END IF;
    
    -- Product files trigger
    IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'update_product_files_updated_at') THEN
        CREATE TRIGGER update_product_files_updated_at 
        BEFORE UPDATE ON product_files 
        FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
    END IF;
    
    -- Comments trigger
    IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'update_comments_updated_at') THEN
        CREATE TRIGGER update_comments_updated_at 
        BEFORE UPDATE ON comments 
        FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
    END IF;
END $$;

-- ========================================
-- STEP 8: Cleanup and Final Check
-- ========================================

-- Удаляем временную функцию
DROP FUNCTION IF EXISTS safe_add_column(text, text, text);

-- Финальная проверка всех таблиц
SELECT 
    t.table_name,
    (SELECT COUNT(*) FROM information_schema.columns c WHERE c.table_name = t.table_name AND c.table_schema = 'public') as columns_count,
    CASE 
        WHEN t.table_name = 'users' THEN '✅ Core table'
        WHEN t.table_name LIKE 'active_storage%' THEN '📎 File storage'
        WHEN t.table_name IN ('products', 'purchases', 'product_files', 'comments') THEN '🛒 Business logic'
        ELSE '📊 Other'
    END as category
FROM information_schema.tables t
WHERE t.table_schema = 'public' 
    AND t.table_name IN (
        'users', 'products', 'purchases', 'product_files', 'comments',
        'active_storage_blobs', 'active_storage_attachments', 'active_storage_variant_records'
    )
ORDER BY 
    CASE t.table_name
        WHEN 'users' THEN 1
        WHEN 'products' THEN 2
        WHEN 'purchases' THEN 3
        WHEN 'product_files' THEN 4
        WHEN 'comments' THEN 5
        ELSE 6
    END;

-- Проверка индексов
SELECT 
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes 
WHERE schemaname = 'public' 
    AND tablename IN ('users', 'products', 'purchases')
ORDER BY tablename, indexname;