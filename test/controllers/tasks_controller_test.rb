require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tasks_create_url
    assert_response :success
  end
end
