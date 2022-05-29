class AppController < ApplicationController
layout 'application'
  before_action :authenticate_user!, unless: -> { SiteSettings.public_site == true || SiteSettings.force_redirect_private == false}
  def home
  end

  def app
    
  end
end