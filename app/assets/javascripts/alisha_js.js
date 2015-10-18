
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
      $('.c-nav__cart cart-icon').css('fill', '#fff');
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

// exit mobile menu if clicking close icon
$('.c-nav__mobile-menu--close').on('click', function() {
  $('.c-nav__mobile-menu').addClass('inactive');
});

// expand the mobile menu
$('.c-nav__menu-indicator').on('click', function() {
  $('.c-nav__mobile-menu').removeClass('inactive');
});

// close checkout panel
$('#continue-shopping').on('click', function() {
  $('.c-checkout').addClass('inactive');
});

// open checkout panel
$('.c-nav__cart').on('click', function() {
  $('.c-checkout').removeClass('inactive');
});

// open video modal
$('.c-hero__video').on('click', function() {
  $('.c-video-modal').addClass('active');
});

// close video modal
$('#close-video').on('click', function() {
  $('.c-video-modal').removeClass('active');
});

