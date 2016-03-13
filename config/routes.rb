Rails.application.routes.draw do
  devise_for :clients, controllers: {
    registrations: 'clients/registrations',
    sessions: 'clients/sessions'
  }

  resources :products, only: %i() do
    get 'search', on: :collection
  end

  resources :users, only: :create do
    patch 'upload', on: :collection
  end
  resources :shoppings, only: :create
  resources :purchases, only: :create

  resources :stores, only: :show do
    resources :users, only: :index
  end
end
