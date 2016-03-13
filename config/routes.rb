Rails.application.routes.draw do
  resources :products, only: %i() do
    get 'search', on: :collection
  end

  resources :users, only: :create do
    patch 'upload', on: :collection
  end
  resources :shoppings, only: :create
  resources :purchases, only: :create
end
