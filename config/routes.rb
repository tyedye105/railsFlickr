Rails.application.routes.draw do
  devise_for :users
  root 'images#index'
  resources :images
  resources :users do
    resources :images
  end
  resources :images do
    resources :tags
  end
end
