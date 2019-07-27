class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end
  def create

  donation = Donation.create!(amount: donation, state: 'pending')

  redirect_to new_donation_payment_path(donation)
  end
   private
  def donation_params
    params.require(:donation).permit(:amount_cents)
  end
  def show
    @donation = donation.find(params[:id])
  end
end
