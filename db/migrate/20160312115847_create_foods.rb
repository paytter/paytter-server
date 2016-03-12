class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :product_id
      t.string :itemName
      t.string :releaseDate
      t.string :ageRequirement
      t.string :maker
      t.string :seller
      t.string :brand
      t.string :dimension
      t.string :weight
      t.string :quantity
      t.string :preservation
      t.string :producingArea
      t.string :ean13
      t.string :ean8

      t.timestamps null: false
    end
    add_index :foods, :product_id, unique: true
    add_index :foods, :ean13, unique: true
    add_index :foods, :ean8, unique: true
  end
end
