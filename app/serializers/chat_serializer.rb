class ChatSerializer < ActiveModel::Serializer
  attributes :id, :title, :messages, :sender_email

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages

  def messages
    object.messages
  end

  def sender_email
    object.sender.email
  end
end
