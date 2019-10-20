# frozen_string_literal: true

require_relative 'file_changer'

# Class which controls I/O
class IOController
  class << self
    def main
      FileGenerator.new.create_file(25, 20)
      FileChanger.reverse_file('F.txt', 'G.txt')
      puts 'Готово!'
    end
  end
end

# Generate random file with special string size
class FileGenerator
  def create_file(f_size, s_size)
    f = File.new('./F.txt', 'w')
    f_size.times { f.puts((0..s_size).map { ('a'..'z').to_a[rand(26)] }.join) }
    f.close
  end
end

IOController.main
