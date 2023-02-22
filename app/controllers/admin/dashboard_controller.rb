# frozen_string_literal: true

module Admin
  class DashboardController < Admin::BaseController

    def index
      data = {
        booted_at: MiEducacion::BOOTED_AT,
        version_check: {
          installed_version: MiEducacion::Application::Version::FULL,
          installed_sha: MiEducacion.git_version,
          git_branch: MiEducacion.git_branch,
          last_commit_date: MiEducacion.last_commit_date,
          updates_available: MiEducacion::Updater.updates_available?,
          remote_version: MiEducacion::Updater.remote_version,
          versions_diff: MiEducacion::Updater.versions_diff,
        }
      }
      respond_to do |format|
        format.html
        format.json do
          render json: data
        end
      end
    end

  def site_settings
    @settings = SiteSetting.all
    render json: {site_settings: @settings}
  end

    private

    def admin?
      render status: 404 unless current_user.has_role?(:admin)
    end
  end
end
