require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trips_index_url
    assert_response :success
  end
end
