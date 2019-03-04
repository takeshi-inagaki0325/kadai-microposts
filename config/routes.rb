Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
#20190304課題####
      get :likes
##################
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
#20190304課題#########
  resources :favorites, only: [:create, :destroy]
######################
end