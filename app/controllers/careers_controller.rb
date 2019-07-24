class CareersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def show
    @career = Career.find(params[:id])
    @professionals = Professional.where(career: @career)
  end

end
