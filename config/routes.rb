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

  resources :users, only: [:show, :edit, :update,:destroy]

  resources :shops,only:[:index,:show]do
    member do
      get "random"
    end
     resource :post_comments, only: [:create, :destroy]
     resource :bookmark, only: [:create, :destroy]
  end


end
