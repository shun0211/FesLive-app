$(function(){
  function buildHTML(comment){
    var html = `<div class = "comment__posted" data-comment-id = "${comment.id}">
                  <div class = "comment__posted__information">
                    <div class = "comment__user__nickname">
                      ${comment.user_nickname}
                    </div>
                    <div class = "comment__post__time">
                      ${comment.created_at}
                    </div>
                  </div>
                  <div class = "comment__posted__box">
                    <div class = "comment__posted__content">
                      ${comment.content}
                    </div>
                    <button class = "image__comment__delete__button">
                      <i class = "far fa-trash-alt"></i>
                    </button>
                  </div>
                </div>`
    return html;
  }
  $('#new_comment_to_image').on('submit', function(e){
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
      $('.comment__empty').remove();
    })
  })


  $(document).on('click', '.image__comment__delete__button', function(){
    var comment_data_id = $(this).parent().parent().data("comment-id")
    console.log(comment_data_id)
    var url = "/images/" + gon.image.id + "/comment_to_images/" + comment_data_id
    $.ajax({
      url: url,
      type: "DELETE",
      data: comment_data_id,
      datatype: "json"
    })
    .done(function(comment_id){
      $('[data-comment-id = '+ comment_id + ']').remove();
    })
  })
})
