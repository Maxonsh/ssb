class AddAccountTypeColumnToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :account_type, :integer, :null => false, :default => 0
  end

  def down
    remove_column :users, :account_type
  end
end
