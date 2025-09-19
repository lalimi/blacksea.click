# frozen_string_literal: true

# Force synchronous email delivery in development for Devise emails
if Rails.env.development?
  Rails.application.config.to_prepare do
    # Override Devise's send_devise_notification method to use deliver_now instead of deliver_later
    User.class_eval do
      def send_devise_notification(notification, *args)
        devise_mailer.send(notification, self, *args).deliver_now
      end
    end
  end
end