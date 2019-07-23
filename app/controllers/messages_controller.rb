class MessagesController < ApplicationController

  def create

  end

  private

  def set_message
    @message = Message.find(params[:id])

  end

end
