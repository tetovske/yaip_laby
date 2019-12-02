require 'test_helper'

# Test should compare results of different requests
class CompareResponceTest < ActionDispatch::IntegrationTest

    def setup; end

    def teardown; end

    test 'compare responces' do
        get result_path, params: { :n => 300 }
        res1 = response.body 
        get result_path, params: { :n => 1300 } 
        res2 = response.body
        assert_not_equal res1, res2
    end
end