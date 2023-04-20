class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: [:show, :edit, :update, :destroy]

  before_action :set_course, only: [:new, :create]

  def index
    @enrolments = policy_scope(current_user.enrolments)
    @current_user_enrolments = Enrolment.where(user: current_user)
  end

  def show
    authorize @enrolment
  end

  def new
    authorize
    @enrolment = @course.enrolments.build
    authorize @enrolment
  end

  def create
    @enrolment = Enrolment.new(course: @course)
    @enrolment.user = current_user
    authorize @enrolment

    if @enrolment.save
      redirect_to enrolments_path, notice: 'Enrolment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @enrolment = current_user.enrolments.find(params[:id])
    authorize @enrolment
    if @enrolment.destroy
      redirect_to enrolments_path, notice: 'Enrolment was successfully cancelled.'
    else
      redirect_to enrolments_path, alert: 'Enrolment could not be cancelled.'
    end
  end

  private

  def set_enrolment
    @enrolment = current_user.enrolments.find(params[:id])
  end

  def enrolment_params
    params.require(:enrolment).permit(:course_id, :user_id)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
