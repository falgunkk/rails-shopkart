Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :items
  resources :sections
  resources :subcategories
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
