Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  
  resources :tickets, only: [:index, :new, :create]

  resources :events, only: [:index] do
    member do
      get "choise_artist"
      resources :set_lists, only: [:new, :create, :show]
    end
  end

  root "tickets#index"
end
