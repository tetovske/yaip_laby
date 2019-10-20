# frozen_string_literal: true

# Array helper class
class Program
  def self.sort(arr)
    arr.sort
  end

  def self.convert(str)
    str.split(' ').map(&:to_i)
  end
end
