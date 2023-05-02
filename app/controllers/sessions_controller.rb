class SessionsController < ApplicationController
  skip_before_action :require_authorization, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to exercises_path, notice: "Logged in!"
    else
      flash.now[:error] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to homes_index_path, notice: "Logged out!"
  end
end
