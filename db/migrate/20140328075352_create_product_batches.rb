class CreateProductBatches < ActiveRecord::Migration
  def change
    create_table :product_batches do |t|
      t.references :worksheet
      t.string :code

      t.timestamps
    end
    add_index :product_batches, :worksheet_id
  end
end
