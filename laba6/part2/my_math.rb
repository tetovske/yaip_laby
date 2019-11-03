# frozen_string_literal: true

require 'ostruct'
# MyMath documentation
class MyMath
  def each
    res = 0.5
    n = 3
    s = 1
    loop do
      res += (-1)**s * ((0.5**n) / n)
      yield res if block_given?
      s = s == 1 ? 2 : 1
      n += 2
    end
  end

  class << self
    def calc_arctg(x_val, accuracy)
      Enumerator.new do |y|
        enu = Enum.new(x_val, 3, 1, x_val)
        loop do
          enu = iterate(enu, x_val)
          y.yield enu.res, (enu.n_val - 3) / 2
          break if (enu.res - enu.prev).abs < accuracy
        end
      end
    end

    private

    def iterate(enu, x_val)
      enu.prev = enu.res
      enu.res += (-1)**enu.s_val * ((x_val**enu.n_val) / enu.n_val)
      enu.s_val = enu.s_val == 1 ? 2 : 1
      enu.n_val += 2
      enu
    end
  end
end

# Enumeration class
class Enum
  attr_accessor :res, :n_val, :s_val, :prev

  def initialize(res, n_val, s_val, prev)
    @res = res
    @n_val = n_val
    @s_val = s_val
    @prev = prev
  end
end
