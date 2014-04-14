class CreatePatches < ActiveRecord::Migration
  def change
    create_table :patches do |t|
      t.string :code
      t.references :product_batch
      t.integer :ticket_count
      t.string :pack_no_totals

      t.timestamps
    end
    add_index :patches, :product_batch_id
  end
end
