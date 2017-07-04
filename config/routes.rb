Rails.application.routes.draw do
  resources :photo_images
  resources :photos
  resources :users
  
  get 'sessions/new'
  root 'static#home'
  get '/submit', to: 'photos#new'

  get '/sign_up',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/search', to: 'tags#search', as: 'search'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
