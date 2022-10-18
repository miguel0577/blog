# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users 
  root 'articles#index'
  
  
  resources :users do
    get "follows/create", to: "follows#create"
  end
  
  get "follows/destroy", to: "follows#destroy"

  resources :articles do
    resources :comments
  end
end
