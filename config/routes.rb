Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'
  resources :items
  resources :sections
  resources :subcategories
  resources :categories
  
end
