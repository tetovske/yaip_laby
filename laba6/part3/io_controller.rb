# frozen_string_literal: true

require_relative 'scale'

# Class doc
class IOController
  class << self
    def main
      puts 'Введите B:'
      b = gets.to_f
      puts "Результат sin(x) * x: #{Scale.scale(b) { |x| x * Math.sin(x) }}"
      puts "Результат tg(x): #{Scale.scale(b, ->(x) { Math.tan(x) })}"
    end
  end
end

IOController.main
