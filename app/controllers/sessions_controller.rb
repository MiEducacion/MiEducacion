class SessionsController < Devise::SessionsController
    before_action :authenticate_user!
    respond_to :json

    def current_user
        @current_user
      end
    end