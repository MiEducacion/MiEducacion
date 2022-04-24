class AppController < ApplicationController
layout 'mieducacion_web'
  before_action :authenticate_user!, unless: -> { SiteSettings.public_site == true || SiteSettings.force_redirect_private == false}
  def home
  end

  def app
    
  end
end