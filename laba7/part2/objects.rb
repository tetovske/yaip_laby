# frozen_string_literal: true

require 'matrix'

# Point class
class Point
  attr_accessor :x, :y, :z

  def initialize(args)
    @x = args[:x]
    @y = args[:y]
    @z = args[:z]
  end
end

# Parent class for shape instances
class Shape
  attr_reader :pts

  def initialize(args = nil)
    @pts = []
    args = Array.new(3) { Array.new(3, 0) } if args.nil?
    3.times do |i|
      pnt = Point.new(x: args[i][0], y: args[i][1], z: args[i][2])
      @pts << pnt
    end
  end

  # Abstract method
  def square
    raise 'Error'
  end

  protected

  def dis(pt1, pt2)
    Math.sqrt((pt2.x - pt1.x)**2 + (pt2.y - pt1.y)**2 + (pt2.z - pt1.z)**2)
  end
end

# Triangle class
class Triangle < Shape
  def initialize(args = nil)
    super(args)
  end

  def square
    a = [@pts[0].x - @pts[2].x, @pts[0].y - @pts[2].y]
    b = [@pts[1].x - @pts[2].x, @pts[1].y - @pts[2].y]
    0.5 * Matrix[a, b].determinant
  end
end

# Prism class
class Prism < Triangle
  def initialize(args = nil)
    @pts = []
    args = Array.new(6) { Array.new(3, 0) } if args.nil?
    6.times do |i|
      pnt = Point.new(x: args[i][0], y: args[i][1], z: args[i][2])
      @pts << pnt
    end
  end

  def square
    a = super * 2 + dis(@pts[0], @pts[1]) * dis(@pts[0], @pts[3])
    a += dis(@pts[1], @pts[2]) * dis(@pts[1], @pts[4])
    a + dis(@pts[2], @pts[0]) * dis(@pts[2], @pts[5])
  end
end
