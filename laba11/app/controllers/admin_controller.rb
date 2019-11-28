class AdminController < ApplicationController
  def auth
  end

  def handling
    @rec = Calculation.all
  end

  def res
    @rec = Calculation.all
  end
end
