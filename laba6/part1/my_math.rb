# frozen_string_literal: true

# Math module
class MyMath
  class << self
    def arctg(x_val, accuracy)
      enu = Enum.new(x_val, 3, 1, x_val)
      puts enu.res
      loop do
        enu = iterate(enu, x_val)
        break if (enu.res - enu.prev).abs < accuracy
      end
      enu
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

  # Class doc
  class Enum
    attr_accessor :res, :n_val, :s_val, :prev

    def initialize(res, n_val, s_val, prev)
      @res = res
      @n_val = n_val
      @s_val = s_val
      @prev = prev
    end
  end
end
