class ApplicationController < ActionController::Base
    before_action do
        if current_user && current_user.has_role?(:admin)
          Rack::MiniProfiler.authorize_request
        end
      end
end
