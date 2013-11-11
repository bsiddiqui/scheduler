class AddNullFalseToPriceInSchedule < ActiveRecord::Migration
  def change
    change_column :schedules, :price, :decimal, precision: 8, scale: 2, null: false
  end
end
