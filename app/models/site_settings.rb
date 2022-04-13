# RailsSettings Model
class SiteSettings < RailsSettings::Base
  cache_prefix { "v1" }

  scope :application do
  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  field :developer_emails, default: (ENV["MIEDUCACION_DEVELOPER_EMAILS"] || "developer@mieducacion.net"), type: :array, readonly: true
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
  end
end
