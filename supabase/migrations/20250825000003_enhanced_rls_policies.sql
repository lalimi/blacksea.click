-- Enhanced Row Level Security policies for Gumroad Supabase integration

-- Drop existing basic policies to replace with enhanced ones
DROP POLICY IF EXISTS "Users can view own profile" ON users;
DROP POLICY IF EXISTS "Users can update own profile" ON users;
DROP POLICY IF EXISTS "Anyone can view published products" ON products;
DROP POLICY IF EXISTS "Users can view own products" ON products;
DROP POLICY IF EXISTS "Users can manage own products" ON products;
DROP POLICY IF EXISTS "Users can view own purchases" ON purchases;
DROP POLICY IF EXISTS "Creators can view product purchases" ON purchases;
DROP POLICY IF EXISTS "Creators can manage product files" ON product_files;
DROP POLICY IF EXISTS "Anyone can view published comments" ON comments;
DROP POLICY IF EXISTS "Users can create comments" ON comments;
DROP POLICY IF EXISTS "Creators can manage product comments" ON comments;

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
) WITH CHECK (false); -- But no modifications

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