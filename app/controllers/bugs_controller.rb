class BugsController < ApplicationController
  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)

    if @bug.save
      BugReportMailer.submit_bug_report(current_user, @bug).deliver_now
      flash[:notice] = "Bug report submitted successfully!"
      redirect_to exercises_path
    else
      flash[:error] = "Error submitting bug report"
      render :new, status: :unprocessable_entity
    end
  end

  def bug_params
    params.require(:bug).permit(:title, :description)
  end
end
