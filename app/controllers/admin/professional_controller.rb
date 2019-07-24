class Admin::ProfessionalController < ApplicationController

  def index
    @professional = current_user.professionals.first
  end

  def destroy
    @professional = professional.find(params[:id])
    @professional.destroy
    redirect_to admin_professionals_path, notice: 'professional was successfully destroyed.'
  end

end
