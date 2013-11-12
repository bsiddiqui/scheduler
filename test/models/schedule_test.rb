require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  it "requires trip_id, wdays, time, and price" do
    schedule = Schedule.new(
      trip_id: 1,
      wdays: [0,1],
      time: Time.now,
      max_size: 4,
      price: 20.50
    )
    schedule.valid?.must_equal true
  end

  it "is invalid without trip_id, wdays, time, max_size, and price" do
    schedule = Schedule.new(
      price: 20.50
    )
    schedule.valid?.must_equal false

    schedule = Schedule.new(
      time: Time.now,
      price: 20.50
    )
    schedule.valid?.must_equal false

    schedule = Schedule.new(
      wdays: [0,1],
      time: Time.now,
      price: 20.50
    )
    schedule.valid?.must_equal false

    schedule = Schedule.new(
      trip_id: 1,
      wdays: [0,1],
      time: Time.now,
      max_size: 4
    )
    schedule.valid?.must_equal false
  end

  describe "price" do
    it "should be a positive" do
      schedule = FactoryGirl.build(:schedule, price: -1)
      schedule.valid?.must_equal false

      schedule = FactoryGirl.build(:schedule, price: 0)
      schedule.valid?.must_equal false
    end
  end

  describe "max_size" do
    it "should be a positive" do
      schedule = FactoryGirl.build(:schedule, max_size: -1)
      schedule.valid?.must_equal false

      schedule = FactoryGirl.build(:schedule, max_size: 0)
      schedule.valid?.must_equal false
    end
  end

  describe "wdays" do
    it "should only take numbers 0-6" do
      schedule = FactoryGirl.build(:schedule, wdays: [-1])
      schedule.valid?.must_equal false

      schedule = FactoryGirl.build(:schedule, wdays: ["a"])
      schedule.valid?.must_equal false
    end

    it "should be an array" do
      schedule = FactoryGirl.build(:schedule, wdays: -1)
      schedule.valid?.must_equal false
    end
  end
end
