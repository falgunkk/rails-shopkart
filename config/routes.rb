Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'
  resources :userlist
  #resources :items
  #resources :sections

  get '/search' => 'categories#search'
  get '/searchresults' => 'categories#searchresults'
  get '/searchsub' => 'subcategories#search'
  get '/searchresultssub' => 'subcategories#searchresults'
  get '/searchitem' => 'items#search'
  get '/searchresultsitems' =>'items#searchresults'

  resources :categories do
  resources :subcategories do
  resources :items
  end
  end
end
