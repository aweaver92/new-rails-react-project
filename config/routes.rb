Rails.application.routes.draw do
  resources :dislikes
  resources :likes
  resources :users
    # route to test your configuration
    get '/hello', to: 'application#hello_world'
end
