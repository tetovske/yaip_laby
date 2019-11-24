require 'test_helper'
require 'selenium-webdriver'

class MainControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'go to the main page' do
    get index_url
    assert_response :success
  end

  test 'check result page' do
    get result_url, params: { n: 300, handle: 'Сервер' }
    assert_response :success
  end
end
