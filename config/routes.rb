Rails.application.routes.draw do
  devise_for :users
  root 'images#index'
  resources :users do
    resources :images
  end
end
