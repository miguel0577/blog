# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users 
  root 'articles#index'
  
  
  resources :users do
    get "follows/follow", to: "follows#follow"
  end
  
  get "follows/unfollow", to: "follows#unfollow"

  resources :articles do
    resources :comments
  end
end
