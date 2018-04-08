Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  get '/show', to: 'products#show', :as =>'regarder'
  get '/modifier', to: 'products#edit'
  resources :products
end
