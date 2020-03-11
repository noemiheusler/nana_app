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
  post "nana_friend/:id/", to: "pages#nana_friend", as: :nana_friend
  delete "nana_unfriend/:id/", to: "pages#nana_unfriend", as: :nana_unfriend
  get "intro", to: "pages#intro", as: :intro
  get "onboarding", to: "pages#onboarding", as: :onboarding
  get "show_nanas_nearby", to: "pages#show_nanas_nearby", as: :show_nanas_nearby
end
