
# Input controller class
class Input
    def self.get_data()
        puts 'Введите x:'
        x = gets.to_f
        puts 'Введите точность:'
        ac = gets.to_f
        r = MyMath.arctg(x, ac)
        puts "result: #{r.res} (accuracy: #{ac}, iterations: #{r.iter})" 
    end
end

fib = Enumerator.new do |yielder|
    a = 1
    loop do
        yielder.yield a
        a = a + 1
    end
end

p fib.take(10)
Input.get_data()