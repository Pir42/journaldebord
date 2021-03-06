Rails.application.routes.draw do

  resources :directories
  get 'dashboard/index'
  resources :treatments
  resources :fertilizations
  resources :fertilizers
  resources :action_types
  resources :parcels
  resources :varieties
  resources :vegetables
  resources :events
  devise_for :users

  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
