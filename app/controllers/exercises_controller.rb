class ExercisesController < ApplicationController
  before_action :member_authorization, only: [:new, :create, :edit, :update]

  def index
    if current_user.member?
      @exercises = current_user.exercises
    elsif current_user.trainer?
      trainer = User.find(current_user.id)
      @exercises = Exercise.where(user_id: trainer.members.pluck(:id))
    else
      @exercises = Exercise.all
    end
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      flash[:success] = "Exercise added"
      redirect_to exercises_path
    else
      flash[:error] = "The name should be present and calories should be a more than 0"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if current_user.member?
      @exercise = current_user.exercises.find(params[:id])
    elsif current_user.trainer? || current_user.admin?
      @exercise = Exercise.find_by(params[:id])
    end
  end

  def edit
    @exercise = current_user.exercises.find(params[:id])
  end

  def update
    @exercise = current_user.exercises.find(params[:id])

    if @exercise.update(exercise_params)
      redirect_to exercises_path, notice: "Exercise updated"
    else
      flash[:error] = "The name should be present and calories should be a more than 0"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.member?
      @exercise = current_user.exercises.find(params[:id])
    elsif current_user.trainer? || current_user.admin?
      @exercise = Exercise.find(params[:id])
    end
    # @exercise = current_user.exercises.find(params[:id])
    @exercise.destroy
    flash[:notice] = "The exercise was deleted"
    redirect_to exercises_path
  end

  def quick_stats
    if current_user.member?
      @exercises = current_user.exercises
    elsif current_user.trainer? || current_user.admin?
      @exercises = Exercise.all
    end

    @exercise_count = @exercises.count
    @total_calories = @exercises.sum(:calories)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :calories)
  end

end
