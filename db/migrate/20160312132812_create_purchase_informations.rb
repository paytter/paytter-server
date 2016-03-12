class CreatePurchaseInformations < ActiveRecord::Migration
  def change
    create_table :purchase_informations do |t|
      t.integer :purchase_id
      t.integer :product_id
      t.integer :number_of_products

      t.timestamps null: false
    end
    add_index :purchase_informations, %i(purchase_id product_id), unique: true
  end
end
