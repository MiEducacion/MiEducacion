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

    @s = Settings::Security

    site_settings = {}

    general_settings = [
      :site_name,
      :original_logo,
      :site_logo,
      :site_description,
      :site_shortname,
      :public_site,
      :force_redirect_private,
      :show_site_banner,
      :site_banner_content,
      :enable_opengraph
    ]

    general_settings.each { |setting_key| 
      if Settings::General.value_of(setting_key).present?
      site_settings.merge!("#{setting_key}": Settings::General.value_of(setting_key))
      else 
        site_settings.merge!("#{setting_key}": Settings::General.get_default(setting_key))
    end
    }


    if current_user&.has_role?(:admin)
      site_settings = site_settings.merge!(
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
