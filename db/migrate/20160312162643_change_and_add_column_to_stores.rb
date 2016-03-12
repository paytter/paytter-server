class ChangeAndAddColumnToStores < ActiveRecord::Migration
  def change
    rename_column :stores, :name, :user_name
    add_column :stores, :user_id, :string
    add_column :stores, :post_code, :string
    add_column :stores, :address, :string
    add_column :stores, :phone_number, :string
    add_column :stores, :email, :string
  end
end
