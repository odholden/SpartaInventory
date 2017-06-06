class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def check_login
    token = session[:token]

    if token
      User.token = token
    else
      redirect_to login_path
    end
  end

  def current_user
    session[:user] ? User.bind(session[:user]) : false
  end
end
