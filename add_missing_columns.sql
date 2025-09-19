-- ДОБАВЛЕНИЕ НЕДОСТАЮЩИХ КОЛОНОК В SUPABASE
-- Основано на схеме Rails модели User
-- Создан: 2025-08-28 13:32:45 +0300

SET client_min_messages TO WARNING;

-- ==================================
-- ДОБАВЛЕНИЕ КОЛОНОК В ТАБЛИЦУ USERS
-- ==================================

-- Колонка: email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN email VARCHAR(255) DEFAULT '';
        RAISE NOTICE 'Добавлена колонка users.email';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки email: %', SQLERRM;
END $$;

-- Колонка: encrypted_password (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'encrypted_password' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN encrypted_password VARCHAR(255) DEFAULT '' NOT NULL;
        RAISE NOTICE 'Добавлена колонка users.encrypted_password';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки encrypted_password: %', SQLERRM;
END $$;

-- Колонка: reset_password_token (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'reset_password_token' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN reset_password_token VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.reset_password_token';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки reset_password_token: %', SQLERRM;
END $$;

-- Колонка: reset_password_sent_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'reset_password_sent_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN reset_password_sent_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.reset_password_sent_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки reset_password_sent_at: %', SQLERRM;
END $$;

-- Колонка: remember_created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'remember_created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN remember_created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.remember_created_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки remember_created_at: %', SQLERRM;
END $$;

-- Колонка: sign_in_count (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'sign_in_count' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN sign_in_count INTEGER DEFAULT 0;
        RAISE NOTICE 'Добавлена колонка users.sign_in_count';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки sign_in_count: %', SQLERRM;
END $$;

-- Колонка: current_sign_in_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'current_sign_in_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN current_sign_in_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.current_sign_in_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки current_sign_in_at: %', SQLERRM;
END $$;

-- Колонка: last_sign_in_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'last_sign_in_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN last_sign_in_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.last_sign_in_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки last_sign_in_at: %', SQLERRM;
END $$;

-- Колонка: current_sign_in_ip (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'current_sign_in_ip' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN current_sign_in_ip VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.current_sign_in_ip';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки current_sign_in_ip: %', SQLERRM;
END $$;

-- Колонка: last_sign_in_ip (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'last_sign_in_ip' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN last_sign_in_ip VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.last_sign_in_ip';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки last_sign_in_ip: %', SQLERRM;
END $$;

-- Колонка: created_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.created_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки created_at: %', SQLERRM;
END $$;

-- Колонка: updated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.updated_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки updated_at: %', SQLERRM;
END $$;

-- Колонка: google_uid (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'google_uid' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN google_uid VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.google_uid';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки google_uid: %', SQLERRM;
END $$;

-- Колонка: username (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'username' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN username VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.username';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки username: %', SQLERRM;
END $$;

-- Колонка: user_risk_state (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'user_risk_state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN user_risk_state VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.user_risk_state';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки user_risk_state: %', SQLERRM;
END $$;

-- Колонка: external_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'external_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN external_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.external_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки external_id: %', SQLERRM;
END $$;

-- Колонка: name (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'name' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN name VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.name';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки name: %', SQLERRM;
END $$;

-- Колонка: provider (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'provider' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN provider VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.provider';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки provider: %', SQLERRM;
END $$;

-- Колонка: confirmed_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'confirmed_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN confirmed_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.confirmed_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки confirmed_at: %', SQLERRM;
END $$;

-- Колонка: confirmation_token (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'confirmation_token' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN confirmation_token VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.confirmation_token';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки confirmation_token: %', SQLERRM;
END $$;

-- Колонка: confirmation_sent_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'confirmation_sent_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN confirmation_sent_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.confirmation_sent_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки confirmation_sent_at: %', SQLERRM;
END $$;

-- Колонка: unconfirmed_email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'unconfirmed_email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN unconfirmed_email VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.unconfirmed_email';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки unconfirmed_email: %', SQLERRM;
END $$;

-- Колонка: tier_state (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'tier_state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN tier_state INTEGER DEFAULT 0;
        RAISE NOTICE 'Добавлена колонка users.tier_state';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки tier_state: %', SQLERRM;
END $$;

-- Колонка: flags (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN flags INTEGER DEFAULT 1 NOT NULL;
        RAISE NOTICE 'Добавлена колонка users.flags';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки flags: %', SQLERRM;
END $$;

-- Колонка: locale (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'locale' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN locale VARCHAR(255) DEFAULT 'en';
        RAISE NOTICE 'Добавлена колонка users.locale';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки locale: %', SQLERRM;
END $$;

-- Колонка: timezone (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'timezone' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN timezone VARCHAR(255) DEFAULT 'Pacific Time (US & Canada)' NOT NULL;
        RAISE NOTICE 'Добавлена колонка users.timezone';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки timezone: %', SQLERRM;
END $$;

-- Колонка: currency_type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'currency_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN currency_type VARCHAR(255) DEFAULT 'usd';
        RAISE NOTICE 'Добавлена колонка users.currency_type';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки currency_type: %', SQLERRM;
END $$;

-- Колонка: recommendation_type (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'recommendation_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN recommendation_type VARCHAR(255) DEFAULT 'trending' NOT NULL;
        RAISE NOTICE 'Добавлена колонка users.recommendation_type';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки recommendation_type: %', SQLERRM;
END $$;

-- Колонка: facebook_meta_tag (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_meta_tag' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_meta_tag VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_meta_tag';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки facebook_meta_tag: %', SQLERRM;
END $$;

-- Колонка: google_analytics_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'google_analytics_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN google_analytics_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.google_analytics_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки google_analytics_id: %', SQLERRM;
END $$;

-- Колонка: support_email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'support_email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN support_email VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.support_email';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки support_email: %', SQLERRM;
END $$;

-- Колонка: bio (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'bio' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN bio TEXT;
        RAISE NOTICE 'Добавлена колонка users.bio';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки bio: %', SQLERRM;
END $$;

-- Колонка: profile_picture_url (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'profile_picture_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN profile_picture_url VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.profile_picture_url';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки profile_picture_url: %', SQLERRM;
END $$;

-- Колонка: country (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'country' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN country VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.country';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки country: %', SQLERRM;
END $$;

-- Колонка: verified (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'verified' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN verified BOOLEAN;
        RAISE NOTICE 'Добавлена колонка users.verified';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки verified: %', SQLERRM;
END $$;

-- Колонка: payment_notification (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'payment_notification' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN payment_notification BOOLEAN DEFAULT true;
        RAISE NOTICE 'Добавлена колонка users.payment_notification';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки payment_notification: %', SQLERRM;
END $$;

-- Колонка: facebook_uid (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_uid' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_uid VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_uid';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки facebook_uid: %', SQLERRM;
END $$;

-- Колонка: twitter_user_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'twitter_user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN twitter_user_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.twitter_user_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки twitter_user_id: %', SQLERRM;
END $$;

-- Колонка: twitter_handle (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'twitter_handle' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN twitter_handle VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.twitter_handle';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки twitter_handle: %', SQLERRM;
END $$;

-- Колонка: twitter_oauth_token (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'twitter_oauth_token' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN twitter_oauth_token VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.twitter_oauth_token';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки twitter_oauth_token: %', SQLERRM;
END $$;

-- Колонка: twitter_oauth_secret (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'twitter_oauth_secret' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN twitter_oauth_secret VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.twitter_oauth_secret';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки twitter_oauth_secret: %', SQLERRM;
END $$;

-- Колонка: facebook_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки facebook_id: %', SQLERRM;
END $$;

-- Колонка: purchasing_power_parity_limit (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'purchasing_power_parity_limit' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN purchasing_power_parity_limit INTEGER;
        RAISE NOTICE 'Добавлена колонка users.purchasing_power_parity_limit';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки purchasing_power_parity_limit: %', SQLERRM;
END $$;

-- Колонка: kindle_email (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'kindle_email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN kindle_email VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.kindle_email';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки kindle_email: %', SQLERRM;
END $$;

-- Колонка: payment_address (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'payment_address' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN payment_address VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.payment_address';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки payment_address: %', SQLERRM;
END $$;

-- Колонка: deleted_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.deleted_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки deleted_at: %', SQLERRM;
END $$;

-- Колонка: account_created_ip (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'account_created_ip' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN account_created_ip VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.account_created_ip';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки account_created_ip: %', SQLERRM;
END $$;

-- Колонка: notification_endpoint (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'notification_endpoint' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN notification_endpoint TEXT;
        RAISE NOTICE 'Добавлена колонка users.notification_endpoint';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки notification_endpoint: %', SQLERRM;
END $$;

-- Колонка: json_data (text)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'json_data' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN json_data TEXT;
        RAISE NOTICE 'Добавлена колонка users.json_data';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки json_data: %', SQLERRM;
END $$;

-- Колонка: tos_violation_reason (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'tos_violation_reason' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN tos_violation_reason VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.tos_violation_reason';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки tos_violation_reason: %', SQLERRM;
END $$;

-- Колонка: google_analytics_domains (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'google_analytics_domains' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN google_analytics_domains VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.google_analytics_domains';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки google_analytics_domains: %', SQLERRM;
END $$;

-- Колонка: facebook_pixel_id (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_pixel_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_pixel_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_pixel_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки facebook_pixel_id: %', SQLERRM;
END $$;

-- Колонка: split_payment_by_cents (integer)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'split_payment_by_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN split_payment_by_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка users.split_payment_by_cents';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки split_payment_by_cents: %', SQLERRM;
END $$;

-- Колонка: last_active_sessions_invalidated_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'last_active_sessions_invalidated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN last_active_sessions_invalidated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.last_active_sessions_invalidated_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки last_active_sessions_invalidated_at: %', SQLERRM;
END $$;

-- Колонка: otp_secret_key (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'otp_secret_key' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN otp_secret_key VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.otp_secret_key';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки otp_secret_key: %', SQLERRM;
END $$;

-- Колонка: orientation_priority_tag (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'orientation_priority_tag' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN orientation_priority_tag VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.orientation_priority_tag';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки orientation_priority_tag: %', SQLERRM;
END $$;

-- Колонка: facebook_access_token (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'facebook_access_token' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN facebook_access_token VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.facebook_access_token';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки facebook_access_token: %', SQLERRM;
END $$;

-- Колонка: manage_pages (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'manage_pages' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN manage_pages BOOLEAN;
        RAISE NOTICE 'Добавлена колонка users.manage_pages';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки manage_pages: %', SQLERRM;
END $$;

-- Колонка: banned_at (datetime)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'banned_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN banned_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка users.banned_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки banned_at: %', SQLERRM;
END $$;

-- Колонка: weekly_notification (boolean)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'weekly_notification' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN weekly_notification BOOLEAN;
        RAISE NOTICE 'Добавлена колонка users.weekly_notification';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки weekly_notification: %', SQLERRM;
END $$;

-- Колонка: state (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN state VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.state';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки state: %', SQLERRM;
END $$;

-- Колонка: city (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'city' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN city VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.city';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки city: %', SQLERRM;
END $$;

-- Колонка: zip_code (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'zip_code' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN zip_code VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.zip_code';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки zip_code: %', SQLERRM;
END $$;

-- Колонка: street_address (string)
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'users' AND column_name = 'street_address' 
                   AND table_schema = 'public') THEN
        ALTER TABLE users ADD COLUMN street_address VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка users.street_address';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки street_address: %', SQLERRM;
END $$;

-- ==================================
-- ДОБАВЛЕНИЕ КОЛОНОК В ДРУГИЕ ТАБЛИЦЫ
-- ==================================

-- Таблица: links
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN user_id BIGINT;
        RAISE NOTICE 'Добавлена колонка links.user_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.user_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'name' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN name VARCHAR(255) NOT NULL;
        RAISE NOTICE 'Добавлена колонка links.name';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.name: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'unique_permalink' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN unique_permalink VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.unique_permalink';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.unique_permalink: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'preview_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN preview_url TEXT;
        RAISE NOTICE 'Добавлена колонка links.preview_url';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.preview_url: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'description' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN description TEXT;
        RAISE NOTICE 'Добавлена колонка links.description';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.description: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'purchase_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN purchase_type INTEGER DEFAULT 0;
        RAISE NOTICE 'Добавлена колонка links.purchase_type';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.purchase_type: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.created_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.created_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.updated_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.updated_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'purchase_disabled_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN purchase_disabled_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.purchase_disabled_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.purchase_disabled_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.deleted_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.deleted_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка links.price_cents';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.price_cents: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'price_currency_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN price_currency_type VARCHAR(255) DEFAULT 'usd';
        RAISE NOTICE 'Добавлена колонка links.price_currency_type';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.price_currency_type: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'customizable_price' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN customizable_price BOOLEAN;
        RAISE NOTICE 'Добавлена колонка links.customizable_price';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.customizable_price: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'max_purchase_count' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN max_purchase_count INTEGER;
        RAISE NOTICE 'Добавлена колонка links.max_purchase_count';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.max_purchase_count: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'bad_card_counter' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN bad_card_counter INTEGER DEFAULT 0;
        RAISE NOTICE 'Добавлена колонка links.bad_card_counter';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.bad_card_counter: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'require_shipping' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN require_shipping BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка links.require_shipping';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.require_shipping: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'last_partner_sync' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN last_partner_sync TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.last_partner_sync';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.last_partner_sync: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'preview_oembed' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN preview_oembed TEXT;
        RAISE NOTICE 'Добавлена колонка links.preview_oembed';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.preview_oembed: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'showcaseable' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN showcaseable BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка links.showcaseable';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.showcaseable: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'custom_receipt' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN custom_receipt TEXT;
        RAISE NOTICE 'Добавлена колонка links.custom_receipt';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.custom_receipt: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'custom_filetype' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN custom_filetype VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.custom_filetype';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.custom_filetype: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'filetype' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN filetype VARCHAR(255) DEFAULT 'link';
        RAISE NOTICE 'Добавлена колонка links.filetype';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.filetype: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'filegroup' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN filegroup VARCHAR(255) DEFAULT 'url';
        RAISE NOTICE 'Добавлена колонка links.filegroup';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.filegroup: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'size' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN size INTEGER;
        RAISE NOTICE 'Добавлена колонка links.size';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.size: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'bitrate' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN bitrate INTEGER;
        RAISE NOTICE 'Добавлена колонка links.bitrate';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.bitrate: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'framerate' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN framerate INTEGER;
        RAISE NOTICE 'Добавлена колонка links.framerate';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.framerate: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'pagelength' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN pagelength INTEGER;
        RAISE NOTICE 'Добавлена колонка links.pagelength';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.pagelength: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'duration' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN duration INTEGER;
        RAISE NOTICE 'Добавлена колонка links.duration';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.duration: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'width' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN width INTEGER;
        RAISE NOTICE 'Добавлена колонка links.width';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.width: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'height' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN height INTEGER;
        RAISE NOTICE 'Добавлена колонка links.height';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.height: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'custom_permalink' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN custom_permalink VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.custom_permalink';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.custom_permalink: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'common_color' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN common_color VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.common_color';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.common_color: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'suggested_price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN suggested_price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка links.suggested_price_cents';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.suggested_price_cents: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'banned_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN banned_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.banned_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.banned_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'risk_score' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN risk_score INTEGER;
        RAISE NOTICE 'Добавлена колонка links.risk_score';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.risk_score: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'risk_score_updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN risk_score_updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.risk_score_updated_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.risk_score_updated_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'draft' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN draft BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка links.draft';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.draft: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN flags INTEGER DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка links.flags';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.flags: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'subscription_duration' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN subscription_duration INTEGER;
        RAISE NOTICE 'Добавлена колонка links.subscription_duration';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.subscription_duration: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'json_data' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN json_data TEXT;
        RAISE NOTICE 'Добавлена колонка links.json_data';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.json_data: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'external_mapping_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN external_mapping_id VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка links.external_mapping_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.external_mapping_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'affiliate_application_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN affiliate_application_id BIGINT;
        RAISE NOTICE 'Добавлена колонка links.affiliate_application_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.affiliate_application_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'rental_price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN rental_price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка links.rental_price_cents';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.rental_price_cents: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'duration_in_months' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN duration_in_months INTEGER;
        RAISE NOTICE 'Добавлена колонка links.duration_in_months';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.duration_in_months: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'migrated_to_tiered_pricing_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN migrated_to_tiered_pricing_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.migrated_to_tiered_pricing_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.migrated_to_tiered_pricing_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'free_trial_duration_unit' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN free_trial_duration_unit INTEGER;
        RAISE NOTICE 'Добавлена колонка links.free_trial_duration_unit';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.free_trial_duration_unit: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'free_trial_duration_amount' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN free_trial_duration_amount INTEGER;
        RAISE NOTICE 'Добавлена колонка links.free_trial_duration_amount';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.free_trial_duration_amount: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'content_updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN content_updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка links.content_updated_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.content_updated_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'taxonomy_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN taxonomy_id BIGINT;
        RAISE NOTICE 'Добавлена колонка links.taxonomy_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.taxonomy_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'native_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN native_type VARCHAR(255) DEFAULT 'digital' NOT NULL;
        RAISE NOTICE 'Добавлена колонка links.native_type';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.native_type: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'links' AND column_name = 'discover_fee_per_thousand' 
                   AND table_schema = 'public') THEN
        ALTER TABLE links ADD COLUMN discover_fee_per_thousand INTEGER DEFAULT 100 NOT NULL;
        RAISE NOTICE 'Добавлена колонка links.discover_fee_per_thousand';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки links.discover_fee_per_thousand: %', SQLERRM;
END $$;


-- Таблица: affiliates
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'seller_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN seller_id BIGINT;
        RAISE NOTICE 'Добавлена колонка affiliates.seller_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.seller_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'affiliate_user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN affiliate_user_id BIGINT;
        RAISE NOTICE 'Добавлена колонка affiliates.affiliate_user_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.affiliate_user_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'affiliate_basis_points' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN affiliate_basis_points INTEGER;
        RAISE NOTICE 'Добавлена колонка affiliates.affiliate_basis_points';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.affiliate_basis_points: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.created_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.created_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.updated_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.updated_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'deleted_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN deleted_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка affiliates.deleted_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.deleted_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'flags' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN flags INTEGER DEFAULT 0 NOT NULL;
        RAISE NOTICE 'Добавлена колонка affiliates.flags';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.flags: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'destination_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN destination_url VARCHAR(2083);
        RAISE NOTICE 'Добавлена колонка affiliates.destination_url';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.destination_url: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'affiliates' AND column_name = 'type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE affiliates ADD COLUMN type VARCHAR(255) NOT NULL;
        RAISE NOTICE 'Добавлена колонка affiliates.type';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки affiliates.type: %', SQLERRM;
END $$;


-- Таблица: events
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'visit_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN visit_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.visit_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.visit_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_address' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_address VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.ip_address';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.ip_address: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'event_name' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN event_name VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.event_name';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.event_name: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'user_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN user_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.user_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.user_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'link_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN link_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.link_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.link_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'created_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN created_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка events.created_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.created_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'updated_at' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN updated_at TIMESTAMP;
        RAISE NOTICE 'Добавлена колонка events.updated_at';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.updated_at: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'referrer' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN referrer VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.referrer';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.referrer: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'parent_referrer' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN parent_referrer VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.parent_referrer';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.parent_referrer: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'language' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN language VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.language';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.language: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'browser' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN browser VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.browser';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.browser: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'is_mobile' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN is_mobile BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка events.is_mobile';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.is_mobile: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'email' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN email VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.email';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.email: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'purchase_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN purchase_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.purchase_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.purchase_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'price_cents' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN price_cents INTEGER;
        RAISE NOTICE 'Добавлена колонка events.price_cents';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.price_cents: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'credit_card_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN credit_card_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.credit_card_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.credit_card_id: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'card_type' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN card_type VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.card_type';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.card_type: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'card_visual' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN card_visual VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.card_visual';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.card_visual: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'purchase_state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN purchase_state VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.purchase_state';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.purchase_state: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'billing_zip' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN billing_zip VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.billing_zip';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.billing_zip: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'chargeback' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN chargeback BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка events.chargeback';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.chargeback: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'refunded' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN refunded BOOLEAN DEFAULT false;
        RAISE NOTICE 'Добавлена колонка events.refunded';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.refunded: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'view_url' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN view_url VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.view_url';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.view_url: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'fingerprint' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN fingerprint VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.fingerprint';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.fingerprint: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_country' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_country VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.ip_country';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.ip_country: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_longitude' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_longitude TEXT;
        RAISE NOTICE 'Добавлена колонка events.ip_longitude';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.ip_longitude: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_latitude' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_latitude TEXT;
        RAISE NOTICE 'Добавлена колонка events.ip_latitude';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.ip_latitude: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'is_modal' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN is_modal BOOLEAN;
        RAISE NOTICE 'Добавлена колонка events.is_modal';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.is_modal: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'friend_actions' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN friend_actions TEXT;
        RAISE NOTICE 'Добавлена колонка events.friend_actions';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.friend_actions: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'browser_fingerprint' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN browser_fingerprint VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.browser_fingerprint';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.browser_fingerprint: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'browser_plugins' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN browser_plugins VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.browser_plugins';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.browser_plugins: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'browser_guid' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN browser_guid VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.browser_guid';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.browser_guid: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'referrer_domain' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN referrer_domain VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.referrer_domain';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.referrer_domain: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'ip_state' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN ip_state VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.ip_state';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.ip_state: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'active_test_path_assignments' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN active_test_path_assignments VARCHAR(255);
        RAISE NOTICE 'Добавлена колонка events.active_test_path_assignments';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.active_test_path_assignments: %', SQLERRM;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'events' AND column_name = 'service_charge_id' 
                   AND table_schema = 'public') THEN
        ALTER TABLE events ADD COLUMN service_charge_id BIGINT;
        RAISE NOTICE 'Добавлена колонка events.service_charge_id';
    END IF;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'Ошибка добавления колонки events.service_charge_id: %', SQLERRM;
END $$;


-- ==================================
-- ПРОВЕРКА РЕЗУЛЬТАТОВ
-- ==================================
SELECT table_name, column_name, data_type 
FROM information_schema.columns 
WHERE table_name IN ('users', 'links', 'affiliates', 'events') 
  AND table_schema = 'public' 
ORDER BY table_name, ordinal_position;

-- ДОБАВЛЕНИЕ КОЛОНОК ЗАВЕРШЕНО
