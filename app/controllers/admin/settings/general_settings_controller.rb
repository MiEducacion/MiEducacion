# frozen_string_literal: true

module Admin
  module Settings
    class GeneralSettingsController < Admin::Settings::BaseController
      def create
        result = ::Settings::General::Upsert.call(settings_params)
        if result.success?
          render json: { message: I18n.t("js.core.success_settings") }, status: :ok
        else
          render json: { error: result.errors.to_sentence }, status: :unprocessable_entity
        end
      end

      private

      def authorization_resource
        ::Settings::General
      end

      def settings_params
        params.require(:settings_general)&.permit(
          settings_keys.map(&:to_sym)
        )
      end

      def settings_keys
        ::Settings::General.keys
      end
    end
  end
end
