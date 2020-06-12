$(function(){
  function animation(){
    $('.fadeInUp').each(function(){
      // offset() → HTML要素の表示位置を座標で取得できるメソッド
      // これにtopを組み合わせることで、Y座標のみを取得できる
      var target = $(this).offset().top;
      //スクロール量を取得
      var scroll = $(window).scrollTop();
      //ウィンドウの高さを取得
      var windowHeight = $(window).height();
      //ターゲットまでスクロールするとフェードインする
      if (scroll > target - windowHeight){
        $(this).css('opacity','1');
        $(this).css('transform','translateY(0)');
      }
    });
  }
  $(window).scroll(function (){
    animation();
  });
});