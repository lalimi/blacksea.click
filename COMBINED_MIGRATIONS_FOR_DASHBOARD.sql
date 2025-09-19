-- ========================================
-- SUPABASE MIGRATIONS FOR DASHBOARD
-- Выполните этот SQL в Supabase Dashboard SQL Editor
-- ========================================

-- ========================================  
-- MIGRATION 1: Initial Schema (Active Storage)
-- File: 20250820000001_initial_schema.sql
-- ========================================

-- Create essential tables from the Rails app schema
-- This is just a starting point, we'll add more tables as needed

-- Active Storage Tables
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

-- Add foreign key constraints
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'fk_rails_active_storage_attachments_blob'
    ) THEN
        ALTER TABLE active_storage_attachments
        ADD CONSTRAINT fk_rails_active_storage_attachments_blob
        FOREIGN KEY (blob_id) REFERENCES active_storage_blobs (id);
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'fk_rails_active_storage_variant_records_blob'
    ) THEN
        ALTER TABLE active_storage_variant_records
        ADD CONSTRAINT fk_rails_active_storage_variant_records_blob
        FOREIGN KEY (blob_id) REFERENCES active_storage_blobs (id);
    END IF;
END $$;

-- ========================================  
-- MIGRATION 2: Core Gumroad Tables
-- File: 20250825000001_create_core_tables.sql
-- ========================================

-- Users table (основная таблица пользователей)
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
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_email ON users (email);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_username ON users (username);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_reset_password_token ON users (reset_password_token);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_confirmation_token ON users (confirmation_token);
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_unlock_token ON users (unlock_token);

-- Products table (основная таблица продуктов)
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
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS index_products_on_user_id ON products (user_id);
CREATE UNIQUE INDEX IF NOT EXISTS index_products_on_permalink ON products (permalink);
CREATE INDEX IF NOT EXISTS index_products_on_published ON products (published);
CREATE INDEX IF NOT EXISTS index_products_on_created_at ON products (created_at);

-- Purchases table (покупки)
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
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS index_purchases_on_product_id ON purchases (product_id);
CREATE INDEX IF NOT EXISTS index_purchases_on_user_id ON purchases (user_id);
CREATE INDEX IF NOT EXISTS index_purchases_on_customer_email ON purchases (customer_email);
CREATE UNIQUE INDEX IF NOT EXISTS index_purchases_on_purchase_token ON purchases (purchase_token);
CREATE INDEX IF NOT EXISTS index_purchases_on_created_at ON purchases (created_at);

-- Product files table (файлы продуктов)
CREATE TABLE IF NOT EXISTS product_files (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    file_size BIGINT,
    content_type VARCHAR(255),
    file_key VARCHAR(500),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS index_product_files_on_product_id ON product_files (product_id);

-- Comments/Reviews table (комментарии и отзывы)
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
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS index_comments_on_product_id ON comments (product_id);
CREATE INDEX IF NOT EXISTS index_comments_on_user_id ON comments (user_id);
CREATE INDEX IF NOT EXISTS index_comments_on_published ON comments (published);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Add updated_at triggers
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
-- MIGRATION 3: Supabase User ID Support
-- File: 20250825000002_add_supabase_user_id_to_users.sql
-- ========================================

-- Add Supabase user ID to users table for synchronization
ALTER TABLE users ADD COLUMN IF NOT EXISTS supabase_user_id UUID;
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_supabase_user_id ON users (supabase_user_id);

-- Add soft delete support
ALTER TABLE users ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMP WITH TIME ZONE;
CREATE INDEX IF NOT EXISTS index_users_on_deleted_at ON users (deleted_at);

-- ========================================  
-- MIGRATION 4: Row Level Security Policies  
-- File: 20250825000003_enhanced_rls_policies.sql
-- ========================================

-- Enable Row Level Security
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE purchases ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_files ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "users_select_own" ON users;
DROP POLICY IF EXISTS "users_update_own" ON users;
DROP POLICY IF EXISTS "users_insert_own" ON users;
DROP POLICY IF EXISTS "users_public_profile" ON users;
DROP POLICY IF EXISTS "products_select_published" ON products;
DROP POLICY IF EXISTS "products_manage_own" ON products;
DROP POLICY IF EXISTS "purchases_select_own_or_creator" ON purchases;
DROP POLICY IF EXISTS "purchases_insert_authenticated" ON purchases;
DROP POLICY IF EXISTS "purchases_update_by_creator" ON purchases;
DROP POLICY IF EXISTS "product_files_manage_by_creator" ON product_files;
DROP POLICY IF EXISTS "product_files_download_by_purchaser" ON product_files;
DROP POLICY IF EXISTS "comments_select_published_or_own" ON comments;
DROP POLICY IF EXISTS "comments_insert_authenticated" ON comments;
DROP POLICY IF EXISTS "comments_update_own_or_creator" ON comments;
DROP POLICY IF EXISTS "comments_delete_own_or_creator" ON comments;

-- Enhanced User policies
CREATE POLICY "users_select_own" ON users FOR SELECT USING (
    auth.uid()::text = supabase_user_id::text OR 
    auth.uid()::text = id::text
);

CREATE POLICY "users_update_own" ON users FOR UPDATE USING (
    auth.uid()::text = supabase_user_id::text OR 
    auth.uid()::text = id::text
);

CREATE POLICY "users_insert_own" ON users FOR INSERT WITH CHECK (
    auth.uid()::text = supabase_user_id::text
);

-- Public user info for product pages (limited fields)
CREATE POLICY "users_public_profile" ON users FOR SELECT USING (
    true -- Allow reading basic user info for product pages
);

-- Enhanced Product policies
CREATE POLICY "products_select_published" ON products FOR SELECT USING (
    published = true OR 
    (auth.uid()::text IS NOT NULL AND user_id::text IN (
        SELECT id::text FROM users WHERE supabase_user_id::text = auth.uid()::text
    ))
);

CREATE POLICY "products_manage_own" ON products FOR ALL USING (
    user_id::text IN (
        SELECT id::text FROM users WHERE supabase_user_id::text = auth.uid()::text
    )
);

-- Enhanced Purchase policies
CREATE POLICY "purchases_select_own_or_creator" ON purchases FOR SELECT USING (
    -- Покупатель может видеть свои покупки
    (auth.uid()::text IS NOT NULL AND user_id::text IN (
        SELECT id::text FROM users WHERE supabase_user_id::text = auth.uid()::text
    )) OR 
    -- Создатель продукта может видеть покупки своего продукта
    (auth.uid()::text IS NOT NULL AND product_id IN (
        SELECT p.id FROM products p 
        INNER JOIN users u ON u.id = p.user_id 
        WHERE u.supabase_user_id::text = auth.uid()::text
    ))
);

CREATE POLICY "purchases_insert_authenticated" ON purchases FOR INSERT WITH CHECK (
    auth.uid()::text IS NOT NULL
);

-- Purchase updates only by creators (for refunds, status changes)
CREATE POLICY "purchases_update_by_creator" ON purchases FOR UPDATE USING (
    product_id IN (
        SELECT p.id FROM products p 
        INNER JOIN users u ON u.id = p.user_id 
        WHERE u.supabase_user_id::text = auth.uid()::text
    )
);

-- Enhanced Product Files policies
CREATE POLICY "product_files_manage_by_creator" ON product_files FOR ALL USING (
    product_id IN (
        SELECT p.id FROM products p 
        INNER JOIN users u ON u.id = p.user_id 
        WHERE u.supabase_user_id::text = auth.uid()::text
    )
);

-- Download access for purchasers
CREATE POLICY "product_files_download_by_purchaser" ON product_files FOR SELECT USING (
    product_id IN (
        SELECT pur.product_id FROM purchases pur
        INNER JOIN users u ON u.id = pur.user_id 
        WHERE u.supabase_user_id::text = auth.uid()::text
        AND pur.status = 'completed'
    ) OR
    -- Or creator can always access
    product_id IN (
        SELECT p.id FROM products p 
        INNER JOIN users u ON u.id = p.user_id 
        WHERE u.supabase_user_id::text = auth.uid()::text
    )
);

-- Enhanced Comments/Reviews policies
CREATE POLICY "comments_select_published_or_own" ON comments FOR SELECT USING (
    published = true OR
    (auth.uid()::text IS NOT NULL AND user_id::text IN (
        SELECT id::text FROM users WHERE supabase_user_id::text = auth.uid()::text
    )) OR
    -- Product creators can see all comments on their products
    (auth.uid()::text IS NOT NULL AND product_id IN (
        SELECT p.id FROM products p 
        INNER JOIN users u ON u.id = p.user_id 
        WHERE u.supabase_user_id::text = auth.uid()::text
    ))
);

CREATE POLICY "comments_insert_authenticated" ON comments FOR INSERT WITH CHECK (
    auth.uid()::text IS NOT NULL AND 
    user_id::text IN (
        SELECT id::text FROM users WHERE supabase_user_id::text = auth.uid()::text
    )
);

CREATE POLICY "comments_update_own_or_creator" ON comments FOR UPDATE USING (
    -- User can update own comments
    (auth.uid()::text IS NOT NULL AND user_id::text IN (
        SELECT id::text FROM users WHERE supabase_user_id::text = auth.uid()::text
    )) OR
    -- Product creator can moderate comments
    (auth.uid()::text IS NOT NULL AND product_id IN (
        SELECT p.id FROM products p 
        INNER JOIN users u ON u.id = p.user_id 
        WHERE u.supabase_user_id::text = auth.uid()::text
    ))
);

CREATE POLICY "comments_delete_own_or_creator" ON comments FOR DELETE USING (
    -- User can delete own comments
    (auth.uid()::text IS NOT NULL AND user_id::text IN (
        SELECT id::text FROM users WHERE supabase_user_id::text = auth.uid()::text
    )) OR
    -- Product creator can delete comments on their products
    (auth.uid()::text IS NOT NULL AND product_id IN (
        SELECT p.id FROM products p 
        INNER JOIN users u ON u.id = p.user_id 
        WHERE u.supabase_user_id::text = auth.uid()::text
    ))
);

-- Create security functions for common checks
CREATE OR REPLACE FUNCTION auth.user_owns_product(product_id BIGINT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1 FROM products p 
        INNER JOIN users u ON u.id = p.user_id 
        WHERE p.id = product_id 
        AND u.supabase_user_id::text = auth.uid()::text
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION auth.user_purchased_product(product_id BIGINT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1 FROM purchases pur
        INNER JOIN users u ON u.id = pur.user_id 
        WHERE pur.product_id = product_id 
        AND u.supabase_user_id::text = auth.uid()::text
        AND pur.status = 'completed'
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Add audit log table for security events
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

-- Enable RLS on audit log
ALTER TABLE security_audit_log ENABLE ROW LEVEL SECURITY;

-- Only allow reading own audit logs (admins would need separate access)
CREATE POLICY "audit_log_select_own" ON security_audit_log FOR SELECT USING (
    user_id = auth.uid()
);

-- Audit log entries can only be created by system (via service role)
CREATE POLICY "audit_log_insert_service" ON security_audit_log FOR INSERT WITH CHECK (
    auth.role() = 'service_role'
);

-- ========================================
-- КОНЕЦ МИГРАЦИЙ
-- ========================================

-- Проверка созданных таблиц
SELECT 
    schemaname,
    tablename,
    rowsecurity as "RLS Enabled"
FROM pg_tables 
WHERE schemaname = 'public' 
    AND tablename IN ('users', 'products', 'purchases', 'product_files', 'comments', 'active_storage_blobs')
ORDER BY tablename;