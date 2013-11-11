class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :trip_id, null: false
      t.decimal :price, precision: 8, scale: 2
      t.integer :max_size
      t.integer :wday, null: false
      t.time :time, null: false

      t.timestamps
    end
  end
end
