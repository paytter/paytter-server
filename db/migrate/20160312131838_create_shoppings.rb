class CreateShoppings < ActiveRecord::Migration
  def change
    create_table :shoppings do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :purchase_id
      t.integer :number_of_products
      t.string :action

      t.timestamps null: false
    end
  end
end
