# frozen_string_literal: true

class SessionController < ApplicationController
  before_action :authenticate_user!
  include Session::CurrentUserHelper

  def current_session
    if user_signed_in?
      render json: current_user_dump, content_type: "application/json"
    end
    puts user_signed_in?
  end
end
