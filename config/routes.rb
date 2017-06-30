Rails.application.routes.draw do
  get '/sign_up',  to: 'users#new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
