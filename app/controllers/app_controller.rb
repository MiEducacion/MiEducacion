# frozen_string_literal: true

class AppController < ApplicationController
  layout "application"
  before_action :authenticate_user!, unless: lambda {
                                               SiteSettings.public_site || !SiteSettings.force_redirect_private
                                             }

  def home; end

  def app; end
end
