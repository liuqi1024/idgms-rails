class CreateGameGroups < ActiveRecord::Migration
  def change
    create_table :game_groups do |t|
      t.references :game
      t.string :torrent
      t.string :serial_no

      t.timestamps
    end
    add_index :game_groups, :game_id
  end
end
