Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  resources :users
  post '/signin', to: 'sessions#create'
  resources :friends
end
