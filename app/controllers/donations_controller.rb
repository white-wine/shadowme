class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end
  def create

  @donation = Donation.new(amount_cents: donation_params[:amount_cents])
  @donation.state = "pending"
  @donation.save
  redirect_to new_donation_payment_path(@donation)
  end

  def show
    @donation = donation.find(params[:id])
  end

  private

  def donation_params
    params.require(:donation).permit(:amount_cents)
  end

end
