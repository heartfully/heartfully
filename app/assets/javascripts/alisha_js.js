
// $('.c-registry-card__gift').on('click', function() {
//   $(this).toggleClass('c-button--disabled');
//   $(this).parent('.c-registry-card__info').next('.c-registry-card__qty').toggleClass('active');
// })

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

// rotating impact panel
$.fn.extend({
  rotaterator: function(options) {

    var defaults = {
      fadeSpeed: 500,
      pauseSpeed: 100,
      child:null
    };

    var options = $.extend(defaults, options);

    return this.each(function() {
      var o =options;
      var obj = $(this);
      var items = $(obj.children(), obj);
      var id = Math.random();
      obj.data('rotation', id)

      items.each(function() {
        $(this).hide();
      });

      if (!o.child || o.child.length === 0) {
        var next = $(obj).children(':first');
      } else {
        var next = o.child;
      }

      $(next).fadeIn(o.fadeSpeed, function() {
        $(next).addClass('current');
        $(next)
        .delay(o.pauseSpeed)
        .fadeOut(o.fadeSpeed, function() {

          if(obj.data('rotation') === id){
            $(this).removeClass('current');

            var next = $(this).next();

            if (next.length == 0){
              next = $(obj).children(':first');
            }
            $(obj).rotaterator({child : next, fadeSpeed : o.fadeSpeed, pauseSpeed : o.pauseSpeed});
          }

        });
      });
    });
  },

  rotateManually: function(options){

    var obj = $(this);

    $(options.trigger).click(function(){
      var current = $('#testimonials .current')[0];
      var next = $(current).next();
      var defaults = {
        child: next,
        fadeSpeed: 1000,
        pauseSpeed: 2800,
        trigger: obj
      };

      var settings = $.extend(defaults, options);
      $(current).removeClass('current');

      obj.rotaterator(settings);
    });
  }

});




$(document).ready(function() {
  $('#rotate').rotaterator({fadeSpeed:1000, pauseSpeed:1300});
  $('#testimonials').rotaterator({fadeSpeed:1000, pauseSpeed:2800});
  $('#testimonials').rotateManually({trigger: $('#next-testimonial')});
  $('#testimonials').rotateManually({trigger: $('#trigger-test-0'), child: $('.c-test__content')[0]});
  $('#testimonials').rotateManually({trigger: $('#trigger-test-1'), child: $('.c-test__content')[1]});
  $('#testimonials').rotateManually({trigger: $('#trigger-test-2'), child: $('.c-test__content')[2]});

  $('.c-project-select').on('click', function(event){
    event.preventDefault();

    if ($(this).parents('.c-tiny-project').hasClass('c-project-selected')) {
      event.target.innerHTML = 'select';
      $(this).parents('.c-tiny-project').removeClass('c-project-selected');
    } else {
      event.target.innerHTML = 'deselect';
      $(this).parents('.c-tiny-project').addClass('c-project-selected');
    }

    $('.c-project-submit').attr('href', '/projects/' +event.target.value + '/select');
  });

  $('.registry_project_tab').on('click', function(event) {
    event.preventDefault();
    var contentSelector = '.' + $(this).attr('id').replace(/tab/, 'content');
    $(this).siblings().removeClass('active');
    $(this).addClass('active');
    $(contentSelector).siblings().hide();
    $(contentSelector).show();
  });

  // filter form on registry project select
  $('.filter_form select').on('change', function(){
    if ($(this).val() === 'nil') {
      $(this).parents('.filter_form')
    }
  })

  $('.faq_subject').on('click', function(event) {
    event.preventDefault();
    $(this).addClass('active');
    $(this).siblings().removeClass('active');
    $('.faq_content_section').hide();
    var contentSelector = '.' + $(this).attr('id') + '_content';
    console.log(contentSelector)
    $(contentSelector).show();
  })
});
