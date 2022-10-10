# frozen_string_literal: true

Logster.config.use_full_hostname = true
Logster.config.enable_js_error_reporting = Settings::Developer.enable_report_to_logster


Logster.config.project_directories = [
    {
        path: Rails.root.to_s,
        url: "https://github.com/MiEducacion/MiEducacion",
        main_app: true
    }
]