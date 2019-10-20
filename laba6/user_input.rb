require_relative 'my_math.rb'

# Input controller class
class Input
    def self.get_data
        puts 'Введите x:'
        x = gets.to_f
        puts 'Введите точность:'
        ac = gets.to_f
        r = MyMath.arctg(x, ac)
        puts "result: #{r.res} (accuracy: #{ac}, iterations: #{r.iter})" 
    end
end

Input.get_data