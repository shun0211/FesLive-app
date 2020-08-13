Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:new, :show]
  resources :tickets, only: [:index, :new, :create]

  resources :events, only: [:index] do
    member do
      get "event_image"
    end
    member do
      get "choise_artist"
    end
    resources :set_lists, only: [:new, :create, :show, :edit, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :images, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comment_to_images, only: [:create, :destroy]
    resource :image_likes, only: [:create, :destroy]
    member do
      get "download"
    end
  end

  root "tickets#index"

end
