# frozen_string_literal: true

module Settings
  class LMS < Base
    self.table_name = :settings_lms

    setting :copyright_start_year, type: :integer, default: Time.zone.today.year

    setting :enable_custom_styles, type: :boolean, default: false
    setting :custom_style, type: :text
    setting :twemoji_cdn, type: :string, default: 'https://twemoji.maxcdn.com/v/14.0.2/'
    setting :enable_additional_head_content, type: :boolean, default: false
    setting :additional_head_content, type: :text
  end
end
