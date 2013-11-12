class RequireMaxSizeInSchedule < ActiveRecord::Migration
  def change
    change_column :schedules, :max_size, :integer, null: false
  end
end
