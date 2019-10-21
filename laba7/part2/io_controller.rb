# frozen_string_literal: true

require_relative 'objects'

# IOController class
class IOController
  class << self
    def main
      tr = Triangle.new([[0, 0, 0], [2, 0, 0], [2, 3, 0]])
      puts "Площадь треугольника: #{tr.square}"
      pnts = [[3, 0, 0], [0, 3, 0], [0, 0, 0], [3, 0, 3], [0, 3, 3], [0, 0, 3]]
      prism = Prism.new(pnts)
      puts "Площадь призмы: #{prism.square}"
    end
  end
end

IOController.main
