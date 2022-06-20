# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :admin?

    def index
      data = {
        booted_at: MiEducacion::BOOTED_AT,
        version_check: {
          installed_version: MiEducacion::Application::Version::FULL,
          installed_sha: MiEducacion.git_version,
          git_branch: MiEducacion.git_branch,
          last_commit_date: MiEducacion.last_commit_date
        }
      }
      respond_to do |format|
        format.html
        format.json do
          render json: data
        end
      end
    end

    private

    def admin?
      render status: 404 unless current_user.has_role?(:admin)
    end
  end
end
