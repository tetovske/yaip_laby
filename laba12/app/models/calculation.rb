# frozen_string_literal: true

require 'json'

# Model contains each calculation sended by user
class Calculation < ApplicationRecord
  validates :input, uniqueness: true

  class << self
    def find_res(n_val)
      return if Calculation.find_by(input: n_val).nil?

      JSON.parse(Calculation.find_by(input: n_val).json_responce)
    end

    def insert_res(n_val, res)
      record = Calculation.new(input: n_val, json_responce: res.to_json)
      record.save if record.valid?
    end
  end
end
