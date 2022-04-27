class Session::CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = User.includes(:profile)
    if user_signed_in?
      render json: { 
                     current_user: @current_user.as_json(:except => [:created_at, :updated_at]) }
      puts user_signed_in?
    else
      render json: {}, status: 401
      puts user_signed_in?
    end
  end
end
