class CreateTransportBatches < ActiveRecord::Migration
  def change
    create_table :transport_batches do |t|
      t.references :product_batch
      t.string :code
      t.integer :start_pool_no
      t.integer :end_pool_no
      t.string  :print_unit_completes   #已完成的印刷单元号列表
      t.string  :state
      
      t.timestamps
    end
    add_index :transport_batches, :product_batch_id
  end
end
