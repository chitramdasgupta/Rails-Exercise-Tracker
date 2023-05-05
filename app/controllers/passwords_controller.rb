class PasswordsController < ApplicationController
  before_action :require_authorization

  def edit
  end

  def update
    if current_user.update(password_params)
      redirect_to profile_path(current_user), notice: 'Password successfully updated'
    else
      flash[:error] = 'Password update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
