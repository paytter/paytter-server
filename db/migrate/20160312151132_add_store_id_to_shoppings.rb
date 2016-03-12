class AddStoreIdToShoppings < ActiveRecord::Migration
  def change
    add_column :shoppings, :store_id, :integer
  end
end
