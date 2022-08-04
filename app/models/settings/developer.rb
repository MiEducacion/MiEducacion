module Settings
  class Developer < Base
    self.table_name = :settings_developers

     setting :wizard_completed, default: false, type: :boolean
     setting :bypass_wizard_check, default: false, type: :boolean
  end
end