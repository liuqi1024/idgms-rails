class CreateProductBatches < ActiveRecord::Migration
  def change
    create_table :product_batches do |t|
      t.references :game
      t.references :worksheet
      t.string  :code
      t.string  :nation_code        # 35 - SG;
      t.string  :state
      t.string  :progress           #当前进展(数据生成 - 检测 - 印刷数据 - 检测)
      t.string  :progress_test
      t.string  :progress_sample
      t.integer :ticket_count
      t.integer :print_unit_count   #印刷单元数量
      t.integer :pool_count         #< PoolCount >：奖池Pool 的个数
      t.integer :subgame_count      #< SubgameCount >：奖组的个数
      
      t.integer :start_pack_no      #当前印刷到的包号
      t.integer :start_pool_no      #当前印刷到的pool号
      t.integer :start_subgame_no   #当前印刷到的奖组号
      t.integer :output_pool_no_from  #本次输出的数据是从第几个Pool开始。主要用于大奖组。与<OutputPoolNoTo>同时配置成0，则不处理，全部输出。
      t.integer :output_pool_no_to    #本次输出的数据是到第几个Pool结束。主要用于大奖组。与<OutputPoolNoFrom>同时配置成0，则不处理，全部输出。
      
      t.string  :print_unit_totals      #总的印刷单元号列表
      t.string  :print_unit_completes   #已完成的印刷单元号列表

      t.datetime :completed_at
      t.text     :desc
      t.timestamps
    end
    add_index :product_batches, :worksheet_id
  end
end
