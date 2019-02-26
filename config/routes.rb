Rails.application.routes.draw do
  resources :vegetables
  resources :events
  devise_for :users

  root to: 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
