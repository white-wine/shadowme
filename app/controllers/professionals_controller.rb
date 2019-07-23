class ProfessionalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def set_professional
    @professional = Professional.find(params[:id])

  end

end
