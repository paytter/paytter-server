class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :score, :float
    add_column :products, :imageUrl, :string
    add_column :products, :sites_url, :string
    add_column :products, :sites_title, :string
    add_column :products, :sites_imageUrl, :string
  end
end
