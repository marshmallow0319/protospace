Rails.application.routes.draw do
  devise_for :users

  resources :users, :only => [:edit, :show, :update]
  resources :prototypes, :only => [:index, :new, :create, :show, :edit, :destroy]

  root 'prototypes#index'

end
