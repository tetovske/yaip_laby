# frozen_string_literal: true

require_relative 'my_math.rb'

# Class doc
class IOController
  class << self
    def start
      MyMath.calc_arctg(0.5, 0.0001).map { |i, k| puts i, k }
    end
  end
end

IOController.start
