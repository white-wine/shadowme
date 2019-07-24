class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to professional_path(@review.professional)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
