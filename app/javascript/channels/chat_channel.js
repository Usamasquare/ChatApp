import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to the chat channel');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('Disonnected to the chat channel');
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    var messages = $('#chatbox');
    messages.append(data['message']);
    messages.scrollTop(messages[0].scrollHeight);
  }
});
