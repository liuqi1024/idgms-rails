class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.references  :game
      t.integer     :print_unit_count #印刷单元数量
      t.integer     :ticket_count
      t.string      :code
      t.string      :printbatch      #印刷批次号
      t.string      :version
      t.datetime    :generate_at
      t.datetime    :completed_at
      t.string      :state
      t.text        :desc
      t.integer     :current_pack_no        #当前印刷到的包号
      t.integer     :current_pool_no        #当前印刷到的pool号
      t.integer     :current_subgame_no     #当前印刷到的奖组号
      
      t.timestamps
    end
    add_index :worksheets, :game_id
  end
end
