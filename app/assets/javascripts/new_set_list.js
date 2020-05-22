$(function(){
  $(".post__button").on("click", function(){
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
    .done(function(data){
      console.log(data);
    })
  })









})