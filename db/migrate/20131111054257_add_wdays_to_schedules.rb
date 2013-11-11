class AddWdaysToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :wdays, :integer, array: true
  end
end
