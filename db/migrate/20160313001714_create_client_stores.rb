class CreateClientStores < ActiveRecord::Migration
  def change
    create_table :client_stores do |t|
      t.integer :client_id
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
