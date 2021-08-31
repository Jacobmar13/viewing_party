Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  resources :users
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :friends

  get '/discover', to: 'movies#discover'
  get '/movies', to: 'movies#movies'
  get '/movies/:movie_id', to: 'movies#show', as: 'movie'
end
