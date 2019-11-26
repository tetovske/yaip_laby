class AdminController < ApplicationController
  def auth
  end

  def handling
    @rec = Calculation.all
  end
end
