# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  resources :students
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that repturns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Defines the root path route ("/")
  root 'home#index'
end
