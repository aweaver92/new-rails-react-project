Rails.application.routes.draw do
  resources :dislikes, only:[:create]
  resources :likes, only:[:create]
  resources :users
    # route to test your configuration
    get '/hello', to: 'application#hello_world'
    post "/signup", to: "users#create"
    post '/login', to: "sessions#create"
end
