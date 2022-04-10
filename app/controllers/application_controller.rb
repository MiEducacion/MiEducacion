class ApplicationController < ActionController::Base
        skip_before_action :verify_authenticity_token, :only => :create
        include DeviseTokenAuth::Concerns::SetUserByToken
end
