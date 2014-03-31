class CreateGamePrograms < ActiveRecord::Migration
  def change
    create_table :game_programs do |t|
      t.references :game
      t.string :version

      t.timestamps
    end
    add_index :game_programs, :game_id
  end
end
