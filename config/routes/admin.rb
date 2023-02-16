# frozen_string_literal: true

namespace :admin do
  get "dashboard" => "dashboard#index"
  resources :site_settings, only: [:create, :index]
  get "updates" => "updates#index"
  post "upgrade" => "updates#run_update"
  get "updates/progress" => "updates#check_progress"

  namespace :settings do
    resources :lms_settings, only: [:create]
  end

  
end
