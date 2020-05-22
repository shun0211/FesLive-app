$(function(){
  $(".post__button").on("click", function(){
    $('.error_messages_box').empty();
    var form_data = document.forms.new_set_list
    console.log(form_data);
    var formData = new FormData(form_data)
    var url = "/events/" + gon.event.id + "/set_lists"
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false
    })
    .done(function(error_messages){
      var error_num = Object.keys(error_messages)
      console.log(error_num)
      if (error_num == 0){
        window.location.href = `/events/${gon.event.id}/choise_artist`;
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