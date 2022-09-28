# frozen_string_literal: true

class AppController < ApplicationController
  layout "application"
  before_action :authenticate_user!, unless: lambda {
                                               Settings::General.public || !Settings::General.force_redirect_private?
                                             }

  def home; end

  def app; end

  def custom_stylesheet
    if Settings::LMS.enable_custom_styles?
      render body: Settings::LMS.custom_style, content_type: 'text/css'
    else 
     render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end
end
