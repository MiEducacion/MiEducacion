class Session::CurrentUserController < ApplicationController
    before_action :authenticate_user!
    def index
        if user_signed_in?
            render json: current_user
            puts current_user
            puts user_signed_in?
        else
            render json: {}, status: 401
            puts user_signed_in?
        end
    end
end