Rails.application.routes.draw do
  devise_for :clients, controllers: {
    registrations: 'clients/registrations'
    sessions: 'clients/sessions'
  }

  resources :products, only: %i() do
    get 'search', on: :collection
  end

  resources :users, only: :create
  resources :shoppings, only: :create
  resources :purchases, only: :create
end
