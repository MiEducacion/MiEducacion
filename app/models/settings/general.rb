# frozen_string_literal: true

module Settings
  class General < Base
    self.table_name = :settings_generals

    # Meta
    setting :admin_action_taken_at, type: :datetime, default: Time.current

    setting(
      :site_name,
      type: :string,
      default: ApplicationConfig["MIEDUCACION_SITE_NAME"] || "MiEducacion",
      validates: {
        format: {
          with: /\A[^[<|>]]+\Z/,
          message: "may not include the \"<\" nor \">\" character"
        }
      }
    )
    setting :site_description, type: :string
    setting :site_shortname, type: :string, default: ApplicationConfig["MIEDUCACION_SHORTNAME"] || "MiEducacion"

    setting :force_redirect_private,
            type: :boolean,
            default: ApplicationConfig["MIEDUCACION_FORCE_REDIRECT_PRIVATE"] || true

    setting :public,
            type: :boolean,
            default: ApplicationConfig["MIEDUCACION_PUBLIC"] || false

    setting :show_site_banner, type: :boolean, default: false
    setting :site_banner_content, type: :string

    # Core setup
    # setting :waiting_on_first_user, type: :boolean, default: !User.exists?

    # Images

    setting :favicon_url, type: :string, default: proc { URL.local_image("favicon.ico") }
    setting :site_logo,
            type: :string
    setting :original_logo, type: :string
    setting :resized_logo, type: :string
    setting :app_icon,
            type: :string,
            default: ApplicationConfig["MIEDUCACION_APP_ICON"] || "/images/default/mieducacion_default_appicon.png"
    setting :default_locale,
            type: :string,
            default: ApplicationConfig["MIEDUCACION_DEFAULT_LOCALE"] || "en"

    # Social

    # Feature: OpenGraph Cards
    setting :enable_opengraph, type: :boolean, default: true
    setting :opengraph_sitename, type: :string, default: Settings::General.site_name
    setting :opengraph_image, type: :string, default: Settings::General.site_logo
  end
end
