class MessagesController < ApplicationController
  before_action :set_message, only: %i[ update ]


  def create
    @message = message.new(message_params)
    @message.sender_id = current_user.id
    @message.receiver_id = current_user.id
  end

  def update
    @message.update(content: message_params[:content])
    @chat = Chat.find(@message.chat_id)
  end


  private
    def set_message
      @message = Message.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content)
    end
end
