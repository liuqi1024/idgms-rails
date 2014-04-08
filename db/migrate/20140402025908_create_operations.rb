class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name, :unique => true
      t.text :desc

      t.timestamps
    end
  end
end
