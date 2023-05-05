class ApplicationController < ActionController::Base
  before_action :require_authorization
  helper_method :current_user
  helper_method :logged_in?
  helper_method :member_authorization

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def member_authorization
    redirect_to exercises_path, notice: "You are not authorized to view that page." unless current_user.member?
  end

  def require_authorization
    redirect_to sessions_new_path, notice: "Please log in." unless logged_in?
  end
end
