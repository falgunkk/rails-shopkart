Rails.application.routes.draw do
  #devise_for :users
   #get '/auth/facebook/logout' => 'application#facebook_logout', :as => :facebook_logout
    #get '/users/sign_out' => 'users/omniauth_callbacks#facebook_logout'


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
#   devise_scope :user do
# #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#   get '/users/sign_out' => 'users/omniauth_callbacks#facebook_logout'

#  end

  # devise_scope :user do
  #   get '/signout', to: 'devise/sessions#destroy', as: :signout
  # end
  #devise_scope :user do
  #delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end
  root 'home#index'

  resources :items
  resources :sections
  resources :subcategories
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
