class CreateTransportBatches < ActiveRecord::Migration
  def change
    create_table :transport_batches do |t|
      t.references :product_batch
      t.string :code

      t.timestamps
    end
    add_index :transport_batches, :product_batch_id
  end
end
