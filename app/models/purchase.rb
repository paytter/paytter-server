class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :store

  has_many :shoppings
  has_many :purchase_informations
end
