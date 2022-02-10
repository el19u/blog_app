Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:new, :create, :destroy]
  root "posts#index"
end