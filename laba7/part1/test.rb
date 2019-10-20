# frozen_string_literal: true

require 'test/unit'

# Class which test our program
class MyTest < Test::Unit::TestCase
  def setup; end

  def test_file_ex
    assert(File.file?('F.txt') && File.file?('G.txt'))
  end

  def test_files
    if File.file?('F.txt') && File.file?('G.txt')
      ar = TestFunc.rev(File.open('F.txt').map(&:chomp))
      assert_equal(ar, File.open('G.txt').map(&:chomp))
    else
      assert(false)
    end
  end
end

# Class with test functions
class TestFunc
  class << self
    def rev(arr)
      arr.map(&:reverse).reverse
    end
  end
end
