class AddUserToChat < ActiveRecord::Migration[6.1]
  def change
    add_reference :chats, :sender, null: false, foreign_key: {to_table: :users}
    add_reference :chats, :receiver, null: false, foreign_key: {to_table: :users}
  end
end
