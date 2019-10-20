# frozen_string_literal: true

require 'test/unit'
require_relative 'calc.rb'

# IO system controller
class IOController
  include Calculator

  def self.main
    puts 'Введите x'
    result = Calculator.eq(gets.to_i)
    puts "Результат: #{result}"
  end
end

IOController.main
