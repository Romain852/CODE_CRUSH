class EnrolmentsController < ApplicationController
  def index
    @enrolments = current_user.enrolments
  end

  def create
    @course = Course.find(params[:id])
    @enrolment = Enrolment.new(course: @course)
    @enrolment.user = current_user
    if @enrolment.save
      redirect_to enrolments_path(current_user)
    else
      render :create, status: :unprocessable_entity
    end
  end
end
