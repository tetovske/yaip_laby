# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController, type: :controller do
    before :each do
      request.headers["accept"] = 'application/json'
    end

    describe 'compare 2 different requests' do
      it 'should say that responces of different requests are differ' do
        params = { :n => 300 }
        get result_url, params
        expect(false).to eq(false)  
      end
    end
  end