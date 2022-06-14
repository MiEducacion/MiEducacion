module Settings
  class General
    module Upsert
      PARAMS_TO_BE_CLEANED = %i[].freeze

      def self.call(settings)
        params_to_clean = settings.except(:logo)

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
    end
  end
end
