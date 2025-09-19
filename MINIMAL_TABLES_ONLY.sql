-- ========================================
-- МИНИМАЛЬНЫЕ ТАБЛИЦЫ БЕЗ ИНДЕКСОВ
-- Сначала посмотрим что уже есть, потом создадим недостающее
-- ========================================

-- ========================================  
-- 1. Проверим существующую структуру
-- ========================================

-- Какие таблицы уже есть?
SELECT 
    table_name,
    table_type
FROM information_schema.tables 
WHERE table_schema = 'public' 
    AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Какие колонки есть в таблице users (если она существует)?
SELECT 
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns 
WHERE table_schema = 'public' 
    AND table_name = 'users'
ORDER BY ordinal_position;

-- ========================================  
-- 2. Создаем недостающие таблицы
-- ========================================

-- Active Storage Blobs
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

-- Active Storage Attachments  
CREATE TABLE IF NOT EXISTS active_storage_attachments (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(191) NOT NULL,
  record_type VARCHAR(191) NOT NULL,
  record_id BIGINT NOT NULL,
  blob_id BIGINT NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

-- Active Storage Variant Records
CREATE TABLE IF NOT EXISTS active_storage_variant_records (
  id BIGSERIAL PRIMARY KEY,
  blob_id BIGINT NOT NULL,
  variation_digest VARCHAR NOT NULL
);

-- Products Table (только если не существует)
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

-- Purchases Table
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

-- Product Files Table
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

-- Comments Table
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
-- 3. Безопасно добавляем колонку supabase_user_id в users
-- ========================================

DO $$
BEGIN
    -- Добавляем колонку только если ее нет
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public'
        AND table_name = 'users' 
        AND column_name = 'supabase_user_id'
    ) THEN
        ALTER TABLE users ADD COLUMN supabase_user_id UUID;
        RAISE NOTICE 'Added supabase_user_id column to users table';
    ELSE
        RAISE NOTICE 'supabase_user_id column already exists';
    END IF;
END $$;

-- ========================================
-- 4. Только самые необходимые индексы
-- ========================================

-- Индексы только для колонок, которые точно существуют
CREATE UNIQUE INDEX IF NOT EXISTS idx_blobs_key ON active_storage_blobs (key);

-- Проверяем что есть email в users перед созданием индекса
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public'
        AND table_name = 'users' 
        AND column_name = 'email'
    ) THEN
        CREATE UNIQUE INDEX IF NOT EXISTS idx_users_email ON users (email);
        RAISE NOTICE 'Created email index on users';
    ELSE
        RAISE NOTICE 'Email column does not exist in users table';
    END IF;
END $$;

-- ========================================
-- 5. Финальная проверка
-- ========================================

-- Список всех таблиц после создания
SELECT 
    table_name as "📋 Table Name",
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = t.table_name AND table_schema = 'public') as "Columns"
FROM information_schema.tables t
WHERE table_schema = 'public' 
    AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Проверяем структуру users
SELECT 
    '👤 USERS TABLE STRUCTURE' as info;

SELECT 
    column_name as "Column",
    data_type as "Type",
    CASE WHEN is_nullable = 'YES' THEN '✓' ELSE '✗' END as "Nullable"
FROM information_schema.columns 
WHERE table_schema = 'public' 
    AND table_name = 'users'
ORDER BY ordinal_position;

-- Проверяем какие индексы созданы
SELECT 
    '📊 CREATED INDEXES' as info;

SELECT 
    tablename as "Table",
    indexname as "Index Name",
    CASE WHEN indexdef LIKE '%UNIQUE%' THEN '🔑 Unique' ELSE '📈 Regular' END as "Type"
FROM pg_indexes 
WHERE schemaname = 'public'
    AND tablename IN ('users', 'products', 'active_storage_blobs')
ORDER BY tablename, indexname;

-- Финальное сообщение
SELECT '✅ Базовые таблицы готовы для тестирования!' as "🎉 Status";