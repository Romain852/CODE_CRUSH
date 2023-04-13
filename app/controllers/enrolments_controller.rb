class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: [:show, :edit, :update, :destroy]
  before_action :authorize_enrolment, except: [:create]

  def index
    @enrolments = policy_scope(current_user.enrolments)
  end

  def show
    authorize @enrolment
  end

  def new
    @enrolment = @course.enrolments.build
    authorize @enrolment
  end

  def create
    @enrolment = @course.enrolments.build(enrolment_params)
    authorize @enrolment

    if @enrolment.save
      redirect_to [@course, @enrolment], notice: 'Enrolment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_enrolment
    @enrolment = current_user.enrolments.find(params[:id])
  end

  def enrolment_params
    params.require(:enrolment).permit(:user_id, :course_id)
  end

  def authorize_enrolment
    authorize current_user.enrolments
  end
end
