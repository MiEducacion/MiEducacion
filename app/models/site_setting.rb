# RailsSettings Model
class SiteSetting < RailsSettings::Base
  AVAILABLE_LOCALES = %w[
    es
    en
    pt-BR
  ]

  scope :general do
    field :site_name,
          default: (ENV["MIEDUCACION_SITE_NAME"] || "MiEducación"),
          validates: { presence: true }

    field :site_description,
          type: :string

    field :site_shortname,
          type: :string,
          default: (ENV["MIEDUCACION_SHORTNAME"] || "MiEducación")

    field :developer_emails,
          type: :array,
          default: (ENV["MIEDUCACION_DEVELOPER_EMAILS"] || "admin@admin.com"),
          separator: /[\s,]+/,
          hidden: true

    field :public_site,
          type: :boolean,
          default: (ENV["MIEDUCACION_PUBLIC_SITE"] || true)

    field :force_redirect_private,
          type: :boolean,
          default: (ENV["MIEDUCACION_FORCE_REDIRECT_PRIVATE"] || true)

    field :show_site_banner,
          type: :boolean,
          default: false

    field :site_banner_content,
          type: :string

    field :favicon_url,
          type: :image,
          default: "/favicon.ico",
          hidden: true

    field :site_logo,
          type: :image,
          default: "/images/default/mieducacion_default_siteLogo.svg"

    field :resized_site_logo,
          type: :image,
          hidden: true

    field :app_icon,
          type: :image,
          default: "/images/default/mieducacion_default_appicon_512x512.png"

    field :default_locale,
          type: :list,
          default: ApplicationConfig["MIEDUCACION_DEFAULT_LOCALE"] || "en",
          values: AVAILABLE_LOCALES,
          validates: { presence: true, inclusion: { in: AVAILABLE_LOCALES } }

    # Social

    # Feature: OpenGraph Cards
    field :enable_opengraph,
          type: :boolean,
          default: true

    field :opengraph_sitename,
          type: :string,
          default: SiteSetting.site_name

    field :opengraph_image,
          type: :string,
          default: SiteSetting.site_logo

    field :enable_splash_screen,
          type: :boolean,
          default: true
  end

  scope :integrations do
    field :enable_discourse_connect_provider,
          type: :boolean,
          default: false

    field :discourse_connect_url,
          type: :string

    field :discourse_connect_secret,
          type: :string,
          secret: true
  end

  scope :personalization do
    field :primary_color,
          type: :color_picker,
          default: "#4527A0"

    field :secondary_color,
          type: :color_picker
  end

  scope :experimental do
    field :enable_web_updater,
          type: :boolean,
          default: true
  end

  # Internal use only

  scope :internal do
    field :waiting_on_first_user,
          type: :boolean,
          default: !User.exists?,
          hidden: true
  end

  def self.exposed_settings
    exposed_settings = where(exposed_to_client: true)
    exposed_settings.map { |setting| { key: setting.var, value: setting.value } }
  end
end
