Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :destroy]
  resources :posts
  root "posts#index"
end