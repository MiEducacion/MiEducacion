# frozen_string_literal: true

class WizardController < ApplicationController

  layout 'wizard'

  before_action :authenticate_user!
  before_action :render_not_found_unless_admin

  def index
    respond_to do |format|
      format.html { render :text => "" }
      format.json do
        render json: {

               },
               content_type: "application/json"
      end
    end
  end

 

  private


end
