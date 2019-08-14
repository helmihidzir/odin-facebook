Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  # commentator config
  mount Commontator::Engine => '/commontator'
  # for user profile
  resources :users, only: [:show, :index]
  resources :posts do
    member do
      put "like" , to: "posts#liked"
      put "dislike", to: "posts#unliked"
    end
  end
  resources :friends, only: [:index, :destroy]
  resources :friend_requests
end
