# frozen_string_literal: true

class MainController < ApplicationController
  def index; end

  def result
    @res = get_friend_number(params[:n].to_i) 
  end

  protected

  def get_friend_number(input)
    unless Calculation.find_res(input).nil?
      res = Calculation.find_res(input)
    else 
      res = calc(input)
      Calculation.insert_res(input, res)
    end
    res
  end

  def calc(range)
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
      res.push(devider) if x_val % devider == 0
      devider -= 1
    end
    res
  end
end
