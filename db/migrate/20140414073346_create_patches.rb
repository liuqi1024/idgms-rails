class CreatePatches < ActiveRecord::Migration
  def change
    create_table :patches do |t|
      t.string :code
      t.references :product_batch
      t.integer :ticket_count
      t.string  :pack_no_totals
      t.string  :progress           #当前进展(数据生成 - 印刷数据 - 检测)
      t.string  :progress_test
      t.string  :state

      t.timestamps
    end
    add_index :patches, :product_batch_id
  end
end
