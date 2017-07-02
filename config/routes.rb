Rails.application.routes.draw do
	resources :photos, only: [:index, :new, :create, :destroy]

  get 'sessions/new'
  root 'static#home'
  get '/submit', to: 'photos#new'

  get '/sign_up',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
