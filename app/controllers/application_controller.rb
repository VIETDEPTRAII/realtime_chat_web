class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to login_path, flash: { yellow: 'You must login to chat!' } unless logged_in?
  end
end
