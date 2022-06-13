# frozen_string_literal: true

Rails.application.reloader.to_prepare do
  Rails.application.configure do
    #  config.force_ssl = SiteSettings.force_https
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.i18n.default_locale = Settings::General.default_locale
  end
end
