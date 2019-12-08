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

  # rubocop:disable Metrics/AbcSize
  def square
    pnt = @pts
    a = [pnt[0].x - pnt[2].x, pnt[0].y - pnt[2].y]
    b = [pnt[1].x - pnt[2].x, pnt[1].y - pnt[2].y]
    0.5 * Matrix[a, b].determinant
  end
  # rubocop:enable Metrics/AbcSize
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

  # rubocop:disable Metrics/AbcSize
  def square
    pnt = @pts
    a = super * 2 + dis(pnt[0], pnt[1]) * dis(pnt[0], pnt[3])
    a += dis(pnt[1], pnt[2]) * dis(pnt[1], pnt[4])
    a + dis(pnt[2], pnt[0]) * dis(pnt[2], pnt[5])
  end
  # rubocop:enable Metrics/AbcSize
end
