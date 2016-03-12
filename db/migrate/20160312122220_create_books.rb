class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :product_id
      t.string :itemName
      t.string :releaseDate
      t.string :ageRequirement
      t.string :author
      t.string :translator
      t.string :publisher
      t.string :seller
      t.string :type
      t.string :pages
      t.string :isbn10
      t.string :isbn13
      t.string :lang

      t.timestamps null: false
    end
    add_index :books, :product_id, unique: true
    add_index :books, :isbn10, unique: true
    add_index :books, :isbn13, unique: true
  end
end
