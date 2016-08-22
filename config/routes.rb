Rails.application.routes.draw do

  get 'logs/index'

  get 'logs/destroy'

  devise_for :users

  resources :lunchtables
  resources :lunches

  root 'lunchtables#index'
end
