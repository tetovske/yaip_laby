# frozen_string_literal: true

require 'test_helper'

# Test should compare results of different requests
class CompareResponceTest < ActionDispatch::IntegrationTest
  def setup; end

  def teardown; end

  test 'compare responces' do
    get result_path, params: { n: 300 }
    res1 = response.body
    get result_path, params: { n: 1300 }
    res2 = response.body
    assert_not_equal res1, res2
  end

  test 'rss request' do
    get result_url, params: { n: '300', format: :rss }
    assert response.body.include?('<?xml version="')
  end
end
