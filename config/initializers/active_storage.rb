# frozen_string_literal: true

Rails.application.configure do
  if Rails.env.development?
    config.after_initialize do
      ActiveStorage::Current.url_options = {
        host: 'localhost',
        port: 3000,
        protocol: 'http'
      }
    end
  end
end