class Product < ActiveRecord::Base
  has_one :food
  has_one :book
end
