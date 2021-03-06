class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def authenticate_admin!
    unless current_user && current_user.admin
      flash[:warning] = "STOP IT!"
      redirect_to "/login"
    end
  end
end
