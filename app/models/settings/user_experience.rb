module Settings
  class UserExperience < Base
    self.table_name = :settings_user_experiences

    HEX_COLOR_REGEX = /\A#(\h{6}|\h{3})\z/

    setting :primary_brand_color_hex, type: :string, default: "#4527a0", validates: {
                                        format: {
                                          with: HEX_COLOR_REGEX,
                                          message: "must be be a 3 or 6 character hex (starting with #)",
                                        },
                                      }
    # a non-public instance will redirect all unauthenticated pages to the registration page.
    setting :default_locale, type: :string, default: "en"
  end
end
