class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string, after: :post_code
  end
end
