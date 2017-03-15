Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  resources :posts

  resources :users, only: [:index, :show]

  root 'home#index'
end
