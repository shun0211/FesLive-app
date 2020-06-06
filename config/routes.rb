Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  resources :tickets, only: [:index, :new, :create]

  resources :events, only: [:index] do
    member do
      get "choise_artist"
    end
    resources :set_lists, only: [:new, :create, :show, :edit, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  root "tickets#index"
end
