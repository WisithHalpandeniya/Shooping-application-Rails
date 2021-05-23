# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  get 'orders/create'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'carts/show'
  resources :order_items, only: [:create, :destroy]
  resource :order, only: [:create]
  resources :saved, only: [:index, :create]
  resource :carts, only: %i[show destroy]
  resource :home, only: [:index]
  get 'all_items' => 'home#show'
  get 'all_home' => 'home#index'
  post '/news_letter/create' => 'news_letter#create'
  root 'home#index'
end
