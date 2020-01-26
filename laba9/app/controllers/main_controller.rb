# frozen_string_literal: true

# MainController class
class MainController < ApplicationController
  def index; end

  def result
    respond_to { |format| format.js }
    arr = []
    par = params[:n].to_i
    par.times do |i|
      par.times do |j|
        arr << [i, j] if compare_nums(i, j) && !arr.include?([j, i]) && i != j
      end
    end
    @res = arr
  end

  private

  def compare_nums(a_val, b_val)
    find_dev(a_val).reduce(:+) == b_val && find_dev(b_val).reduce(:+) == a_val
  end

  def find_dev(x_val)
    res = []
    devider = x_val / 2
    while devider.positive?
      res.push(devider) if (x_val % devider).zero?
      devider -= 1
    end
    res
  end
end
