class Calculation < ApplicationRecord
  validates :input, uniqueness: true

  class << self
    def find_responce(input:, responce:)
      founded_rec = Calculation.find_by(input: n_val)
      insert_responce(n_val: input, res: responce) if founded_rec.nil?
      founded_rec
    end

    def insert_responce(n_val:, res:)
      record =  Calculation.new(input: n_val, json_responce: res)
      record.save if record.valid?
    end
  end
end
