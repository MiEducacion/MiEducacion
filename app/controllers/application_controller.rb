# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :check_maintenance_mode 

    def render_not_found_unless_admin
        render template: "exceptions/not_found", layout: "exception", status: 404 unless current_user.has_role?(:admin)
    end

    private
    
    def check_maintenance_mode
        render template: "exceptions/maintenance_mode", layout: "exception", status: 502 unless !MiEducacion.maintenance_enabled
    end
end
