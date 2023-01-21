# app/controllers/admin/base_controller.rb

class Admin::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_admin
  
    private
  
    def verify_admin
      redirect_to root_path, alert: 'No tienes permisos suficientes para acceder a esta página.' unless current_user.admin?
    end
  end
  