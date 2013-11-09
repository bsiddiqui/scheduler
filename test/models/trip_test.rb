require 'test_helper'

class TripTest < ActiveSupport::TestCase
  it "requires a name and vendor" do
    trip = Trip.new(
      name: "Dessert tasting in Paris",
      vendor: "Paris Trips"
    )
    trip.valid?.must_equal true
  end

  it "is invalid without a name or vendor" do
    trip = Trip.new(name: "Dessert tasting in Paris" )
    trip.valid?.must_equal false

    trip = Trip.new(vendor: "Paris Trips" )
    trip.valid?.must_equal false
  end

  it "has many schedules" do
  end
end
