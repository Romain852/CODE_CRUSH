class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_enrolment, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @enrolment = Enrolment.find(params[:enrolment_id])
    @review = @enrolment.reviews.build(review_params)
    @review.user = current_user

    authorize @review

    if @review.save
      redirect_to course_path(@enrolment.course), notice: 'Review was successfully created.'
    else
      @review.errors.full_messages
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    @review.update(review_params)
    redirect_to dashboard_path, notice: 'Review was successfully updated.'
  end

  def destroy
    authorize @review
    @review.destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_enrolment
    @enrolment = Enrolment.find(params[:enrolment_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
