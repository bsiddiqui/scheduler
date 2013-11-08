class MakeNameAndVendorRequiredInTrips < ActiveRecord::Migration
  def change
    change_column :trips, :name, :string, null: false
    change_column :trips, :vendor, :string, null: false
  end
end
