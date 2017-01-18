
$(function(){

  // 検索したユーザーのHTMLを組み立て
  function buildAddUserHTML(user) {
    var html =
      '<div class="chat-group-user clearfix">' +
      '<p class="chat-group-user__name">' +
      user.name +
      '</p>' +
      '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + user.id + '" data-user-name="' + user.name + '">追加' +
      '</a>' +
      '</div>';
    return html
  }

    // 追加するユーザーのHTMLを組み立て
  function buildUserHTML(id, name) {
    var html =
      '<div class="chat-group-user clearfix" id="chat-group-user-' + id +  '">' +
      '<input type="hidden" name="chat_group[user_ids][]" value="' + id + '">' +
      '<p class="chat-group-user__name">' +
      name +
      '</p>' +
      '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="' + id + '">削除' +
      '</a>' +
      '</div>';
    return html
  }

  // ユーザーを検索する
  function searchUsers() {
    $.ajax('/users.json', {
      method: 'GET',
      data: {
        name: $('#user-search-field').val()
      },
      dataType: 'json'
    })
    .done(function(data){
      console.log(data);
      var html ='';
      $.each(data,function(index, val){
        html += buildAddUserHTML(data[index]);
        console.log(html);
      })
      $('#user-search-result').html(html);
    })
    .fail(function(data){
      alert('失敗');
    })
  }


  // ユーザー検索(インクリメンタルサーチ)
  $('#user-search-field').on('keyup', searchUsers);

  // ユーザーを追加
  $('#user-search-result').on('click', '.user-search-add', function(){
    var $this = $(this);
    var id = $this.data('userId');
    var name = $this.data('userName');

    var html = buildUserHTML(id, name);

    $('#chat-group-users').append(html);

    // 追加ボタンを削除
    $this.parent('.chat-group-user').remove();
  });


  // ユーザーを削除
  $('#chat-group-users').on('click', '.user-search-remove', function(){
    var $this = $(this);
    var id = $this.data('userId');

    // フォームからユーザー削除
    $('#chat-group-user-' + id).remove();
  })
});