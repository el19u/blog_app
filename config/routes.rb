Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy]
  resources :posts
  root "users#new"
end