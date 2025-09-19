-- ========================================
-- УПРОЩЕННЫЕ SUPABASE МИГРАЦИИ ДЛЯ DASHBOARD
-- Только основные таблицы без сложных политик RLS
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
-- MIGRATION 2: Core Gumroad Tables
-- ========================================

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    encrypted_password VARCHAR(255) DEFAULT '',
    reset_password_token VARCHAR(255),
    reset_password_sent_at TIMESTAMP WITH TIME ZONE,
    remember_created_at TIMESTAMP WITH TIME ZONE,
    sign_in_count INTEGER DEFAULT 0 NOT NULL,
    current_sign_in_at TIMESTAMP WITH TIME ZONE,
    last_sign_in_at TIMESTAMP WITH TIME ZONE,
    current_sign_in_ip VARCHAR(255),
    last_sign_in_ip VARCHAR(255),
    confirmation_token VARCHAR(255),
    confirmed_at TIMESTAMP WITH TIME ZONE,
    confirmation_sent_at TIMESTAMP WITH TIME ZONE,
    unconfirmed_email VARCHAR(255),
    failed_attempts INTEGER DEFAULT 0 NOT NULL,
    unlock_token VARCHAR(255),
    locked_at TIMESTAMP WITH TIME ZONE,
    name VARCHAR(255),
    username VARCHAR(255),
    bio TEXT,
    website VARCHAR(255),
    profile_image_url VARCHAR(500),
    supabase_user_id UUID,
    deleted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_email ON users (email);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_username ON users (username);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_supabase_user_id ON users (supabase_user_id);

-- Products table
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

-- Purchases table
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
CREATE UNIQUE INDEX IF NOT EXISTS index_purchases_on_purchase_token ON purchases (purchase_token);

-- Product files table
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

-- Comments table
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

-- ========================================
-- Успешно создано!
-- ========================================

-- Проверка созданных таблиц
SELECT 
    schemaname,
    tablename,
    'Created' as status
FROM pg_tables 
WHERE schemaname = 'public' 
    AND tablename IN ('users', 'products', 'purchases', 'product_files', 'comments', 'active_storage_blobs')
ORDER BY tablename;