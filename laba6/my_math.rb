# Math module
class MyMath
    def self.arctg(x, accuracy)
        calculated_res = Math.atan(x)
        n = 3
        s = 1
        res = x
        i = 0
        while (res - calculated_res).abs > accuracy do
            res = res + (x**n / n) * (-1)**s
            s = s == 2 ? 1 : 2
            n = n + 2
            i = i + 1
        end
        CalculationResult.new(res, i)
    end

    class CalculationResult
        attr_accessor :res, :iter
        def initialize(result, iterations)
            @res = result
            @iter = iterations
        end
    end
end