class AppController < ApplicationController
layout 'mieducacion_web'
  before_action :authenticate_user!, unless: -> { SiteSettings.public_site == true}
  def home
  end

  def app
    
  end
end