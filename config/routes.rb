Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users
  resources :users, only: [:edit, :show, :update]
  namespace :prototypes do
    resources :newest, only: :index
  end
  resources :prototypes do
    resources :likes, only: [:create, :destroy], module: 'prototypes'
    resources :comments, only: :create, module: 'prototypes'
  end
  resources :tags, only: [:index, :show]
end
