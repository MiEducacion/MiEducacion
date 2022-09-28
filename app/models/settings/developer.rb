# frozen_string_literal: true

module Settings
  class Developer < Base
    self.table_name = :settings_developers

     setting :wizard_completed, default: false, type: :boolean
     setting :bypass_wizard_check, default: false, type: :boolean
     setting :enable_report_to_logster, default: true, type: :boolean # JS Error reports
  end
end