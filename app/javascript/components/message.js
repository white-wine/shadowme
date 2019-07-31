import dayjs from "dayjs"

export const chat = () => {
  const updateChat = (data, sender) => {
    const formatDate = (date) => {
      return `${date.getDay()}-${date.getMonth()}-${date.getFullYear()} ${date.getHours()}:${date.getMinutes()}`;
    };

    $('.chat-box').append(`
      <div class="chat-bubble-wrapper">
        <div class="chat-bubble ${sender}">
          <div class="chat-username">${data.identifier}</div>
          <div class="chat-message">${data.content}</div>
        </div>

        <div class="chat-timestamp  ${sender}">${dayjs(new Date(data.created_at)).format("MMM D, hh:mm A")}</div>
      </div>
    `);
  };

  $('#chat-form').on('ajax:success', function(data) {
    $('#chat-form')[0].reset();
  });

  const pusher = new Pusher('0b12b52fd408ecfdf56b', {
    cluster: 'us2',
    encrypted: true
  });

  const chatChannel = pusher.subscribe('message');

  let current_user = $('.chat-box').data("current_user")
  let booking_id = $('.chat-box').data("booking_id")

  chatChannel.bind('new', function(data) {
    let sender = data.sender_id == current_user ? "me" : "him"
    if (data.booking_id == booking_id) {
      updateChat(data, sender);
      let chatBox = document.querySelector('.chat-box');
      chatBox.scrollTop = chatBox.scrollHeight - chatBox.clientHeight;
    }
  });
};
