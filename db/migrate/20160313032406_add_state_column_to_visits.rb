class AddStateColumnToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :state, :string
  end
end
