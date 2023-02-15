# RailsSettings Model
class SiteSetting < RailsSettings::Base


  scope :general do
    field :site_name, 
      default: (ENV["MIEDUCACION_SITE_NAME"] || "MiEducación"), 
      validates: {presence: true}

    field :site_description,
      type: :string

    field :site_shortname, 
      type: :string, 
      default: (ENV["MIEDUCACION_SHORTNAME"] || "MiEducación")

    field :developer_emails,
      type: :array,
      default: (ENV["MIEDUCACION_DEVELOPER_EMAILS"] || "admin@admin.com"),
      separator: /[\s,]+/

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
      type: :string,
      default: proc { URL.local_image("favicon.ico") }

    field :site_logo,
      type: :string,
      default: '/images/default/mieducacion_default_siteLogo.svg'
    
    field :resized_site_logo,
      type: :string

    field :app_icon,
            type: :string,
            default: "/images/default/mieducacion_default_appicon_512x512.png"

    field :default_locale,
            type: :string,
            default: ApplicationConfig["MIEDUCACION_DEFAULT_LOCALE"] || "en"

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


  def self.exposed_settings
    exposed_settings = self.where(exposed_to_client: true)
    exposed_settings.map { |setting| { key: setting.var, value: setting.value } }
  end
  


end
