 
Rails.application.routes.draw do


  
  devise_for :users
  resources :groups, constraints: lambda { |request| request.format == :json }
  resources :courses, constraints: lambda { |request| request.format == :json }
  



 # mount Logster::Web => "/logs"
    mount ActionCable.server => '/cable'


  # get 'app/index'
 
  # Apunto al controlador 'app' y llamo a su método 'index' 
  root :to => "app#index", as: 'app'
  get 'session/current', to: 'session/current_user#index'


  match '*path', to: 'app#index', via: :all

  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 