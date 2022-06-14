# frozen_string_literal: true

namespace :admin do
  get "dashboard" => "dashboard#index"

  namespace :settings do
    resources :general_settings, only: [:create]
    resources :lms_settings, only: [:create]
  end
end
