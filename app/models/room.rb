class Room < ApplicationRecord
  after_save :broadcast

  private

  def broadcast
    ActionCable.server.broadcast 'rooms_channel', self
  end
end
