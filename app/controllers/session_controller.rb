# frozen_string_literal: true

class SessionController < ApplicationController
  include Session::CurrentUserHelper

  def current
    if user_signed_in?
      render json: current_user_dump, content_type: "application/json"
    else
      render body: nil, status: 404
    end
  end
end
