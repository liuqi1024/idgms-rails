class AddLoginnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :loginname, :string
    add_index :users, :loginname, :unique => true
    add_column :users, :name, :string
  end
end
