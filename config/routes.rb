 
Rails.application.routes.draw do
  resources :campus, constraints: lambda { |request| request.format == :json }
  resources :groups, constraints: lambda { |request| request.format == :json }
  resources :courses, constraints: lambda { |request| request.format == :json }
  # get 'app/index'
 
  # Apunto al controlador 'app' y llamo a su método 'index' 
  root :to => "app#index" 

  match '*path', to: 'app#index', via: :all

  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 