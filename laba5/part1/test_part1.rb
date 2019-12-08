# frozen_string_literal: true

require 'test/unit'
require_relative 'calc.rb'

# Test class
class ProgTest1 < Test::Unit::TestCase
  include Calculator

  def test1
    (1..100).each do |index|
      assert_equal(MathTest.calc_eq(index), Calculator.eq(index))
    end
  end
end

# Math class for tests
class MathTest
  def self.calc_eq(x_val)
    -(Math.cos((5 * x_val) / (1 - 6 * x_val))**0.5) / (x_val**2)
  end
end
