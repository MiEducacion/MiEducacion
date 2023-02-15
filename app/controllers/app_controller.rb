# frozen_string_literal: true

class AppController < ApplicationController
  layout "application"
  before_action :authenticate_user!, unless: :should_render_for_anon

  def home; end

  def app; end

  def custom_stylesheet
    if Settings::LMS.enable_custom_styles?
      render body: Settings::LMS.custom_style, content_type: "text/css"
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  def login_required
    redirect_to '/' unless !current_user
  end

  private

  def should_render_for_anon
    SiteSetting.public_site? || !SiteSetting.force_redirect_private?
  end
end
