class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    # byebug
    ActionCable.server.broadcast 'chat_channel', {
      message: message
    }

  end

  private

  def render_message(message)
    MessagesController.render(
      partial: 'message',
      locals: {
        message: message
      }
    )
  end
end
