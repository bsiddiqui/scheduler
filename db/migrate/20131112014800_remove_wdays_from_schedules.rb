class RemoveWdaysFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :wdays
  end
end
