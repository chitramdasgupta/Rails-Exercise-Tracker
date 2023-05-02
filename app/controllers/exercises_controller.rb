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
      flash[:error] = "The name should be present and calories should be a more than 0"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(exercise_params)
      redirect_to exercises_path, notice: "Exercise updated"
    else
      flash[:error] = "The name should be present and calories should be a more than 0"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :calories)
  end

end
