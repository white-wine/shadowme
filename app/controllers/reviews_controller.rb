class ReviewsController < ApplicationController
  ##skip_before_action :authenticate_user!, only: [:index, :show]


  def create

  end

  private

  def set_review
    @review = Review.find(params[:id])

  end

end
