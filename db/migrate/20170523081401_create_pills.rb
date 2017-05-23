class CreatePills < ActiveRecord::Migration[5.0]
  def change
    create_table :pills do |t|
      t.string :name
      t.integer :user_id
      t.datetime :reminder, array: true, default: []
      t.integer :trackers, array: true, default: []
      t.boolean :taken

      t.timestamps
    end
  end
end
