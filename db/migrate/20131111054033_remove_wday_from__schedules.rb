class RemoveWdayFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :wday
  end
end
