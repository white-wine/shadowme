Rails.application.routes.draw do

  devise_for :users
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :admin do
    resources :bookings, only: [:index]
    resources :professionals, only: [:index, :destroy]
    resources :profile, only: [:index, :update, :edit]


  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :careers, only: [:index]
  end

  resources :careers, only: [:show]
  ## show list of professionals


  resources :professionals, except: [:destroy] do
    resources :bookings, only: [:create]
    ## show reviews index
  end

  resources :bookings, only: [:show, :update, :index] do
    resources :reviews, only: [:create]
    resources :messages, only: [:create]
  end

  resources :searches, only: [:index]
  resources :donations, only: [:new, :create, :show] do
    resources :payments, only: [:new, :create]
  end


  # devise :omniauthable, omniauth_providers: [:google_oauth2]

  post '/confirm_booking', to: 'bookings#confirm'
  post '/decline_booking', to: 'bookings#decline'

end

