class RemoveUserIdIndexFromBankAccounts < ActiveRecord::Migration
  def up
    remove_index :bank_accounts, :user_id
  end

  def down
    add_index :bank_accounts, :user_id, unique: true
  end
end
