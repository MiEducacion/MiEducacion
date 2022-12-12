# frozen_string_literal: true

module Settings
  class General
    module Upsert
      PARAMS_TO_BE_CLEANED = %i[].freeze

      def self.call(settings)
        params_to_clean = settings.except(:site_logo)

        if settings[:site_logo].present?
          logo_uploader = upload_logo(settings[:site_logo])
          logo_settings = { site_logo: logo_uploader.url, resized_site_logo: logo_uploader.resized_logo.url }
          params_to_clean = params_to_clean.merge(logo_settings)
        end

        cleaned_params = clean_params(params_to_clean)
        result = ::Settings::Upsert.call(cleaned_params, ::Settings::General)
        return result unless result.success?

        result
      end

      def self.clean_params(settings)
        PARAMS_TO_BE_CLEANED.each do |param|
          settings[param] = settings[param]&.downcase&.delete(" ") if settings[param]
        end
        settings
      end

      def self.upload_logo(image)
        LogoUploader.new.tap do |uploader|
          uploader.store!(image)
        end
      end

      private_class_method :upload_logo
    end
  end
end
