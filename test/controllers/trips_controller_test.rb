require 'test_helper'
require 'pry'

class TripsControllerTest < ActionController::TestCase
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should post create" do
    params = { trip: { name: "hello", vendor: "jarp" } }
    post :create, params
    assert_response :success
  end

  describe "query_by_date" do
    it "should only return valid dates" do
      trip = FactoryGirl.create(:trip)

      schedule1 = FactoryGirl.create(:schedule, trip_id: trip.id, wdays: [0])
      schedule1 = FactoryGirl.create(:schedule, trip_id: trip.id, wdays: [1])
      schedule1 = FactoryGirl.create(:schedule, trip_id: trip.id, wdays: [5])

      get :query_by_date, { from: "2013/11/2", to: "2013/11/5" }
      response = JSON.parse(@response.body)

      response[trip.name].length.must_equal 2
      response[trip.name].each do |wday|
        wday.wont_equal 5
      end
    end
  end
end
