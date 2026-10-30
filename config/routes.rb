Rails.application.routes.draw do
  get "errors/not_found"
  get "errors/internal_server_error"
  root 'home#index'
  get "/home", to: "homes#index"
  
  resources :groups do 
    resources :entities, only: [:new, :create, :destroy]
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/404", to: "errors#not_found"
  get "/500", to: "errors#internal_server_error"
end
