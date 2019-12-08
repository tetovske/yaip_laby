require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test 'cant go anywhere without login' do
    get signout_url
    get index_url
    assert_response :redirect
    assert_redirected_to signin_url
  end

  test 'create fake user and make some stuff' do
    unless usr = User.find_by(login: 'test').nil?
      User.find_by(login: 'test').destroy
    end
    User.create(login: 'test', password_digest: '1234').save
    get signout_url
    get auth_url, params: { login: 'test', pass: '1234' }
    get result_url, params: { n: '300' }
    puts page
    
    User.find_by(login: 'test').destroy if usr
  end
end
