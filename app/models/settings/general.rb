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
          message: "may not include the \"<\" nor \">\" character",
        },
      },
    )
    setting :site_description, type: :string
    setting :site_shortname, type: :string, default: ApplicationConfig["MIEDUCACION_SHORTNAME"] || "MiEducacion"

    # Core setup
    setting :waiting_on_first_user, type: :boolean, default: !User.exists?

    # Images

    setting :favicon_url, type: :string, default: proc { URL.local_image("favicon.ico") }
    setting :site_logo,
            type: :string,
            default: ApplicationConfig["MIEDUCACION_SITE_LOGO"] || "/images/default/mieducacion_default_siteLogo.svg"
    setting :app_icon,
            type: :string,
            default: ApplicationConfig["MIEDUCACION_APP_ICON"] || "/images/default/mieducacion_default_appicon.png"
  end
end
