# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Calculation', type: :model do
  describe 'add record to database' do
    it 'should add record to database and check it' do
      field = Calculation.new(input: 1500, json_responce: '{}')
      Calculation.find_by(input: 1500).destroy unless field.valid?
      field.save
      expect(Calculation.where(input: 1500).exists?).to eq(true)
    end
  end

  context 'if program trying to add not valid options' do
    it 'should say that not valid input is not valid:))' do
      exs = Calculation.find_by(input: 300)
      Calculation.new(input: 300, json_responce: '{}').save if exs.nil?
      expect(Calculation.new(input: 300).valid?).to eq(false)
      Calculation.find_by(input: 300).destroy
      unless exs.nil?
        Calculation.new(input: 300, json_responce: exs.json_responce).save
      end
    end
  end
end
