class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :ticket_no
      t.references :game
      t.references :game_group
      t.string     :generate_type
      t.string     :state
      t.text       :desc

      t.timestamps
    end
    add_index :tickets, :game_id
    add_index :tickets, :game_group_id
  end
end
