require 'test_helper'

class TaskControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get task_input_url
    assert_response :success
  end

  test "should get result" do
    get task_result_url
    assert_response :success
  end

end
