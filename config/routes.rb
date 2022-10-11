# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users 
  root 'articles#index'
  
  
  resources :users do
    get "relationships/create", to: "relationships#create"
  end
  
  get "relationships/destroy", to: "relationships#destroy"

  resources :articles do
    resources :comments
  end
end
