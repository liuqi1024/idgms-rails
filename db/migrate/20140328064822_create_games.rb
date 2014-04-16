class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :code
      t.string :name
      t.integer :par_value     #游戏面值，游戏票面上的票值，单位为元，数字型的值
      
      
      t.integer :sub_gamesize       #<SubgameSize>：奖组大小，一个奖组票的张数
      t.integer :pool_size          #<PoolSize>：奖池大小，一个Pool票的张数
      t.integer :pack_size          #<PackSize>：票包大小，一包票的张数
      t.integer :packs_per_pool     #<PacksPerPool>：每奖池包数，一个奖池包含的包数
      t.integer :packs_per_carton   #<PacksPerCarton>：包箱包数，一箱中包含的包数
      t.integer :first_ticket_no    #<FirstTicketNo>：票起始编号，每包中第一张票的编号
      t.integer :first_pack_no      #<FirstPackNo>：包起始编号，游戏中第一包的编号
      t.integer :first_pool_no      #<FirstPoolNo>：奖池起始编号，游戏中第一个奖池的编号
      t.integer :poolcount_per_printunit #<PoolCountPerPrintUnit>：每个印刷单元包含的pool数量
      t.integer :random_no          #游戏随机算法数
      
      t.integer :current_pack_no    #当前已经印刷完成到的包号
      t.string :version
      t.string :state
      t.datetime :completed_at
      t.text :desc

      t.timestamps
    end
  end
end
