Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users
  resources :users, only: [:edit, :show, :update]
  resources :prototypes, except: :index do
    resources :likes, only: [:create, :destroy]
  end
end
