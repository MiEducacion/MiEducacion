# frozen_string_literal: true

class Admin::Settings::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :admin?
    def create
        result = upsert_config(settings_params)

        if result.success?
          render json: { message: I18nJS.t("core.success_settings") }, status: :ok
        else
          render json: { error: result.errors.to_sentence }, status: :unprocessable_entity
        end
      end

      private

      def upsert_config(settings)
        ::Settings::Upsert.call(settings, authorization_resource)
      end


      def settings_params
        params
          .require(:"settings_#{authorization_resource.name.demodulize.underscore}")
          .permit(*authorization_resource.keys)
      end

      def admin?
        render :status => 404 unless current_user.has_role?(:admin)
      end
    end
  end
end
