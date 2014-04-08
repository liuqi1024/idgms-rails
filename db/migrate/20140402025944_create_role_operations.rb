class CreateRoleOperations < ActiveRecord::Migration
  def change
    create_table :role_operations do |t|
      t.integer :role_id
      t.integer :operation_id

      t.timestamps
    end
  end
end
