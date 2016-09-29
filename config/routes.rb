Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'
  resources :userlist
  #resources :items
  #resources :sections
  resources :categories do
  resources :subcategories do
  resources :items
  end
  end
end
