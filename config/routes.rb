Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:new, :create]
  
  root "posts#index"
end