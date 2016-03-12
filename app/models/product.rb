class Product < ActiveRecord::Base
  has_one :food
  has_one :book

  has_many :product_stores
  has_many :product_stores, through: :products
  has_many :shoppings
  has_many :purchase_informations
end
