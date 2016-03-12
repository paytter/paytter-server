Rails.application.routes.draw do
  resources :products, only: %i() do
    get 'search', on: :collection
  end

  resources :users, only: :create
  resources :shoppings, only: :create
end
