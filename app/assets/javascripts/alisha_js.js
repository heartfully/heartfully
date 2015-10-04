
$('.c-registry-card__gift').on('click', function() {
  $(this).toggleClass('c-button--disabled');
  $(this).parent('.c-registry-card__info').next('.c-registry-card__qty').toggleClass('active');
})

var d = $('.c-hero');
var heroHeight = d.height();

var e = $('.c-nav');
var navHeight = e.outerHeight();

// if there is a hero or a status bar
if ($('.c-hero').length != 0) {
  document.onscroll = function() {
    if (window.scrollY >= (heroHeight - navHeight)) {
      $('.c-nav').removeClass('c-nav--transparent');
      $('.c-nav').addClass('animate');
    } else {
      $('.c-nav').removeClass('animate');
      $('.c-nav').addClass('c-nav--transparent');
    }
  };
} else {
  $('.c-nav').removeClass('c-nav--transparent');
  $('.c-nav').addClass('animate');
  var nextElementsPadding = $('.c-nav').next().css('padding-top');
  if ($('.c-status').length == 0) {
    $('.c-nav').next().css('padding-top', 80 + navHeight);
  } else {
    $('.c-nav').next().css('padding-top', navHeight);
  }
}

$('.c-nav__menu-item:last-child').on('mouseover', function(){
  $('.c-nav__admin-menu').css('opacity', '1');
});

$('.c-nav__menu-item:last-child').on('mouseleave', function(){
  $('.c-nav__admin-menu').css('opacity', '0');
});


