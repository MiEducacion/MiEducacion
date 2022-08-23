# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  respond_to :json

  # POST /sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    respond_with(resource) do |format|
      format.json { render json: {redirect_url: after_sign_in_path_for(resource)}, status: 200 }
    end
  end

end
