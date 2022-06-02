# frozen_string_literal: true

# RailsSettings Model
class SiteSettings < RailsSettings::Base
  cache_prefix { "v2" }

  scope :application do
    # Define your fields
    # field :host, type: :string, default: "http://localhost:3000"
    field :default_locale, default: "en", type: :string
    # field :confirmable_enable, default: "0", type: :boolean
    field :public_site, default: ENV.fetch("MIEDUCACION_PUBLIC_SITE", "0"), type: :boolean
    field :developer_emails,
          default: (ENV.fetch("MIEDUCACION_DEVELOPER_EMAILS") do
                      ["developer@mieducacion.net"]
                    end), type: :array, readonly: true
    field :force_https, default: ENV.fetch("MIEDUCACION_FORCE_HTTPS", "0"), type: :boolean
    # field :auth_google_client_id, default: (ENV["AUTH_GOOGLE_CLIENT_ID"]), type: :string, readonly: true
    # field :auth_google_client_secret, default: (ENV["AUTH_GOOGLE_CLIENT_SECRET"]), type: :string, readonly: true
  end

  scope :client_side do
    field :force_redirect_private, default: ENV.fetch("MIEDUCACION_FORCE_REDIRECT_PRIVATE", "0"), type: :boolean
    field :site_title, default: ENV.fetch("MIEDUCACION_SITE_TITLE", "MiEducación"),
                       validates: { presence: true, length: { in: 2..255 } }
    field :site_logo, default: ENV.fetch("MIEDUCACION_SITE_LOGO", "/images/default/mieducacion_default_siteLogo.svg"),
                      type: :string
    field :app_icon, default: ENV.fetch("MIEDUCACION_APP_ICON", "/images/default/mieducacion_default_appicon.png"),
                     type: :string
    field :pwa_shortname, default: ENV.fetch("MIEDUCACION_PWA_SHORTNAME", "MiEducación"), type: :string
  end

  scope :site_banner do
    field :show_site_banner, default: ENV.fetch("MIEDUCACION_SHOW_SITE_BANNER", "0"), type: :boolean
    field :site_banner_content, default: ENV.fetch("MIEDUCACION_SITE_BANNER_CONTENT", ""), type: :string
  end
end
