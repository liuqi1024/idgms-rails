class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.references :game
      t.string :printbatch
      t.datetime :completed_at
      t.string :state
      t.text :desc

      t.timestamps
    end
    add_index :worksheets, :game_id
  end
end
