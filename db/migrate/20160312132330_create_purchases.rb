class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :store_id
      t.integer :total_amounts

      t.timestamps null: false
    end
  end
end
