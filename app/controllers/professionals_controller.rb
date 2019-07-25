class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :store_user_location!, if: :storable_location?


  def index
  end

  def show
    @booking = Booking.new()
  end

  def new
    @professional = Professional.new
    authorize @professional
  end

  def create
    @professional = Professional.new(professional_params)
    authorize @professional
    @professional.user = current_user
    if @professional.save
      redirect_to professional_path(@professional)
    else
      render new
    end
  end

  def edit
  end


  def update
    if @professional.update(professional_params)
      redirect_to @professional, notice: 'Your professional was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @professional.destroy
    redirect_to admin_professionals_path, notice: 'Professional was successfully destroyed.'
  end

  private

  def set_professional
    @professional = Professional.find(params[:id])
  end


  def professional_params
    params.require(:professional).permit(:career, :location, :resume, :experience_in_years, :company_logo)
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
