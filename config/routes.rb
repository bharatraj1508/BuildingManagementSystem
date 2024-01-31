Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]
  
  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:show, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end
  
  namespace :authentications do
    resources :events, only: :index
  end
  
  resource :invitation, only: [:new, :create]

  resources :profiles, only: [ :index, :show, :edit, :update, :destroy]

  post "search_result", to: "profiles#search"
  
  get "home", to:"home#index"
  
end