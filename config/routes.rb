Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :new, :create]
  root to: 'posts#index'
end
