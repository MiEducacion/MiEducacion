# frozen_string_literal: true

class WizardController < ApplicationController
  include Wicked::Wizard

  layout "wizard"

  steps :welcome, :site_info, :find_friends

  before_action :authenticate_user!
  before_action :admin?
  before_action :set_progress, only: [:show]

  def show
    case step
    when :welcome
      @welcome = "Welcome"
    when :site_info
      @s = SiteSettings
      @site_info = [
        {
          site_title: @s.site_title
        }
      ]
    end

    render_wizard
  end

  def update
    case step
    when :welcome
      jump_to(:site_info)
    end

    render_wizard
  end

  private

  def admin?
    redirect_to "/not_found", status: 301 unless current_user.has_role?(:admin)
  end

  def set_progress
    @progress = if wizard_steps.any? && wizard_steps.index(step).present?
                  ((wizard_steps.index(step) + 1).to_d / wizard_steps.count.to_d) * 100
                else
                  0
                end
  end

  def dev_email_param
    params.require(:dev_email)
  end
end
