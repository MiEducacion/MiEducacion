# frozen_string_literal: true

namespace :admin do
  get "dashboard" => "dashboard#index"

  get "site_settings" => "dashboard#site_settings"
  get "updates" => "updates#index"
  post "upgrade" => "updates#run_update"
  get "updates/progress" => "updates#check_progress"

  namespace :settings do
    get "settings/*" => "base#index"
    resources :general_settings, only: [:create]
    resources :lms_settings, only: [:create]
  end

  
end
