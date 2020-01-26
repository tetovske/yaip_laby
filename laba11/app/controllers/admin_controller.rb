# frozen_string_literal: true

# AdminController class
class AdminController < ApplicationController
  def auth; end

  def handling
    @rec = Calculation.all
  end

  def res
    @rec = ConvertObject.call(obj: Calculation.all).res.to_xml
  end
end
