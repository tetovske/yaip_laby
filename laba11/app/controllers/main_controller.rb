# frozen_string_literal: true

# MainController class
class MainController < ApplicationController
  def index; end

  def result
    @res = FriendNumbers.call(input: params[:n].to_i).res
    respond_to do |format|
      format.js
      format.html
      format.json { render json: @res.to_json }
      format.xml { render xml: @res.to_xml }
    end
  end
end