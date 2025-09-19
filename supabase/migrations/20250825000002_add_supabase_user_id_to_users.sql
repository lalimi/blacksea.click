-- Add Supabase user ID to users table for synchronization

ALTER TABLE users ADD COLUMN IF NOT EXISTS supabase_user_id UUID;
CREATE UNIQUE INDEX IF NOT EXISTS index_users_on_supabase_user_id ON users (supabase_user_id);

-- Add soft delete support
ALTER TABLE users ADD COLUMN IF NOT EXISTS deleted_at TIMESTAMP WITH TIME ZONE;
CREATE INDEX IF NOT EXISTS index_users_on_deleted_at ON users (deleted_at);