class UsersController < ApplicationController
  skip_before_action :require_authorization, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to exercises_path, notice: "Thank you for signing up!"
    else
      flash.now[:error] = "Please try again"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, notice: "Your profile was successfully updated"
    else
      flash[:error] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :phone_number, :profile_picture, :role)
  end
end
