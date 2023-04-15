class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: [:show, :edit, :update, :destroy]
  before_action :authorize_enrolment, except: [:create]
  # before_action :set_course

  def index
    @enrolments = policy_scope(current_user.enrolments)
    @current_user_enrolments = Enrolment.where(user: current_user)
  end

  def show
    authorize @enrolment
  end

  def new
    @enrolment = @course.enrolments.build
    authorize @enrolment
  end

  def create
    @course = Course.find(params[:id])
    @enrolment = Enrolment.new(course: @course)
    @enrolment.user = current_user
    # raise
    # @enrolment = @course.enrolments.build(enrolment_params)
    # @enrolment.user = current_user
    if @enrolment.save
      redirect_to course_enrolments_path(@course), notice: 'Enrolment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
    authorize @course
    authorize @enrolment
  end

  private

  def set_enrolment
    @enrolment = current_user.enrolments.find(params[:id])
  end

  def enrolment_params
    params.require(:enrolment).permit(:course_id, :user_id)
  end

  def authorize_enrolment
    authorize current_user.enrolments
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
