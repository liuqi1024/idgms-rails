class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :owner_type
      t.integer :owner_id
      t.integer :user_id
      t.string :operation
      t.text :desc

      t.timestamps
    end
  end
end
