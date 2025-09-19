-- ========================================
-- БЕЗОПАСНЫЕ SUPABASE МИГРАЦИИ ДЛЯ DASHBOARD
-- Проверяют существование колонок и таблиц перед созданием
-- ========================================

-- ========================================  
-- MIGRATION 1: Active Storage Tables
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
-- MIGRATION 2: Core Users Table with Safe Column Addition
-- ========================================

-- Создаем таблицу users если не существует (с минимальными колонками)
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

-- Функция для безопасного добавления колонки
CREATE OR REPLACE FUNCTION add_column_if_not_exists(
    table_name text,
    column_name text,
    column_type text
) RETURNS void AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = table_name 
        AND column_name = column_name
    ) THEN
        EXECUTE format('ALTER TABLE %I ADD COLUMN %I %s', table_name, column_name, column_type);
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Добавляем все необходимые колонки безопасно
SELECT add_column_if_not_exists('users', 'encrypted_password', 'VARCHAR(255) DEFAULT ''''');
SELECT add_column_if_not_exists('users', 'reset_password_token', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'reset_password_sent_at', 'TIMESTAMP WITH TIME ZONE');
SELECT add_column_if_not_exists('users', 'remember_created_at', 'TIMESTAMP WITH TIME ZONE');
SELECT add_column_if_not_exists('users', 'sign_in_count', 'INTEGER DEFAULT 0 NOT NULL');
SELECT add_column_if_not_exists('users', 'current_sign_in_at', 'TIMESTAMP WITH TIME ZONE');
SELECT add_column_if_not_exists('users', 'last_sign_in_at', 'TIMESTAMP WITH TIME ZONE');
SELECT add_column_if_not_exists('users', 'current_sign_in_ip', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'last_sign_in_ip', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'confirmation_token', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'confirmed_at', 'TIMESTAMP WITH TIME ZONE');
SELECT add_column_if_not_exists('users', 'confirmation_sent_at', 'TIMESTAMP WITH TIME ZONE');
SELECT add_column_if_not_exists('users', 'unconfirmed_email', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'failed_attempts', 'INTEGER DEFAULT 0 NOT NULL');
SELECT add_column_if_not_exists('users', 'unlock_token', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'locked_at', 'TIMESTAMP WITH TIME ZONE');
SELECT add_column_if_not_exists('users', 'name', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'username', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'bio', 'TEXT');
SELECT add_column_if_not_exists('users', 'website', 'VARCHAR(255)');
SELECT add_column_if_not_exists('users', 'profile_image_url', 'VARCHAR(500)');
SELECT add_column_if_not_exists('users', 'supabase_user_id', 'UUID');
SELECT add_column_if_not_exists('users', 'deleted_at', 'TIMESTAMP WITH TIME ZONE');

-- Создаем индексы безопасно
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_email ON users (email);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_username ON users (username);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_supabase_user_id ON users (supabase_user_id);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_reset_password_token ON users (reset_password_token);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_confirmation_token ON users (confirmation_token);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_unlock_token ON users (unlock_token);

-- ========================================  
-- MIGRATION 3: Products Table
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
-- MIGRATION 4: Purchases Table
-- ========================================

CREATE TABLE IF NOT EXISTS purchases (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    user_id BIGINT,
    customer_email VARCHAR(255) NOT NULL,
    price_cents INTEGER DEFAULT 0 NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD' NOT NULL,
    purchase_token VARCHAR(255) UNIQUE NOT NULL,
    status VARCHAR(50) DEFAULT 'completed' NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE INDEX IF NOT EXISTS index_purchases_on_product_id ON purchases (product_id);
CREATE INDEX IF NOT EXISTS index_purchases_on_user_id ON purchases (user_id);
CREATE INDEX IF NOT EXISTS index_purchases_on_customer_email ON purchases (customer_email);
CREATE UNIQUE INDEX IF NOT EXISTS index_purchases_on_purchase_token ON purchases (purchase_token);
CREATE INDEX IF NOT EXISTS index_purchases_on_created_at ON purchases (created_at);

-- ========================================  
-- MIGRATION 5: Product Files Table
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
-- MIGRATION 6: Comments Table
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
-- MIGRATION 7: Updated At Trigger Function
-- ========================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Добавляем триггеры безопасно
DROP TRIGGER IF EXISTS update_users_updated_at ON users;
DROP TRIGGER IF EXISTS update_products_updated_at ON products;
DROP TRIGGER IF EXISTS update_purchases_updated_at ON purchases;
DROP TRIGGER IF EXISTS update_product_files_updated_at ON product_files;
DROP TRIGGER IF EXISTS update_comments_updated_at ON comments;

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_purchases_updated_at BEFORE UPDATE ON purchases FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_product_files_updated_at BEFORE UPDATE ON product_files FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_comments_updated_at BEFORE UPDATE ON comments FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ========================================
-- MIGRATION 8: Audit Log Table (optional)
-- ========================================

CREATE TABLE IF NOT EXISTS security_audit_log (
    id BIGSERIAL PRIMARY KEY,
    user_id UUID,
    action VARCHAR(100) NOT NULL,
    table_name VARCHAR(100) NOT NULL,
    record_id BIGINT,
    ip_address INET,
    user_agent TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE INDEX IF NOT EXISTS index_security_audit_log_on_user_id ON security_audit_log (user_id);
CREATE INDEX IF NOT EXISTS index_security_audit_log_on_created_at ON security_audit_log (created_at);
CREATE INDEX IF NOT EXISTS index_security_audit_log_on_action ON security_audit_log (action);

-- ========================================
-- ЗАВЕРШЕНИЕ: Проверка результатов
-- ========================================

-- Очистим временную функцию
DROP FUNCTION IF EXISTS add_column_if_not_exists(text, text, text);

-- Проверка всех созданных таблиц
SELECT 
    table_name,
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = t.table_name) as column_count,
    'Ready' as status
FROM information_schema.tables t
WHERE table_schema = 'public' 
    AND table_name IN (
        'users', 'products', 'purchases', 'product_files', 'comments', 
        'active_storage_blobs', 'active_storage_attachments', 'active_storage_variant_records',
        'security_audit_log'
    )
ORDER BY table_name;

-- Проверка колонок в таблице users
SELECT column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'users' 
    AND table_schema = 'public'
ORDER BY ordinal_position;