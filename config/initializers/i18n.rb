# frozen_string_literal: true

# Custom I18n configuration for BlackSea
Rails.application.config.after_initialize do
  # Force reload of Ukrainian translations
  I18n.backend.load_translations

  # Manually load Ukrainian small_bets translations if not loaded
  if I18n.backend.send(:translations)[:uk].nil? || I18n.backend.send(:translations)[:uk][:small_bets].nil?
    uk_translations = YAML.load_file(Rails.root.join('config', 'locales', 'uk.yml'))
    if uk_translations && uk_translations['uk'] && uk_translations['uk']['small_bets']
      I18n.backend.store_translations(:uk, uk_translations['uk'])
    end
  end
end