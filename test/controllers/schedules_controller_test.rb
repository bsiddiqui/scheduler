require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  test "should get index" do
    get :index, trip_id: 1
    assert_response :success
  end
end
