Rails.application.routes.draw do
  use_doorkeeper_openid_connect
  use_doorkeeper
  root :to => 'todos#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items
  end
end
