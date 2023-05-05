class ApplicationController < ActionController::Base
  before_action :require_authorization
  helper_method :current_user
  helper_method :logged_in?
  helper_method :trainer?
  helper_method :admin?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def trainer?
    logged_in? && current_user.trainer?
  end

  def admin?
    logged_in? && current_user.admin?
  end

  def logged_in?
    !current_user.nil?
  end

  def require_authorization
    redirect_to sessions_new_path, notice: "Please log in." unless logged_in?
  end
end
