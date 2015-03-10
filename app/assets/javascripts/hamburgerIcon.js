$(document).ready(function() {
  $("#hamburger-menu").on("click", function(event) {
    event.preventDefault();
    if( $(".menu-ul-js").hasClass('show-menu-js') ) {
      $(".menu-ul-js").removeClass('show-menu-js');
    }
    else {
      $(".menu-ul-js").addClass('show-menu-js');
    }
  })
});