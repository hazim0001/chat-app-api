class MessagesController < ApplicationController
  def index
    messages = Message.where(message_params)
    render json: messages
  end

  def create
    # byebug
    @message = Message.new(message_params)
    if @message.save
      ChatroomChannel.broadcast_to(
        @message.room,
        @message
      )
    end
    head :ok
  end

  def destroy; end

  private

  def message_params
    params.permit(:text, :room_id)
  end
end
