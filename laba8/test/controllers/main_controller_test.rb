require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'go to the main page' do
    get index_url
    assert_response :success
  end

  test 'go to the responce page' do
    get result_url
    assert_response :success
  end

  test 'test values 1' do
    get result_url, params: { n: 300 }
    assert_equal assigns[:res].first, [220, 284]
  end

  test 'test values 2' do
    get result_url, params: { n: 1300 }
    assert_equal assigns[:res], [[220, 284], [1184, 1210]]
  end

  test 'test empty responce' do
    get result_url, params: { n: 0 }
    assert assigns[:res].empty?
  end
end
