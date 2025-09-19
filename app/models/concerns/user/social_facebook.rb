# frozen_string_literal: true

module User::SocialFacebook
  extend ActiveSupport::Concern

  included do
    # Validation для Facebook ID (поля должны быть уже в БД)
    validates :facebook_id, uniqueness: true, allow_blank: true
  end

  class_methods do
    # Find or create user from Facebook OAuth data
    def from_facebook_omniauth(auth)
      info = auth.info
      credentials = auth.credentials
      
      # Try to find existing user by Facebook ID
      user = find_by(facebook_id: auth.uid)
      
      # If not found, try to find by email
      if user.nil? && info.email.present?
        user = find_by(email: info.email)
        if user
          # Link existing user account with Facebook
          user.update!(
            facebook_id: auth.uid,
            facebook_name: info.name,
            facebook_email: info.email,
            facebook_picture_url: info.image
          )
        end
      end
      
      # Create new user if not found
      if user.nil?
        user = create!(
          email: info.email,
          name: info.name,
          facebook_id: auth.uid,
          facebook_name: info.name,
          facebook_email: info.email,
          facebook_picture_url: info.image,
          password: Devise.friendly_token[0, 20],
          confirmed_at: Time.current # Auto-confirm social users
        )
      end
      
      user
    rescue => e
      Rails.logger.error "Facebook OAuth error: #{e.message}"
      nil
    end
  end

  # Check if user has Facebook connected
  def facebook_connected?
    facebook_id.present?
  end

  # Get Facebook profile picture
  def facebook_avatar_url
    facebook_picture_url || "https://graph.facebook.com/#{facebook_id}/picture?type=large" if facebook_id
  end
end