$(function(){
  function buildHTML(message){
    // 画像投稿の非同期
      if(message.image.url){
        var imageUrl = '<br><img src="' + message.image.url + '">';
      }else{
        var imageUrl ='';
      }
    var username = $('h5').text();
    var html =
      '<li class="chat-message">' +
      '<div class="chat-message__header clearfix">' +
      '<p class="chat-message__name">' +
      username +
      '</p>' +
      '<p class="chat-message__time">' +
      message.created_at +
      '</p>' +
      '</div>' +
      '<p class="chat-message__body">' +
      message.body +
      imageUrl +

      '</li>';
    return html
  }
  //チャットの一番下（最新の部分）に来るようにスクロール
  function scrollBottom() {
    var target = $('.chat-messages')
    $('.chat-body').scrollTop(target.height());
  }

  scrollBottom();
  // メッサージの非同期通信
  $('form#new_message').on('submit',function(e){
    e.preventDefault();
    var $form = $(this);
    var fd = new FormData($(this)[0]);

    var textField = $('#message_body');

    var message = textField.val();
    $.ajax({
      type:'POST',
      processData: false,
      contentType: false,
      url: document.location.href + '.json',
      data: fd,
      dataType:'json'
    })
    .done(function(data){
      console.log(data);
      var html = buildHTML(data);
      $('ul.chat-messages').append(html);
      textField.val('');
      scrollBottom();
      $(':submit[name="commit"]').prop('disabled', false);
    })
    .fail(function() {
      alert('error');
    });
  });

  //チャットのため自動更新機能
  if(location.pathname.match(/chat_groups\/\d+\/messages/)){
    setInterval(function(){
      $.ajax({
        type: 'GET',
        url: document.location.href + '.json',
        dataType: 'json'
      })
      .done(function(data){
        var html = ''
        $.each(data,function(index, val){
          console.log(data[index]);
          html += buildHTML(data[index]);
          console.log(html);
        })
        $('ul.chat-messages').html(html);
        scrollBottom();
      })
      .fail(function(){
        alert('自動更新失敗');
      })
    }, 10*1000);
  }

});
