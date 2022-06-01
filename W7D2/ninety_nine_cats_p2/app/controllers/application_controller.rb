class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
        # why does it need ||=?
    end

    def logged_in?
        !!current_user
    end

    def login_user!
        @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
        if @user
          session[:session_token] = @user.reset_session_token!
          redirect_to cats_url
        else
          render :new
        end
    end

    def require_logged_out
        redirect_to cats_url if logged_in?
    end
end
