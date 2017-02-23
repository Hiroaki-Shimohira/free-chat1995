class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(body: data['body'], chat_group_id: data['group_id'], user_id: data['user_id'])
    # 引数のmessageにgroup.coffeeで送ったパラメータが入っている
    # message.rbにデータを作成した後の処理が書かれているのでそちらに処理が飛ぶ
  end
end
