class Store < ActiveRecord::Base
  has_many :product_stores
  has_many :products, through: :product_stores
  has_many :purchases
  has_many :shoppings

  has_many :client_stores
  has_many :clients, through: :client_stores
  has_many :visits
  has_many :users, through: :visits
end
