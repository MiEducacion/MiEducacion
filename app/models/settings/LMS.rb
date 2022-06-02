# frozen_string_literal: true

module Settings
  class LMS < Base
    self.table_name = :settings_lms

    setting :copyright_start_year,
            type: :integer,
            default: ApplicationConfig["MIEDUCACION_COPYRIGHT_START_YEAR"] || Time.zone.today.year
    setting :force_redirect_private,
            type: :boolean,
            default: ApplicationConfig["MIEDUCACION_FORCE_REDIRECT_PRIVATE"] || true
    setting :private,
            type: :boolean,
            default: ApplicationConfig["MIEDUCACION_PRIVATE"] || true

    setting :banner_show, type: :string
    setting :banner_content, type: :string
  end
end
