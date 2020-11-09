Rails.application.routes.draw do
  devise_for :users
  root to: 'artists#index'

  resources :artists, only: :index
  
end
