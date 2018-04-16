Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { invitations: 'users/invitations'}
  root to: 'products#index'

  get '/modifier', to: 'products#edit'
  resources :products
  resources :shops
  resources :comments

end
