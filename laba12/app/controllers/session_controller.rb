# frozen_string_literal: true

# SessionController class
class SessionController < ApplicationController
  def auth; end

  def authorize_user
    usr = User.authenticate(params[:login], params[:pass])
    if usr.nil?
      redirect_to signin_url
    else
      session[:current_user_id] = usr.id
      redirect_to root_url
    end
  end

  def sign_out
    session[:current_user_id] = nil
    redirect_to signin_url
  end
end
