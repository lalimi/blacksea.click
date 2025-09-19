-- Core Gumroad tables migration for Supabase
-- Created: 2025-08-25

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

-- Enable Row Level Security
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE purchases ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_files ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

-- Basic RLS policies (будут расширены позже)

-- Users: пользователи могут видеть и редактировать только свои данные
CREATE POLICY "Users can view own profile" ON users FOR SELECT USING (auth.uid()::text = id::text);
CREATE POLICY "Users can update own profile" ON users FOR UPDATE USING (auth.uid()::text = id::text);

-- Products: создатели могут управлять своими продуктами, все могут видеть опубликованные
CREATE POLICY "Anyone can view published products" ON products FOR SELECT USING (published = true);
CREATE POLICY "Users can view own products" ON products FOR SELECT USING (auth.uid()::text = user_id::text);
CREATE POLICY "Users can manage own products" ON products FOR ALL USING (auth.uid()::text = user_id::text);

-- Purchases: пользователи видят только свои покупки, создатели - покупки своих продуктов
CREATE POLICY "Users can view own purchases" ON purchases FOR SELECT USING (auth.uid()::text = user_id::text);
CREATE POLICY "Creators can view product purchases" ON purchases FOR SELECT USING (
    EXISTS (SELECT 1 FROM products WHERE products.id = purchases.product_id AND products.user_id::text = auth.uid()::text)
);

-- Product files: доступ только создателям продукта
CREATE POLICY "Creators can manage product files" ON product_files FOR ALL USING (
    EXISTS (SELECT 1 FROM products WHERE products.id = product_files.product_id AND products.user_id::text = auth.uid()::text)
);

-- Comments: все могут видеть опубликованные, создатели продуктов управляют модерацией
CREATE POLICY "Anyone can view published comments" ON comments FOR SELECT USING (published = true);
CREATE POLICY "Users can create comments" ON comments FOR INSERT WITH CHECK (auth.uid()::text = user_id::text);
CREATE POLICY "Creators can manage product comments" ON comments FOR ALL USING (
    EXISTS (SELECT 1 FROM products WHERE products.id = comments.product_id AND products.user_id::text = auth.uid()::text)
);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Add updated_at triggers
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_purchases_updated_at BEFORE UPDATE ON purchases FOR EACH ROW EXECUTE FUNCTION update_purchases_updated_at_column();
CREATE TRIGGER update_product_files_updated_at BEFORE UPDATE ON product_files FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_comments_updated_at BEFORE UPDATE ON comments FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();