# frozen_string_literal: true

Rails.application.routes.draw do
  resources :groups, only: [:index, :show, :new, :create, :destroy] do 
    resources :entities, only: [:new, :create, :destroy]
  end

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
end
