$(document).ready(function() {
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
        scrollTop: $("#target").offset().top
      }, 300);

      return false;
    });
  });

  // Close flash
  $("#flash .fa-close").on("click", function() {
    $(this).parent().fadeOut();
  });
});