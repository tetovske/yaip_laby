# frozen_string_literal: true

# ApplicationController class
class ApplicationController < ActionController::Base
  before_action :authorize, except: %i[auth new create authorize_user]

  def current_user
    @current_user ||= session[:current_user_id] &&
                      User.find_by(id: session[:current_user_id])
  end

  def authorize
    redirect_to signin_path unless current_user
  end
end
