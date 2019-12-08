# frozen_string_literal: true

require_relative 'array_helper'

# class documentation
class IOController
  attr_accessor :arr
  def start
    @arr = Program.convert(gets.to_s)
    puts 'Исходный массив:'
    @arr.select.with_index { |num, id| puts "[#{id}] #{num}\n" }
    @arr = Program.sort(arr)
    print_res
  end

  def print_res
    puts 'Отсортированный массив:'
    @arr.select.with_index { |num, id| puts "[#{id}] #{num}\n" }
    puts 'Элементы с нечетными индексами:'
    @arr.select.with_index { |num, id| puts "#{num}\n" if id.odd? }
    puts 'Элементы с четными индексами:'
    @arr.select.with_index { |num, id| puts "#{num}\n" if id.even? }
  end
end

IOController.new.start
