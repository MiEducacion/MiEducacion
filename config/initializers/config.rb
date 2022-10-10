# frozen_string_literal: true

Rails.application.reloader.to_prepare do
  Rails.application.configure do
    #  config.force_ssl = SiteSettings.force_https
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.i18n.default_locale = Settings::General.default_locale

    Logster.config.use_full_hostname = true
    Logster.config.enable_js_error_reporting = Settings::Developer.enable_report_to_logster

    Logster.config.project_directories = [
        {
            path: Rails.root.to_s,
            url: "https://github.com/MiEducacion/MiEducacion",
            main_app: true
        }
    ]
  end
end
