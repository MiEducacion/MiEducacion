# frozen_string_literal: true

class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?

  def index
    data = {
      booted_at: MiEducacion::BOOTED_AT,
      version_check: {
        installed_version: MiEducacion::Application::Version::FULL,
        installed_sha: MiEducacion.git_version,
        git_branch: MiEducacion.git_branch,
      },
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
    redirect_to "/not_found", status: 301 unless current_user.has_role?(:admin)
    # Alexander: I wonder if there is a way to return a 404 without redirecting?
  end
end
