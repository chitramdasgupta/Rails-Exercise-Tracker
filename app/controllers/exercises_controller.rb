class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      flash[:success] = "Exercise added"
      redirect_to exercises_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :calories)
  end

end
