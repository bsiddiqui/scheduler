require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format :json
    assert_response :success
  end

  test "should post create" do
    params = { name: "hello", vendor: "jarp" }
    post :create, format :json, params
    assert_response :success
  end
end
