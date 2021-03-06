# frozen_string_literal: true

require 'test/unit'
require_relative 'my_math.rb'

# Test class
class Prog1Test < Test::Unit::TestCase
  def setup; end

  def test1
    puts 'Введите количество и точность тестов:'
    n = gets.to_i
    ac = gets.to_f
    n.times do
      r = rand(-0.9..0.9)
      assert((MyMath.arctg(r, ac).res - Math.atan(r)).abs <= ac)
    end
  end
end
