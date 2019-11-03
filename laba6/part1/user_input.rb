# frozen_string_literal: true

require_relative 'my_math.rb'

# Input controller class
class Input
  def self.start
    puts 'Введите x:'
    x = gets.to_f
    puts 'Введите точность:'
    ac = gets.to_f
    r = MyMath.arctg(x, ac)
    puts "result: #{r.res} (accuracy: #{ac}, iterations: #{(r.n_val - 3) / 2})"
  end
end

Input.start
