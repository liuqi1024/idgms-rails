class CreateGameGroups < ActiveRecord::Migration
  def change
    create_table :game_groups do |t|
      t.references :game
      t.references :game_program
      t.string :code   # 奖组编号
      t.string :torrent
      t.string :serial_no   # => 随机算法序号

      t.timestamps
    end
    add_index :game_groups, :game_id
  end
end
