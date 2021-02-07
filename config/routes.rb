Rails.application.routes.draw do
  
  
  root 'home#index'
  get 'home/show'
  

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  resources :users, only: [:create, :edit, :destroy, :show] do
    get :search, on: :collection
    member do
      get 'userhowto'
      get 'usernote'
    end
  end

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
  

  resources :relationships, only: [:create, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
