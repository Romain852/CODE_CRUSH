class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @courses = Course.all
    authorize Course
  end

  def show
    @reviews = @course.reviews
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

  private

  def course_expired?(course)
    course.session_end < Date.today
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :price, :category, :photo, syllabus: [], photos: [], :session_start => [], :session_end => []).merge(user: current_user)
  end
end
