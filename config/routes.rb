Rails.application.routes.draw do
  root to: 'homes#top'
  get '/home/about' => 'homes#about', as: 'about'
  devise_for :users

  resources :books, only: %i[new create index show destroy edit update] do
    resource :favorites, only: %i[create destroy]
    resources :book_comments, only: %i[create destroy]
  end
  resources :users, only: %i[show edit update index] do
    resource :relationships, only: %i[create destroy]
    member do
      get 'follows'
      get 'followers'
    end
  end
end
