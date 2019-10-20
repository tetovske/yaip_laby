class Arctg
    
end

list = Enumerator.new do |yielder|
    sum, prev, n = 0.5, 1, 3
    s, x = 1, 0.5
    loop do 
        yielder.yield sum, prev
        prev = sum
        sum += (-1)**s * ((x**n) / n)
        n += 2
        s = s == 2 ? 1 : 2
    end
end

puts list.take_while { |sum, prev| (prev - sum).abs > 1e-4 }