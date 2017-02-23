App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('ul.chat-messages').append data['message']

    #message_broadcast_jobから処理が移ってきている
    #ActionCable.server.broadcastを実行すると処理が戻ってくる
    #data['message']はviewのdom要素自体を持ってきているので、appendでhtml要素ではなくdom要素(view)が追加される

  speak: (messageBody, groupId, userId) ->
    @perform 'speak', body: messageBody, group_id: groupId, user_id: userId

  $(document).on 'click', '#message_botton', (event)->
    messageBody = $('#message_body').val()
    groupId = $('#message_chat_group').val()
    userId = $('#message_user_id').val()
    App.message.speak messageBody, groupId, userId
    $('#message_body').val('')
    event.preventDefault()
