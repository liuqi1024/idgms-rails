class CreateProductUnits < ActiveRecord::Migration
  def change
    create_table :product_units do |t|
      t.references :game
      t.references :product_batch
      t.string :code

      t.timestamps
    end
    add_index :product_units, :game_id
    add_index :product_units, :product_batch_id
  end
end
