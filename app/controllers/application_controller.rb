class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def check_login
    token = session[:token] || request.headers["Authorization"]

    if token
      User.token = token
    else
      respond_to do |format|
        format.html { redirect_to login_path }
        format.json { render :status => 403 }
      end
    end
  end

  def current_user
    session[:user] ? User.bind(session[:user]) : false
  end
end
