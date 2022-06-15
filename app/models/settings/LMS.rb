# frozen_string_literal: true

module Settings
  class LMS < Base
    self.table_name = :settings_lms

    setting :copyright_start_year,
            type: :integer,
            default: ApplicationConfig["MIEDUCACION_COPYRIGHT_START_YEAR"] || Time.zone.today.year

    setting :banner_show, type: :string
    setting :banner_content, type: :string
  end
end
