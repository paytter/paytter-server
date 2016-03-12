class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :account_id
      t.string :branch_number
      t.string :account_type_cd
      t.string :account_type
      t.string :account_number
      t.string :account_holder_type_cd
      t.string :account_holder_type
      t.integer :balance
      t.date :opening_date

      t.timestamps null: false
    end
  end
end
