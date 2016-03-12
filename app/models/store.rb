class Store < ActiveRecord::Base
  has_many :product_stores
  has_many :products, through: :products
  has_many :purchases
end
