Rails.application.routes.draw do

  get 'users/update'
  devise_for :users, :controllers => {:registrations => "registrations"}

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

  resources :users, only: [:update]

  get "profile", to: "pages#profile", as: :profile
  get "mynanas", to: "pages#mynanas", as: :mynanas
  patch "accept_friend/:id/", to: "pages#accept_friend", as: :accept_friend
  patch "reject_friend/:id/", to: "pages#reject_friend", as: :reject_friend
  get "intro", to: "pages#intro", as: :intro
  get "onboarding", to: "pages#onboarding", as: :onboarding
end
