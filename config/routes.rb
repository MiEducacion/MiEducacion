 
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # get 'app/index'
 
  # Apunto al controlador 'app' y llamo a su método 'index' 
  root :to => "app#index" 

  match '*path', to: 'app#index', via: :all

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 