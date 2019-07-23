Rails.application.routes.draw do
  devise_for :users
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


end
