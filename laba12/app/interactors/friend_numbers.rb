# frozen_string_literal: true

# Friend Number interactor class
class FriendNumbers
  include Interactor

  before :find_in_db

  private

  # rubocop:disable Metrics/AbcSize
  def find_in_db
    if Calculation.find_res(context.input).nil?
      context.res = calc(context.input)
      Calculation.insert_res(context.input, context.res)
    else
      context.res = Calculation.find_res(context.input)
    end
  end
  # rubocop:enable Metrics/AbcSize

  def calc(_range)
    arr = []
    par = params[:n].to_i
    par.times do |i|
      par.times do |j|
        arr << [i, j] if compare_nums(i, j) && !arr.include?([j, i]) && i != j
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
