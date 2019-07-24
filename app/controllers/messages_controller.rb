class MessagesController < ApplicationController

  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    authorize @message
    @message.user = current_user
    @message.booking = @booking
    @message.save
  end

  private

  def set_message
    @message = Message.find(params[:id])

  end
  def message_params
    params.require(:review).permit(:content, :rating)
  end


end
