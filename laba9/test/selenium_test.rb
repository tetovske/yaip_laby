require 'test_helper'
require 'selenium-webdriver'

class SeleniumTest < ActionDispatch::IntegrationTest
  setup do
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to 'http://localhost:3000'
  end

  teardown do
    @driver.quit
  end

  test 'check that there are no results on the new page' do
    sleep 5
    assert @driver.find_elements(:class, 'res-elem').empty?
  end

  test 'result with n = 300' do
    # waiting = Selenium::WebDriver::Wait.new(:timeout => 10)
    # waiting.until { !@driver.find_elements(:class, 'res-elem').empty? }
    @driver.find_element(:id, 'n').send_keys '300'
    @driver.find_element(:id, 'submit-button').click
    sleep 5
    assert @driver.find_elements(:class, 'res-elem').first.text == '220 284'
  end

  test 'result with n = 10' do
    @driver.find_element(:id, 'n').send_keys '10'
    @driver.find_element(:id, 'submit-button').click
    sleep 5
    assert @driver.find_elements(:class, 'res-elem').first.text == 'В заданном диапазоне нет дружественных чисел!'
  end
end