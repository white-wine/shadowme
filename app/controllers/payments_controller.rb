class PaymentsController < ApplicationController
    skip_before_action :authenticate_user!
  def new
    @donation = Donation.find(params[:donation_id])
  end

  def create
  @donation = Donation.find(params[:donation_id])
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @donation.amount_cents,
    description:  "Payment for donation",
    currency:     "ARS"
  )

  @donation.update(payment: charge.to_json, state: 'paid')
  redirect_to donation_path(@donation)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_donation_payment_path(@donation)
  end
end
