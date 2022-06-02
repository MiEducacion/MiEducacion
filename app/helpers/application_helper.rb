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
    site_settings = {
      title: Settings::General.site_name,
      site_logo: Settings::General.site_logo,
      public_site: Settings::LMS.private,
      show_site_banner: Settings::LMS.banner_show,
      site_banner_content: Settings::LMS.banner_content
    }
  end

  def user_logged_in_status
    user_signed_in? ? "logged-in" : "logged-out"
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
      is_new_user: @u.new_user?
    }
  end
end
