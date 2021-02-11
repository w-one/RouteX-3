Rails.application.routes.draw do
  
  
  get 'home/index'      
  get 'home/show'

  root to: "home#index"
  

  # devise_for :users, controllers: {
  #   registrations: "users/registrations",
  # }
  devise_for :users


  resources :users do
    get :search, on: :collection
    member do
      get 'userhowto'
      get 'usernote'

      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]


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
    resources :questions, only: [:create, :destroy]
  end
  

  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
