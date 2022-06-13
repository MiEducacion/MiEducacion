# frozen_string_literal: true

class SessionController < ApplicationController
  before_action :authenticate_user!

  def current_session
    if user_signed_in?
      @u = current_user

      render json: {
               current_user: {
                 id: @u.id,
                 email: @u.email,
                 roles: {
                   is_teacher: @u.has_role?(:teacher),
                   is_principal: @u.has_role?(:teacher),
                   is_admin: @u.has_role?(:admin),
                 },
               },
             }
    else
      render json: {}, status: 401
    end
    puts user_signed_in?
  end
end
