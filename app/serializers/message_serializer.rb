class MessageSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  belongs_to :chat
end
