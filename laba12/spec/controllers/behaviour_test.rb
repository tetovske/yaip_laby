# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  describe 'register user and make some calculations' do
    it 'should register user and go to main page' do
      get :sign_out
      @controller = SessionController.new
      get :authorize_user, params: { login: 'test', pass: '1234' }
      @controller = MainController.new
      get :index
      get :result, params: { txt: '1 2' }
      expect(response).to redirect_to('/main/index')
    end
  end
end
