class RenameItemIdToProducts < ActiveRecord::Migration
  def change
    rename_column :products, :item_id, :itemId
  end
end
