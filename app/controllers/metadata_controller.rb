# frozen_string_literal: true

class MetadataController < ApplicationController
  layout false

  def webmanifest
    expires_in 1.minutes
    render json: default_webmanifest.to_json, content_type: "application/manifest+json"
  end

  private

  def default_webmanifest
    display = "standalone"
    {
      name: Settings::General.site_name,
      short_name: Settings::General.site_shortname.presence || Settings::General.site_name.truncate(12, separator: " ",
                                                                                                        omission: ""),
      display: display,
      start_url: "/",
      background_color: "#FFF",
      theme_color: "#4527a0",
      icons: [
        {
          src: Settings::General.app_icon,
          sizes: "512x512",
          type: "image/png",
          purpose: "any",
        },
      ],
      shortcuts: [
        {
          name: I18n.t("js.lms.courses"),
          short_name: I18n.t("js.lms.courses"),
          url: "/courses",
        },
        {
          name: I18n.t("js.lms.groups"),
          short_name: I18n.t("js.lms.groups"),
          url: "/groups",
        },
        {
          name: I18n.t("js.user.inbox"),
          short_name: I18n.t("js.user.inbox"),
          url: "/my/inbox",
        },
      ],
    }
  end
end
