class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.time :pill_time
      t.time :tracker_time
      t.string :family, array: true, default: []
      t.belongs_to :pill, index: true
      t.timestamps
    end
  end
end
