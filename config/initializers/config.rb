Rails.application.reloader.to_prepare do
    Rails.application.configure do
        config.force_ssl = SiteSettings.force_https
    end
end