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
    site_settings =
      {
        title: Settings::General.site_name,
        site_logo: Settings::General.site_logo,
        site_description: Settings::General.site_description,
        public_site: Settings::General.public,
        force_redirect_private: Settings::General.force_redirect_private,
        show_site_banner: Settings::General.show_site_banner,
        site_banner_content: Settings::General.site_banner_content
      }
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

    @u = current_user

    current_session = {
      id: @u.id,
      email: @u.email,
      is_student: @u.has_role?(:student),
      is_teacher: @u.has_role?(:teacher),
      is_principal: @u.has_role?(:teacher),
      is_admin: @u.has_role?(:admin),
      is_new_user: @u.new_user?,
      trusted: @u.has_role?(:trusted),
      moderator: @u.has_role?(:moderator)
    }
  end
end
