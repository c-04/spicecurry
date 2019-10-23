Rails.application.routes.draw do

#ここから
  root "home#top"
  #get "shops/random/:id"=>"shops#random"
  #get "shops/index"=>"shops#index"
  #get "shops/show/:id"=>"shops#show"

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
}

  devise_for :administrator_pages
  namespace :administrator_pages do
    resources :shops
  end

  resources :users, only: [:show, :edit, :update,:destroy]do
  member do
    get "comments"
    get "bookmarks"
    get "favorites"
  end
  end

  resources :shops,only:[:index,:show]do
    collection do
      get :search
      get "eat"
      get "favorite"
      get "bookmark"
    end
    member do
      get "random"
    end
     resource :post_comments, only: [:create, :destroy]
     resource :bookmark, only: [:create, :destroy]
     resource :eat, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]

  end


end
