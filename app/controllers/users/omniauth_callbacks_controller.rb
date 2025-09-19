# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Facebook callback
  def facebook
    @user = User.from_facebook_omniauth(request.env["omniauth.auth"])
    
    if @user&.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url, alert: @user&.errors&.full_messages&.join("\n")
    end
  end

  # Google callback
  def google_oauth2
    begin
      @user = User.find_or_create_for_google_oauth2(request.env["omniauth.auth"])
      
      if @user&.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
      else
        session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
        redirect_to new_user_registration_url, alert: @user&.errors&.full_messages&.join("\n")
      end
    rescue ActiveRecord::ConnectionNotEstablished, PG::ConnectionBad => e
      Rails.logger.error "Database connection failed in Google OAuth callback: #{e.message}"
      redirect_to login_path, alert: "Не удается подключиться к базе данных. Попробуйте позже или войдите через email."
    end
  end

  # Handle authentication failure
  def failure
    redirect_to root_path, alert: "Помилка автентифікації: #{failure_message}"
  end

  private

  def failure_message
    exception = request.env["omniauth.error"]
    error = request.env["omniauth.error.type"]
    
    case error.to_s
    when "access_denied"
      "Доступ відхилено користувачем"
    when "invalid_credentials" 
      "Неправильні дані автентифікації"
    when "timeout"
      "Час очікування вичерпано"
    else
      exception&.message || "Невідома помилка"
    end
  end
end