$(function(){
  // 出品画像ボックスをクリックした際、s.file_fieldsメソッドを実行する記述
  $('.image__upload__field').on('click', function(){
    var number = $('.event-image').length;
    $(".image__form").click();
  })
//   // 画像を複数投稿を可能にする記述
//   $(document).on('change', '.image__form', function(){
//     var number = $('.event-image').length;
//     // 何枚目のファイルかを示す
//     var num = $('.event-image').length + 1;
//     // var new_image_input = `<input class = ".image__form" type = "file" id ="item_product_images_attributes_${num}_image" name = "item[product_images_attributes][${num}][image]">`
//     // $('.input_box').append(new_image_input)
//     // 選択したファイル情報を取得し変数に格納
//     var file = $("#image_photograph").prop('files')[0];
//     // FileReaderオブジェクトを生成
//     var fileReader = new FileReader();
//     // 指定されたファイルを読み込み
//     fileReader.readAsDataURL(file);
//     // 読み込みが完了すると、srcにfileのURLを格納
//     fileReader.onloadend = function(){
//       var src = fileReader.result;
//       var html = `<div class = 'item-image' id = 'image-${number}' data-image_id = "${number}" >
//                     <div class = 'item-image__content' >
//                       <div class = 'item-image__content--icon' >
//                         <img src = ${src} width = "113" height = "80" />
//                       </div>
//                     </div>
//                     <div class = 'item-image__operation' >
//                       <div class = 'item-image__operation--delete'>削除</div>
//                     </div>
//                   </div>`
//       // exhibition-content__caption--image要素の前に上記のHTMLを差し込む
//       $('.new__image__post').before(html);
//     }
//     if (number == 5){
//       $('.image__upload__field').css('display', 'none');
//     }
//   })
  // $(document).on("click", ".item-image__operation--delete", function(){
  //   // インプットタグ修正する消すための準備
  //   var input_list = [];
  //   $('.item-image').each(function(index, image_id){
  //     // var all_image_id = $(image_id).data('image_id');
  //     var all_image_id = $(image_id).attr('data-image_id');
  //     input_list.push(all_image_id);
  //   })
  //   // プレビュー画像を削除
  //   var target_image = $(this).parent().parent();
  //   target_image.remove();
  //   // プレビュー画像が4枚以下になった場合、画像選択画面が再び現れる
  //   var number = $('.item-image').length;
  //   if (number == 4){
  //     $('.exhibition-content__caption--image').css('display', 'block');
  //   }
  //   // 削除したプレビュー画像のカスタムデータ属性を取得
  //   var image_id = $(this).parent().parent().data('image_id');
  //   // すべてのプレビュー画像のimage_idを取得
  //   var image_list = [];
  //   $('.item-image').each(function(index, image_id){
  //     // var image_id_2 = $(image_id).data('image_id');
  //     var image_id_2 = $(image_id).attr('data-image_id');
  //     image_list.push(image_id_2);
  //   })
  //   $.each(image_list, function(index, image_id_2){
  //     if (image_id_2 > image_id){
  //       // プレビュー画像のカスタムデータ属性修正
  //       $(`#image-${image_id_2}`).attr('data-image_id', function(){return (image_id_2 - 1)});
  //       $(`#image-${image_id_2}`).data('image_id', function(){return (image_id_2 - 1)});
  //       // インプットタグのname属性を修正
  //       $(`#item_product_images_attributes_${image_id_2}_image`).attr('name', function(){return "item[product_images_attributes][" + (image_id_2 - 1) + "][image]"})
  //       $(`#item_product_images_attributes_${image_id_2}_id`).attr('name', function(){return "item[product_images_attributes][" + (image_id_2 - 1) + "][id]"})
  //       // インプットタグのid修正
  //       $(`#item_product_images_attributes_${image_id_2}_image`).attr('id', function(){return "item_product_images_attributes_" + (image_id_2 - 1) + "_image"})
  //       $(`#item_product_images_attributes_${image_id_2}_id`).attr('id', function(){return "item_product_images_attributes_" + (image_id_2 - 1) + "_id"})
  //       // プレビュー画像のid修正
  //       $(`#image-${image_id_2}`).attr('id', function(){return "image-" + (image_id_2 - 1)});
  //     }
  //   })
  //   // インプットタグを削除
  //   $(`#item_product_images_attributes_${image_id}_image`).remove();
  //   $(`#item_product_images_attributes_${image_id}_id`).remove();
  //   // 空のインプットタグを取得
  //   var input_max = Math.max.apply(null, input_list) + 1;
  //   // 空のインプットタグのid及びnameを修正
  //   $(`#item_product_images_attributes_${input_max}_image`).attr('name', function(){return "item[product_images_attributes][" + (input_max - 1) + "][image]"})
  //   $(`#item_product_images_attributes_${input_max}_image`).attr('id', function(){return "item_product_images_attributes_" + (input_max - 1) + "_image"})
  // })
})