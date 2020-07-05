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
  $(".search__button").on('click', function(){
    $(".fadeInDown").css('opacity', '1');
    $(".fadeInDown").css('transform', 'translateY(0)');
    $(".header__main__button__nav").css('opacity', '0.1');
    $(".header__main__logo").css('opacity', '0.1');
    $(".header__main__search__form").prop('disabled', false)
  })
  $(document).on('click', function(e){
    if($(e.target).is('.fa-search, .header__main__search__form')) {
    }else{
      $(".header__main__logo").css('opacity', '1');
      $(".header__main__button__nav").css('opacity', '1');
      $(".fadeInDown").css('opacity', '0');
      $(".fadeInDown").css('transform', 'translateY(-10px)');
      $(".header__main__search__form").prop('disabled', true);
    }
  })
});