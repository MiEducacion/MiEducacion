# frozen_string_literal: true

module ApplicationHelper
  def device
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/

    "desktop"
  end

  def client_side_app_settings
    site_settings = {
      title: SiteSettings.site_title,
      site_logo: SiteSettings.site_logo,
      public_site: SiteSettings.public_site,
      show_site_banner: SiteSettings.show_site_banner,
      site_banner_content: SiteSettings.site_banner_content
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
