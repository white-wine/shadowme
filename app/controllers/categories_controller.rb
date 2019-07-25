class CategoriesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @careers = Career.where(category:@category)
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end
end
