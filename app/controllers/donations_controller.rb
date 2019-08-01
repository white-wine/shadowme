class DonationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @donation = Donation.new(amount_cents: nil)
    authorize @donation
  end

  def create
    @donation = Donation.new(amount: donation_params[:amount_cents])
    @donation.state = "pending"
    @donation.save
    redirect_to new_donation_payment_path(@donation)
    authorize @donation
  end

  def show
    @donation = Donation.find(params[:id])
    authorize @donation
  end

  private

  def donation_params
    params.require(:donation).permit(:amount_cents)
  end
end
