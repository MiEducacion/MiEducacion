# frozen_string_literal: true

module ApplicationHelper
  def device
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/

    "desktop"
  end

  def site_name
    @site_name ||= Settings::General.site_name
  end

  def client_side_app_settings
    # I could probably make this more dynamic in the future?
    @g = Settings::General
    @s = Settings::Security
    site_settings = {
      title: @g.site_name,
      site_logo: @g.original_logo.presence || "/images/default/mieducacion_default_siteLogo.svg",
      site_description: @g.site_description,
      site_shortname: @g.site_shortname,
      public_site: @g.public,
      force_redirect_private: @g.force_redirect_private,
      show_site_banner: @g.show_site_banner,
      site_banner_content: @g.site_banner_content,
      enable_cas_login: @s.enable_cas_login,
      enable_oauth_login: @s.enable_oauth_login
    }

    if current_user&.has_role?(:admin)
      site_settings = site_settings.merge(
        wizard_completed: Settings::Developer.wizard_completed,
        bypass_wizard_check: Settings::Developer.bypass_wizard_check
      )
    end

    site_settings
  end

  def user_logged_in_status
    user_signed_in? ? "logged-in" : "logged-out"
  end

  def preloaded_json
    {
      SiteSettings: client_side_app_settings,
      currentUser: current_session,
      isMobile: device == "mobile"
    }.to_json
  end

  def current_session
    return unless user_signed_in?

    current_user_dump
  end

  def include_splash?
    Settings::General.enable_splash_screen
  end

  def core_setup_data
    setup_data = {
      enable_report_to_logster: Settings::Developer.enable_report_to_logster,
      twemoji_cdn: Settings::LMS.twemoji_cdn
    }
  end
end
