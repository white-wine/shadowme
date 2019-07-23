class BookingsController < ApplicationController

  def index

  end

  def show

  end

  def create

  end

  def update

  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
