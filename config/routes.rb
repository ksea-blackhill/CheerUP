Rails.application.routes.draw do
  get 'supports/index'
  devise_for :users
  root to: 'artists#index'

  resources :artists do
    resources :supports,only: [:index,:create]
  end
  
end
