Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root 'movies#index'
  resources :movies do
    resources :comments
  end
  resources :users do
    resources :comments
  end
end
