Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'home#index'
  resources :userlist
  resources :carts
  #resources :items
  #resources :sections

  get '/search' => 'categories#search'
  get '/searchresults' => 'categories#searchresults'
  get '/searchsub' => 'subcategories#search'
  get '/searchresultssub' => 'subcategories#searchresults'
  get '/searchitem' => 'items#search'
  get '/searchresultsitems' =>'items#searchresults'

  get '/add_item'  => 'items#additem'
  post'/item_save' => 'items#create'
  get '/item_save' => 'items#index'
  get '/buy' => 'carts#buy'
  get '/address' => 'carts#address'
  resources :categories do
    resources :subcategories do
      resources :items, only: [:show, :index, :edit, :destroy, :index, :update]
    end
  end
end
