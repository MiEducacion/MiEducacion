 
Rails.application.routes.draw do


  devise_for :users,
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
    },
  controllers: {
    sessions: 'sessions'
  }

  resources :groups, constraints: lambda { |request| request.format == :json }
  resources :courses, constraints: lambda { |request| request.format == :json }
  



 # mount Logster::Web => "/logs"



  devise_scope :user do
    get 'session/current', to: "sessions#current_user"
end
  # get 'app/index'
 
  # Apunto al controlador 'app' y llamo a su método 'index' 
  root :to => "app#index" 

  match '*path', to: 'app#index', via: :all

  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 