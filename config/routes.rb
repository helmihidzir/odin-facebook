Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root to: 'posts#index'
  # commentator config
  mount Commontator::Engine => '/commontator'
  # for user profile
  resources :users, only: [:show, :index]
  resources :users do
    get 'add_friend'
  end
end
