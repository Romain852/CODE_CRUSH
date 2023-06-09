class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :data, :fullstack]

  def index
    @courses = policy_scope(Course)
    @courses = Course.all
    if params[:query].present?
      @courses = Course.search(params[:query])
    else
      @courses = Course.all
    end
  end

  def my_courses
    @courses = current_user.courses
  end

  def show
    @reviews = @course.reviews
    @enrolment = @course.enrolments.find_by(user: current_user)
    authorize @course
  end

  def new
    @course = current_user.courses.build
    authorize @course
  end

  def create
    @course = current_user.courses.build(course_params)
    authorize @course
    if @course.save
      redirect_to course_path(@course), notice: "Course was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @course
  end

  def update
    authorize @course
    if @course.update(course_params)
      redirect_to course_path(@course), notice: "Course was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course = Course.find(params[:id])
    authorize @course
    @course.destroy
    redirect_to courses_path, notice: "Course was successfully destroyed."
  end

  def fullstack
    @courses = Course.where(category: "Fullstack")
    authorize @courses
  end

  def data
    @courses = Course.where(category: "Data")
    authorize @courses
  end

  # Code added to cancel enrolments
  def cancel_enrolment
    @enrolment = current_user.enrolments.find_by(course_id: params[:course_id], id: params[:id])
    authorize @enrolment
    if @enrolment.destroy
      redirect_to enrolments_path, notice: 'Enrolment was successfully cancelled.'
    else
      redirect_to enrolments_path, alert: 'Enrolment could not be cancelled.'
    end
  end


  private

  def course_expired?(course)
    course.session_end < Date.today
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :price, :category, :photo, syllabus: [], :session_start => [], :session_end => []).merge(user: current_user)
  end
end
