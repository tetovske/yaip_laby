# frozen_string_literal: true

require 'test/unit'
require_relative 'scale.rb'

# Test class
class MyTestPart3 < Test::Unit::TestCase
  def setup; end

  def test1
    assert_in_delta(5.94, Scale.scale(5) { |x| x * Math.sin(x) }, 0.1)
  end

  def test2
    assert_in_delta(3.21, Scale.scale(5, ->(x) { Math.tan(x) }), 0.1)
  end
end
