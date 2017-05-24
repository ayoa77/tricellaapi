class CreatePills < ActiveRecord::Migration[5.0]
  def change
    create_table :pills do |t|
      t.string :name
      t.string :reminder
      t.string :trackers
      t.string :remind_trackers
      t.datetime :time_taken
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
