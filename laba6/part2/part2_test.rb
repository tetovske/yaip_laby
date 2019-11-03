# frozen_string_literal: true

require 'test/unit'
require_relative 'my_math'

# Class doc
class MyTest < Test::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test1
    d = 0.0001
    val = Math.atan(0.5)
    assert_in_delta(MyMath.calc_arctg(0.5, d).map { |i| i }[-1], val, d)
  end

  def test2
    d = 0.001
    val = Math.atan(0.5)
    assert_in_delta(MyMath.calc_arctg(0.5, d).map { |i| i }[-1], val, d)
  end

  def test3
    d = 0.01
    val = Math.atan(0.5)
    assert_in_delta(MyMath.calc_arctg(0.5, d).map { |i| i }[-1], val, d)
  end
end
