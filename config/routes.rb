Rails.application.routes.draw do
  root 'welcome#index'

  resources :offers
  resources :sells, :controller => 'offers', :type => 'Sell'
  resources :rents, :controller => 'offers', :type => 'Rent'

  resources :properties
end
