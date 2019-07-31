class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new()
    @messages = Message.where(booking: @booking)
    @message = Message.new()
  end

  def create
    @professional = Professional.find(params["professional_id"])
    @booking = Booking.new(booking_params)
    @booking.professional = @professional
    @booking.start_book = params[:booking][:amount_of_days].split(" to ")[0]
    @booking.end_book = params[:booking][:amount_of_days].split(" to ")[1]

    @booking.user = current_user if @booking.professional.user != current_user
    @booking.booking_status = 0
    if @booking.save
      redirect_to booking_path(@booking)
    else

        # flash.now[:alert] = @booking.errors.full_messages[0]
        # flash.now[:alert] = @booking.errors.full_messages[1]
        # flash.now[:alert] = @booking.errors.full_messages[2]
      flash.now[:alert] = "Please complete the empty fields"

      render "professionals/show"

    end
  end

  def confirm
    @booking = Booking.find(params[:booking_id])
    @booking.booking_status = 1
    @booking.save
  end

  def decline
    @booking = Booking.find(params[:booking_id])
    @booking.booking_status = 2
    @booking.save
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:intro_message, :amount_of_days)

  end

end
