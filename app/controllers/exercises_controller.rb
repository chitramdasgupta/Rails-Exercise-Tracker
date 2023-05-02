class ExercisesController < ApplicationController
  def index
    @exercises = current_user.exercises
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
    @exercise = current_user.exercises.find(params[:id])
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
    @exercise = current_user.exercises.find(params[:id])
    @exercise.destroy
    flash[:notice] = "The exercise was deleted"
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :calories)
  end

end
