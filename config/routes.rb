Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :prototypes

  root 'prototypes#index'
  
end
