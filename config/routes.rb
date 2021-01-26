Rails.application.routes.draw do
  
  root 'home#index'
  
  devise_for :users
  resources :users, only: [:show]

  resources :how_tos do
    resources :fights, only: [:create, :destroy]
    resources :advices, only: [:create, :destroy]
  end
  
  resources :spots do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :notes do
    resources :archives, only: [:create, :destroy]
    # resources :questions, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
