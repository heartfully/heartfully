$(document).ready(function() {
  // opens and closes menu for tablet and mobile version of site
  $("#hamburger-menu").on("click", function(event) {
    event.preventDefault();
    if( $(".menu-ul-js").hasClass('show-menu-js') ) {
      $(".menu-ul-js").removeClass('show-menu-js');
    }
    else {
      $(".menu-ul-js").addClass('show-menu-js');
    }
  });

  // Adds scroll with animation for deep linking within page
  $(function(){
    $(".scroll").click(function(){
      $("html,body").animate({
        scrollTop: $($(this).attr('href')).offset().top - 100
      }, 300);

      return false;
    });
  });

  // Close flash
  $("#flash .fa-close").on("click", function() {
    $(this).parent().fadeOut();
  });

  // header opaque adjust for homepage
  $(".marketing.index").ready(function() {
    // adds opaque for viewing splash page only
    addOrRemoveHeaderOpaque("#banner-container");

    $(window).on("scroll", function(){
      addOrRemoveHeaderOpaque("#banner-container");
    });
  });

  // header opaque adjust for sample registry page
  $(".registries.show").ready(function() {
    addOrRemoveHeaderOpaque("#registry-banner-container");

    $(window).on("scroll", function(){
      addOrRemoveHeaderOpaque("#registry-banner-container");
    });
  });

  // function to check if an element is visible on screen
    function checkVisible( elm, evalType ) {
      evalType = evalType || "visible";

      var vpH = $(window).height(), // Viewport Height
          st = $(window).scrollTop(), // Scroll Top
          y = $(elm).offset().top,
          elementHeight = $(elm).height();

      if (evalType === "visible") return ((y < (vpH + st)) && (y > (st - elementHeight)));
      if (evalType === "above") return ((y < (vpH + st)));
    }

    // function to decide wether to add or remove opaque
    function addOrRemoveHeaderOpaque(elem) {
      if(checkVisible(elem)){
        $(".header-home").addClass("header-opaque");
      } else {
        $(".header-home").removeClass("header-opaque");
      }
    }
});