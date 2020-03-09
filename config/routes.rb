Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#discover'

  resources :conversations do
    resources :messages
  end

  resources :kids, except: [:index, :show]

  resources :events do
    resources :participations, only: [:create]
  end

  resources :participations, only: [:destroy]

  resources :answers, only: [:create]

  get "profile", to: "pages#profile", as: :profile
  get "mynanas", to: "pages#mynanas", as: :mynanas
  get "intro", to: "pages#intro", as: :intro
  get "onboarding", to: "pages#onboarding", as: :onboarding
end
