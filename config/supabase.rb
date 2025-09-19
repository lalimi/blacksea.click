# Supabase configuration for Rails application
# This file sets up Supabase client for cases where we need to use Supabase features
# beyond basic PostgreSQL connectivity (Auth, Storage, Real-time, etc.)

class SupabaseConfig
  class << self
    def url
      ENV['SUPABASE_URL'] || 'https://qewjnagvsbnwgamrrrwg.supabase.co'
    end

    def anon_key
      ENV['SUPABASE_ANON_KEY'] || 'your_anon_key_here'
    end

    def service_role_key
      ENV['SUPABASE_SERVICE_ROLE_KEY'] || 'your_service_role_key_here'
    end

    def configured?
      url.present? && anon_key.present? && service_role_key.present?
    end

    def database_url
      "postgresql://#{ENV['DATABASE_USERNAME']}:#{ENV['DATABASE_PASSWORD']}@#{ENV['DATABASE_HOST']}:#{ENV['DATABASE_PORT']}/#{ENV['DATABASE_NAME']}?sslmode=require"
    end

    # Storage configuration
    def storage_bucket
      ENV['SUPABASE_STORAGE_BUCKET'] || 'gumroad-files'
    end

    # Auth configuration
    def auth_redirect_url
      case Rails.env
      when 'development'
        'http://localhost:3000/auth/callback'
      when 'production'
        ENV['AUTH_REDIRECT_URL'] || 'https://yourdomain.com/auth/callback'
      else
        'http://localhost:3000/auth/callback'
      end
    end
  end
end

# Log configuration status
Rails.application.config.after_initialize do
  if SupabaseConfig.configured?
    Rails.logger.info "✅ Supabase configured with URL: #{SupabaseConfig.url}"
  else
    Rails.logger.warn "⚠️ Supabase not fully configured. Check environment variables."
  end
end