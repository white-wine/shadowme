json.extract! @message, :id, :identifier, :content, :sender_id, :booking_id, :created_at
json.url booking_messages_url(@message, format: :json)
