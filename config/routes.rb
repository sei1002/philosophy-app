Rails.application.routes.draw do
  devise_for :users
  resources :messages 
  root to: "messages#index"
  resources :users, only: [:edit, :update, :show]
  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
  end
end
