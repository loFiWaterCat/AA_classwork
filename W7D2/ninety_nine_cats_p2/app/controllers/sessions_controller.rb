class SessionsController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    login_user!
  end

  def destroy 
    user = current_user
    if user
      user.reset_session_token!
    end
    session[:session_token] = nil
    redirect_to new_session_url
      
  end

end
