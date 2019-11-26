require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get admin_auth_url
    assert_response :success
  end

  test "should get handling" do
    get admin_handling_url
    assert_response :success
  end

end
