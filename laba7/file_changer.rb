# frozen_string_literal: true

# Reverse strings etc.
class FileChanger
  class << self
    def reverse_file(name, new_name)
      f = File.new(new_name, 'w')
      File.open(name).map { |l| l.chomp.reverse }.reverse.each { |l| f.puts(l) }
    rescue StandardError => e
      puts e
    end
  end
end
