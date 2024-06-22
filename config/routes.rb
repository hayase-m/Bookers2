Rails.application.routes.draw do

  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  devise_for :users

  resources :books, only: [:new, :create, :index ,:show, :destroy, :edit]
  resources :users, only: [:show, :edit, :update, :index]
end
