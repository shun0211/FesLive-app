Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  
  resources :tickets, only: [:index, :new, :create]
  resources :set_lists, only: [:index, :new, :create]
  root "tickets#index"
end
