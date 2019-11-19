require 'selenium-webdriver'

def open_browser
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to 'http://localhost:3000'
    driver.find_element(:id, 'n').send_keys '300'
    driver.find_element(:id, 'submit-button').click

    waiting = Selenium::WebDriver::Wait.new(:timeout => 10)
    waiting.until { !driver.find_elements(:class, 'res-elem').empty? }
    puts 'Succeded!' if driver.find_elements(:class, 'res-elem').first.text == '220 284'
    sleep 30
end

open_browser