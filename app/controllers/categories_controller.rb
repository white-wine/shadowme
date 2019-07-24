class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @careers = Career.where(category: params[:category])
  end

  private

  def set_category
    @category = Category.find(params[:id])

  end

end
