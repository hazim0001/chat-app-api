class Room < ApplicationRecord
  after_save :broadcast
  has_many :messages

  private

  def broadcast
    ActionCable.server.broadcast 'rooms_channel', self
  end
end
