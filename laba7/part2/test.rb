# frozen_string_literal: true

require 'test/unit'
require_relative 'objects'

# Class for testing
class MyTest < Test::Unit::TestCase
  def setup; end

  def test1
    shape = Shape.new
    tr = Triangle.new
    pr = Prism.new
    assert(shape.class == tr.class.superclass)
    assert(tr.class == pr.class.superclass)
  end
end
