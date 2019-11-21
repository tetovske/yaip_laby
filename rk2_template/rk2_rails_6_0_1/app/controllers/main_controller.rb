class MainController < ApplicationController
  def index; end

  def result
    @result = params[:input]
  end
end
