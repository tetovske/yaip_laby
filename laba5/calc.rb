# frozen_string_literal: true

# module calc
module Calculator
  def self.eq(x_val)
    -(Math.cos((5 * x_val) / (1 - 6 * x_val))**0.5) / (x_val**2)
  end
end
