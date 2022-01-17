class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_message, only: %i[ update ]

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.chat_id = params[:chat_id]
    # ActionCable.server.broadcast 'ChatChannel', {
    #   message: @message.content
    # }
    @message.save
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
