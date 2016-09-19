Rails.application.routes.draw do
  devise_for :users

  resources :users, :only => [:edit, :show, :update]
  resources :prototypes

  root 'prototypes#index'

end
