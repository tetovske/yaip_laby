# frozen_string_literal: true

require 'test/unit'
require_relative 'array_helper.rb'

# test class
class Prog2Test < Test::Unit::TestCase
  def setup; end

  def test1
    100.times do
      str = (0..10).map { (-999..999).to_a[rand((-999..999).size)] }.join(' ')
      c_arr = Program.convert(str)
      s_arr = Program.sort(c_arr)
      assert(c_arr == MyTest.conv(str) && s_arr == MyTest.sort(c_arr), 'Failed')
    end
  end
end

# Special functions
class MyTest
  def self.conv(str)
    str.split(' ').map(&:to_i)
  end

  def self.sort(arr)
    arr.sort
  end
end
