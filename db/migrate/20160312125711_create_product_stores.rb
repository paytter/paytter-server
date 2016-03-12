class CreateProductStores < ActiveRecord::Migration
  def change
    create_table :product_stores do |t|
      t.integer :product_id
      t.integer :store_id
      t.integer :price

      t.timestamps null: false
    end
    add_index :product_stores, %i(store_id product_id), unique: true
  end
end
