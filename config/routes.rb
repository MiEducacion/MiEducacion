 
Rails.application.routes.draw do


  
  devise_for :users
  resources :groups, constraints: lambda { |request| request.format == :json }

  root :to => "app#index", as: 'app'
  resources :wizard
  get 'session/current', to: 'session/current_user#current_session', constraints: lambda { |request| request.format == :json }
  get "manifest.webmanifest" => "metadata#webmanifest", as: :manifest
  get "manifest.json" => "metadata#webmanifest"

  get "courses" => "courses#index"
  post "courses/new" => "courses#newCourse"


  authenticated :user, lambda {|u| u.has_role?(:admin) } do
    mount Logster::Web => "/logs"
  end

  mount ActionCable.server => '/cable'

  match '*path', to: 'app#index', via: :all

  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 