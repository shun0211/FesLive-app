$(function(){
  function buildHTML(comment){
    var html = `<div class = "comment__posted">
                  <div class = "comment__posted__information">
                    <div class = "comment__user__nickname">
                      ${comment.user_nickname}
                    </div>
                    <div class = "comment__post__time">
                      ${comment.created_at}
                    </div>
                  </div>
                  <div class = "comment__posted__content">
                    ${comment.content}
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      var comment_html = buildHTML(data);
      $('.comment__contents').append(comment_html);
      $('.comment__form').val("");
      $('.comment__post__button').prop("disabled", false);
    })
  })
})