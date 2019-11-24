# frozen_string_literal: true

# Task Controller Class
class TaskController < ApplicationController
  def input; end

  def result
    arr = params[:input].scan(/-{,1}\d+/).map(&:to_i)
    count = arr.select { |x| (x % 3).zero? && (x % 4).zero? }
    @res = paste_in(arr, count.size) if arr.size == 10
  end

  protected

  def paste_in(arr, num)
    arr = arr.reverse
    arr[arr.find_index(&:even?)] = num
    arr.reverse
  end
end
