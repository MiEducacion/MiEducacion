# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: "app#index", as: "app"
  resources :wizard

  get "session/current", to: "session#current_session"
  get "manifest.webmanifest" => "metadata#webmanifest", as: :manifest
  get "manifest.json" => "metadata#webmanifest"

  get "courses" => "courses#index"
  post "courses/new" => "courses#new_course"
  get "courses/:id" => "courses#course"

  get "server/status" => "server#status"

  authenticated :user, ->(u) { u.has_role?(:admin) } do
    mount Logster::Web => "/logs"
  end

  draw :admin

  mount ActionCable.server => "/cable"

  match "*path", to: "app#index", via: :all
end
