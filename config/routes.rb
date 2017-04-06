Rails.application.routes.draw do
  root 'welcome#index'

  resources :offers
  resources :sells, :controller => 'offers', :type => 'Sell'
  resources :rents, :controller => 'offers', :type => 'Rent'

  resources :properties

  get '/disclaimer', :to => 'pages#disclaimer', :as => :disclaimer
  get '/contacts', :to => 'pages#contacts', :as => :contacts
  post '/contacts', :to => 'feedbacks#create', :as => :feedbacks
  get '/privacy_policy', :to => 'pages#privacy_policy', :as => :privacy_policy
end
