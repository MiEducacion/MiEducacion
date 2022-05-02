Rails.application.configure do
    config.force_ssl = SiteSettings.force_https
end