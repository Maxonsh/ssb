Rails.application.routes.draw do
  root 'welcome#index'

  resources :offers
  resources :sells, :controller => 'offers', :type => 'Sell'
  resources :buys, :controller => 'offers', :type => 'Buy'
  resources :rents, :controller => 'offers', :type => 'Rent'
  resources :rent_wanteds, :controller => 'offers', :type => 'RentWanted'
  resources :swaps, :controller => 'offers', :type => 'Swap'
  resources :swap_wanteds, :controller => 'offers', :type => 'SwapWanted'

  resources :properties
  resources :users

  get '/login', :to => 'user_sessions#new', :as => :new_user_session
  post '/login', :to => 'user_sessions#create', :as => :user_sessions
  get '/logout', :to => 'user_sessions#destroy', :as => :user_session

  get '/disclaimer', :to => 'pages#disclaimer', :as => :disclaimer
  get '/contacts', :to => 'pages#contacts', :as => :contacts
  post '/contacts', :to => 'feedbacks#create', :as => :feedbacks
  get '/privacy_policy', :to => 'pages#privacy_policy', :as => :privacy_policy
end
