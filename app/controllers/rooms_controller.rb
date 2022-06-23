class RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: rooms
  end

  def create
    room = if Room.find_by(name: params[:name]).nil?
             Room.create(room_params)
           else
             Room.find_by(name: params[:name])
           end

    ActionCable.server.broadcast 'rooms_channel', room
  end
end
