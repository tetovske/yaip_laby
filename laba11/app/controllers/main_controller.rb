class MainController < ApplicationController
    def index; end
    def result
        arr = []
        params[:n].to_i.times do |i|
            params[:n].to_i.times do |j|
                a = find_dev(i).reduce { |a, b| a + b } == j
                b = find_dev(j).reduce { |a, b| a + b } == i
                arr << [i, j] if a && b && !arr.include?([j, i]) && i != j
            end 
        end
        @res = arr
    end
    def find_dev(x_val)
        res = []
        devider = x_val / 2
        while devider > 0 do
            res.puish(devider) if x_val % devider == 0
            devider -= 1
        end
        res
    end
end
