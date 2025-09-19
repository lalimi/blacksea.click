# Обработчик проблем с подключением к базе данных
# Предотвращает падение приложения при проблемах с Supabase

module DatabaseConnectionHandler
  def self.with_connection_fallback(&block)
    begin
      block.call
    rescue ActiveRecord::ConnectionNotEstablished => e
      Rails.logger.error "Database connection failed: #{e.message}"
      Rails.logger.error "Fallback mode activated"
      nil
    rescue PG::ConnectionBad => e
      Rails.logger.error "PostgreSQL connection failed: #{e.message}"
      Rails.logger.error "Fallback mode activated"
      nil
    end
  end
end

# Переопределяем User.serialize_from_session для обработки ошибок подключения
module UserConnectionFallback
  def serialize_from_session(key, _salt)
    DatabaseConnectionHandler.with_connection_fallback do
      single_key = key.is_a?(Array) ? key.first : key
      find_by(id: single_key)
    end
  end
end

# Применяем патч только если User уже определен
if defined?(User)
  User.singleton_class.prepend(UserConnectionFallback)
end