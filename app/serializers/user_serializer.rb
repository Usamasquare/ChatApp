class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :chats
  has_many :messages
end
