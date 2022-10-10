# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users 
  
  resources :followers
  # resources :users do
  # end

  resources :articles do
    resources :comments
  end
end
