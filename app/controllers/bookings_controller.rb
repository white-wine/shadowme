class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new()
    @review = Review.new()

  end

  def create
    @professional = Professional.find(params["professional_id"])
    @booking = Booking.new(booking_params)
    @booking.professional = @professional
    @booking.user = current_user if @booking.professional.user != current_user
    @booking.booking_status = 0
    if @booking.save
      redirect_to booking_path(@booking)
    else
      raise
      render "professionals/show"
    end
  end

  def confirm
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.booking_status = 1
    @booking.save
  end

  def decline
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.booking_status = 2
    @booking.save
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :intro_message)

  end

end
