class SessionController < ApplicationController
  def auth; end

  def authorize_user
    usr = User.authenticate(params[:login], params[:pass])
    unless usr.nil?
      session[:current_user_id] = usr.id
      redirect_to root_url
    else
      redirect_to signin_url
    end
  end

  def sign_out
    session[:current_user_id] = nil
    redirect_to signin_url
  end
end
