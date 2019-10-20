require 'matrix'

# Point class
class Point
  attr_accessor :x, :y

  def initialize(args)
    @x = args[:x]
    @y = args[:y]
  end
end

# Parent class for shape instances
class Shape
  attr_reader :pts

  def initialize(args = nil)
    @pts = Array.new
    3.times { |i| @pts << Point.new(x: args[:p][i][0], y: args[:p][i][1]) }
  end

  def square; raise 'Error' end
end

class Triangle < Shape
  def initialize(args = nil)
    super(args)
  end

  def square
    0.5 * Matrix[[pts[0].x - pts[2].x, pts[0].y - pts[2].y], [pts[1].x - pts[2].x, pts[1].y - pts[2].y]].determinant
  end
end

class MyMath
  class << self
    def determinant(p)
      a = (p[0][0] - p[2][0]) * (p[1][1] - p[2][1])
      b = (p[1][0] - p[2][0]) * (p[0][1] - p[2][1])
      a - b
    end
  end
end
