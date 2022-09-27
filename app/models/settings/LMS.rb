# frozen_string_literal: true

module Settings
  class LMS < Base
    self.table_name = :settings_lms

    setting :copyright_start_year, type: :integer, default: ApplicationConfig["MIEDUCACION_COPYRIGHT_START_YEAR"] || Time.zone.today.year

    setting :enable_custom_styles, type: :boolean, default: false
    setting :custom_style, type: :text
  end
end
