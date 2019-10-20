require_relative 'objects'

# IOController class
class IOController
  class << self
    def main
      tr = Triangle.new(p: [[0, 0], [2, 0], [2, 3]])
      p tr.square
    end
  end
end

IOController.main
