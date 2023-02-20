class Admin::UpdatesController < Admin::BaseController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: updates_response
      end
    end
  end

  def run_update
    if !MiEducacion::Updater.updates_available?
      render json: {
        errors: [
          "No updates available"
        ],
        error_type: "no_updates_available"
      }
    elsif !SiteSetting.enable_web_updater
      render json: {
        errors: [
          "Web updater disabled"
        ],
        error_type: "web_update_disabled"
      }, status: 403
    else
      MiEducacion::Updater.run_update
      head :ok
    end
  end

  def check_progress
    progress, output = MiEducacion::Updater.run_update
    render json: { progress:, output: }
  end

  private

  def updates_response
    {
      versions_diff: MiEducacion::Updater.versions_diff,
      installed_sha: MiEducacion.git_version,
      updates_available: MiEducacion::Updater.updates_available?
    }
  end
end
