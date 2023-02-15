class Admin::UpdatesController < Admin::BaseController
    def index
        respond_to do |format|
        format.html
        format.json {
            render json: updates_response
        }
      end
    end

    def run_update
        render json: {
            errors: [
                "No updates available"
            ],
            error_type: "no_updates_available"
        } if !MiEducacion::Updater.updates_available?

        MiEducacion::Updater.run_update
        head :ok

    end

    def check_progress
        progress, output = MiEducacion::Updater.run_update
        render json: { progress: progress, output: output }
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
  