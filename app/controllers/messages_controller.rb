class MessagesController < ApplicationController

  def create
    @booking = Booking.find(params[:booking_id])

    byebug
    @message = Message.new(message_params)
    # authorize @message
    @message.sender = current_user
    @message.booking = @booking
    respond_to do |format|
      if @message.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :identifier)
  end
end
