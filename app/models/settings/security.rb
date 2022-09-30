# frozen_string_literal: true

module Settings
  class Security < Base
    self.table_name = :settings_securities

    # CAS
    setting :enable_cas_login, default: false, type: :boolean
    setting :cas_sso_host, type: :string
    setting :cas_sso_port, default: "443", type: :integer
    setting :cas_sso_path, default: "", type: :string
    setting :cas_enable_ssl, default: true, type: :boolean
    setting :cas_sso_login_url, default: "/login", type: :boolean
    setting :cas_sso_logout_url, default: "/logout", type: :boolean
    setting :cas_sso_service_validate_url, default: "/service_validate_url", type: :boolean
    setting :cas_sso_uid_field, default: "user", type: :string

    setting :enable_oauth_login, default: false, type: :boolean
  end
end
