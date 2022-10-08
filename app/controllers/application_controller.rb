# frozen_string_literal: true

class ApplicationController < ActionController::Base

    def render_not_found_unless_admin
        render template: "exceptions/not_found", layout: "exception", status: 404 unless current_user.has_role?(:admin)
    end
end
