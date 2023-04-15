class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @enrolment = Enrolment.find(params[:enrolment_id])
  end

  # WIP
  def create
    raise
    @review = Review.new(review_params)
    @review.user = current_user
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
