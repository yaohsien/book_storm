class CreateOpenTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :open_times do |t|
      t.integer :store_id
      t.string :day
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
