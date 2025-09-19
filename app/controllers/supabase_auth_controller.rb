class SupabaseAuthController < ApplicationController
  # Контроллер для интеграции с Supabase Auth
  # Обрабатывает коллбэки аутентификации и синхронизацию пользователей

  skip_before_action :verify_authenticity_token, only: [:callback, :webhook]
  
  def callback
    # Обработка коллбэка от Supabase Auth
    access_token = params[:access_token]
    refresh_token = params[:refresh_token]
    
    if access_token.present?
      begin
        # Декодирование JWT токена для получения информации о пользователе
        user_info = decode_supabase_token(access_token)
        
        # Поиск или создание пользователя в локальной базе
        user = find_or_create_user_from_supabase(user_info)
        
        if user.persisted?
          # Сохранение токенов Supabase в сессии
          session[:supabase_access_token] = access_token
          session[:supabase_refresh_token] = refresh_token
          
          # Авторизация пользователя в Rails
          sign_in(user)
          
          redirect_to dashboard_path, notice: 'Успешно авторизованы через Supabase'
        else
          redirect_to new_user_session_path, alert: 'Ошибка при создании аккаунта'
        end
      rescue => e
        Rails.logger.error "Supabase Auth callback error: #{e.message}"
        redirect_to new_user_session_path, alert: 'Ошибка аутентификации'
      end
    else
      redirect_to new_user_session_path, alert: 'Отсутствует токен доступа'
    end
  end

  def webhook
    # Вебхук для синхронизации событий аутентификации Supabase
    # (создание, обновление, удаление пользователей)
    
    begin
      payload = request.body.read
      signature = request.headers['HTTP_X_SUPABASE_SIGNATURE']
      
      # Проверка подписи вебхука (если настроена)
      unless verify_webhook_signature(payload, signature)
        render json: { error: 'Invalid signature' }, status: :unauthorized
        return
      end
      
      event_data = JSON.parse(payload)
      handle_supabase_event(event_data)
      
      render json: { status: 'ok' }
    rescue => e
      Rails.logger.error "Supabase webhook error: #{e.message}"
      render json: { error: 'Webhook processing failed' }, status: :internal_server_error
    end
  end

  def logout
    # Выход из Supabase Auth и локальной сессии
    session.delete(:supabase_access_token)
    session.delete(:supabase_refresh_token)
    sign_out(current_user) if current_user
    
    redirect_to root_path, notice: 'Успешно вышли из системы'
  end

  private

  def decode_supabase_token(token)
    # Декодирование JWT токена Supabase
    # В продакшене следует проверять подпись токена
    
    require 'jwt'
    require 'base64'
    
    # Простое декодирование без проверки подписи (только для разработки!)
    decoded_token = JWT.decode(token, nil, false)
    decoded_token.first
  rescue => e
    Rails.logger.error "Token decode error: #{e.message}"
    {}
  end

  def find_or_create_user_from_supabase(user_info)
    email = user_info['email']
    supabase_user_id = user_info['sub']
    
    return User.new unless email.present?

    user = User.find_by(email: email)
    
    unless user
      # Создание нового пользователя
      user = User.new(
        email: email,
        name: user_info['user_metadata']&.dig('name') || user_info['email'],
        username: generate_username_from_email(email),
        confirmed_at: Time.current, # Пользователь уже подтвержден в Supabase
        password: Devise.friendly_token[0, 20] # Случайный пароль
      )
      user.save
    end
    
    # Сохранение ID пользователя Supabase для синхронизации
    user.update(supabase_user_id: supabase_user_id) if user.persisted?
    
    user
  end

  def handle_supabase_event(event_data)
    event_type = event_data['type']
    user_data = event_data['record']
    
    case event_type
    when 'INSERT'
      handle_user_created(user_data)
    when 'UPDATE'
      handle_user_updated(user_data)
    when 'DELETE'
      handle_user_deleted(user_data)
    end
  end

  def handle_user_created(user_data)
    # Создание пользователя при регистрации в Supabase
    find_or_create_user_from_supabase(user_data)
  end

  def handle_user_updated(user_data)
    # Обновление данных пользователя
    user = User.find_by(supabase_user_id: user_data['id'])
    if user && user_data['email'] != user.email
      user.update(email: user_data['email'])
    end
  end

  def handle_user_deleted(user_data)
    # Деактивация пользователя при удалении в Supabase
    user = User.find_by(supabase_user_id: user_data['id'])
    user&.update(deleted_at: Time.current)
  end

  def generate_username_from_email(email)
    base_username = email.split('@').first.gsub(/[^a-zA-Z0-9]/, '')
    username = base_username
    counter = 1
    
    while User.exists?(username: username)
      username = "#{base_username}#{counter}"
      counter += 1
    end
    
    username
  end

  def verify_webhook_signature(payload, signature)
    # Проверка подписи вебхука Supabase
    # Реализуйте проверку если используете защищенные вебхуки
    true # Упрощенная версия
  end
end