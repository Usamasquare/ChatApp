class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  after_save {
    byebug
    ActionCable.server.broadcast 'ChatChannel', {
        message: content
      }
  }

end
