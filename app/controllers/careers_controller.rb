class CareersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def show

  end

  private

  def set_career
    @career = Career.find(params[:id])

  end

end
