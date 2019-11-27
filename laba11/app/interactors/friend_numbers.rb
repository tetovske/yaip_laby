# frozen_string_literal: true

# Friend Number interactor class
class FriendNumbers
  include Interactor

  before :find_in_db

  private

  def find_in_db
    if Calculation.find_res(context.input).nil?
      context.res = calc(context.input)
      Calculation.insert_res(context.input, context.res)
    else
      context.res = Calculation.find_res(context.input)
    end
  end

  def calc(range)
    arr = []
    range.to_i.times do |i|
      range.to_i.times do |j|
        a = find_dev(i).reduce { |x, y| x + y } == j
        b = find_dev(j).reduce { |x, y| x + y } == i
        arr << [i, j] if a && b && !arr.include?([j, i]) && i != j
      end
    end
    arr
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
