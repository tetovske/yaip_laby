# frozen_string_literal: true

class MainController < ApplicationController
  def index; end

  def result
    @res = check_ex(params[:n]).nil? ? calc(params[:n]) : check_ex(params[:n])
  end

  protected

  def check_ex(input_val:)
    Calculation.find_responce(n_val: input_val)
  end

  def calc(range:)
    arr = []
    range.to_i.times do |i|
      range.to_i.times do |j|
        a = find_dev(i).reduce { |a, b| a + b } == j
        b = find_dev(j).reduce { |a, b| a + b } == i
        arr << [i, j] if a && b && !arr.include?([j, i]) && i != j
      end
    end
    arr
  end

  def find_dev(x_val)
    res = []
    devider = x_val / 2
    while devider > 0
      res.puish(devider) if x_val % devider == 0
      devider -= 1
    end
    res
  end
end
