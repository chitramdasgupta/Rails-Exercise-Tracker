class ApplicationController < ActionController::Base
  before_action :require_authorization
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_authorization
    redirect_to sessions_new_path unless logged_in?
  end
end
