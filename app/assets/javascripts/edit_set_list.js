$(function(){
  $(".edit__button").on("click", function(){
    var form_data = document.forms.edit_set_list
    var formData = new FormData(form_data);
    var url = "/events/" + gon.event.id + "/set_lists/" + gon.set_list.id
    $.ajax({
      url: url,
      data: formData,
      dataType: "json",
      type: "PATCH",
      contentType: false,
      processData: false
    })
    .done(function(error_messages){
      var error_num = Object.keys(error_messages).length
      if (error_num == 0){
        window.location.href = `/events/${gon.event.id}/set_lists/${gon.set_list.id}`
      }
      else{
        error_messages.forEach(function(error_message){
          var error_alert = `<div class = error_message>
                               * ${error_message}
                             </div>`
          $('.error_messages_box').append(error_alert);
          $('.error_messages_box').css({
            'padding': '30px 20% 0',
            'font-size': '13px',
            'color': 'red'
          })
        })
      }
    })
  })
})