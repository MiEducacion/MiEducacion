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
    @g = Settings::General
    site_settings = {
        title: @g.site_name,
        site_logo: @g.original_logo.presence || "/images/default/mieducacion_default_siteLogo.svg",
        site_description: @g.site_description,
        site_shortname: @g.site_shortname,
        public_site: @g.public,
        force_redirect_private: @g.force_redirect_private,
        show_site_banner: @g.show_site_banner,
        site_banner_content: @g.site_banner_content
      }

    if current_user && current_user.has_role?(:admin)
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

end
