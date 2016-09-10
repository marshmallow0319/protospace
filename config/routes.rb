Rails.application.routes.draw do
  devise_for :users

  resources :users, :only => [:edit, :show, :update]
  resources :prototypes, :only => [:index, :new, :show]

  root 'prototypes#index'

end
