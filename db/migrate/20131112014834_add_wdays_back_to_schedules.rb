class AddWdaysBackToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :wdays, :integer, array: true, default: []
  end
end
