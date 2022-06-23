class RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: rooms
  end

  def create
    room = Room.new(room_params)
    room.save
    head :ok
  end

  private

  def room_params
    params.permit(:name)
  end
end
