class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :code
      t.string :name
      t.string :version
      t.string :status
      t.datetime :completed_at
      t.text :desc

      t.timestamps
    end
  end
end
