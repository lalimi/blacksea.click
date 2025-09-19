-- ИСПРАВЛЕНИЕ ENUM КОЛОНОК (INTEGER → VARCHAR)
-- Некоторые колонки должны быть строковыми, но созданы как INTEGER
-- Создан: для решения ошибки "invalid input syntax for type integer"

SET client_min_messages TO WARNING;

-- ================================== 
-- ИСПРАВЛЕНИЕ ENUM КОЛОНОК В LINKS
-- ==================================

-- purchase_type должен быть VARCHAR (содержит 'buy_only', 'rent', etc.)
DO $$ BEGIN
    ALTER TABLE links ALTER COLUMN purchase_type TYPE VARCHAR(50);
    RAISE NOTICE 'links.purchase_type изменен на VARCHAR(50)';
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.purchase_type: %', SQLERRM;
END $$;

-- filetype может содержать строковые значения
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'links' AND column_name = 'filetype' 
               AND data_type = 'integer') THEN
        ALTER TABLE links ALTER COLUMN filetype TYPE VARCHAR(100);
        RAISE NOTICE 'links.filetype изменен на VARCHAR(100)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.filetype: %', SQLERRM;
END $$;

-- filegroup может содержать строковые значения  
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'links' AND column_name = 'filegroup' 
               AND data_type = 'integer') THEN
        ALTER TABLE links ALTER COLUMN filegroup TYPE VARCHAR(100);
        RAISE NOTICE 'links.filegroup изменен на VARCHAR(100)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.filegroup: %', SQLERRM;
END $$;

-- native_type должен быть VARCHAR
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'links' AND column_name = 'native_type' 
               AND data_type = 'integer') THEN
        ALTER TABLE links ALTER COLUMN native_type TYPE VARCHAR(50);
        RAISE NOTICE 'links.native_type изменен на VARCHAR(50)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения links.native_type: %', SQLERRM;
END $$;

-- ================================== 
-- ИСПРАВЛЕНИЕ ENUM КОЛОНОК В USERS
-- ==================================

-- tier_state может быть enum
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'users' AND column_name = 'tier_state' 
               AND data_type = 'character varying') THEN
        -- Уже строковый, оставляем как есть
        RAISE NOTICE 'users.tier_state уже VARCHAR';
    ELSE
        ALTER TABLE users ALTER COLUMN tier_state TYPE VARCHAR(50);
        RAISE NOTICE 'users.tier_state изменен на VARCHAR(50)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения users.tier_state: %', SQLERRM;
END $$;

-- user_risk_state должен быть VARCHAR
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'users' AND column_name = 'user_risk_state' 
               AND data_type != 'character varying') THEN
        ALTER TABLE users ALTER COLUMN user_risk_state TYPE VARCHAR(50);
        RAISE NOTICE 'users.user_risk_state изменен на VARCHAR(50)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения users.user_risk_state: %', SQLERRM;
END $$;

-- state может быть строковым (название штата/области)
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'users' AND column_name = 'state' 
               AND data_type != 'character varying') THEN
        ALTER TABLE users ALTER COLUMN state TYPE VARCHAR(100);
        RAISE NOTICE 'users.state изменен на VARCHAR(100)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения users.state: %', SQLERRM;
END $$;

-- recommendation_type должен быть VARCHAR
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'users' AND column_name = 'recommendation_type' 
               AND data_type != 'character varying') THEN
        ALTER TABLE users ALTER COLUMN recommendation_type TYPE VARCHAR(50);
        RAISE NOTICE 'users.recommendation_type изменен на VARCHAR(50)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения users.recommendation_type: %', SQLERRM;
END $$;

-- ================================== 
-- ИСПРАВЛЕНИЕ ENUM КОЛОНОК В EVENTS
-- ==================================

-- purchase_state может содержать строковые значения ('successful', 'failed', etc.)
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'events' AND column_name = 'purchase_state' 
               AND data_type != 'character varying') THEN
        ALTER TABLE events ALTER COLUMN purchase_state TYPE VARCHAR(50);
        RAISE NOTICE 'events.purchase_state изменен на VARCHAR(50)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.purchase_state: %', SQLERRM;
END $$;

-- card_type должен быть VARCHAR ('visa', 'mastercard', etc.)
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'events' AND column_name = 'card_type' 
               AND data_type != 'character varying') THEN
        ALTER TABLE events ALTER COLUMN card_type TYPE VARCHAR(50);
        RAISE NOTICE 'events.card_type изменен на VARCHAR(50)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.card_type: %', SQLERRM;
END $$;

-- ip_state должен быть VARCHAR (название штата)
DO $$ BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name = 'events' AND column_name = 'ip_state' 
               AND data_type != 'character varying') THEN
        ALTER TABLE events ALTER COLUMN ip_state TYPE VARCHAR(100);
        RAISE NOTICE 'events.ip_state изменен на VARCHAR(100)';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка изменения events.ip_state: %', SQLERRM;
END $$;

-- ================================== 
-- ПРОВЕРКА РЕЗУЛЬТАТОВ
-- ==================================

SELECT 
    table_name, 
    column_name, 
    data_type,
    character_maximum_length
FROM information_schema.columns 
WHERE table_name IN ('users', 'links', 'affiliates', 'events')
  AND table_schema = 'public'
  AND column_name IN ('purchase_type', 'filetype', 'filegroup', 'native_type', 
                      'tier_state', 'user_risk_state', 'state', 'recommendation_type',
                      'purchase_state', 'card_type', 'ip_state')
ORDER BY table_name, column_name;

-- ИСПРАВЛЕНИЕ ENUM КОЛОНОК ЗАВЕРШЕНО