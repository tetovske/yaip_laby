# frozen_string_literal: true

# Class doc
class Scale
  class << self
    def scale(b_val, lambda = nil, &block)
      block = lambda unless block_given?
      b_val / block.call(1)
    end
  end
end
