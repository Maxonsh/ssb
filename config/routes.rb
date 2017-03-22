Rails.application.routes.draw do
  root 'pages#main'

  resources :offers
  resources :sells, :controller => 'offers', :type => 'Sell'
  resources :rents, :controller => 'offers', :type => 'Rent'

  resources :properties
end
