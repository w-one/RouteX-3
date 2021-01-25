Rails.application.routes.draw do
  
  resources :how_tos
  resources :notes
  devise_for :users
  resources :users, only: [:show]
  resources :spots do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
