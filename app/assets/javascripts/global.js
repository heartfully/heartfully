$(document).ready(function() {

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

  var $inputs = $('.form input[type="text"], .form input[type="email"]');

  $(document).ready(function(){
    $inputs.each(function(index){
      if ($inputs[index].value != '') {
        $(this).siblings('label').hide()
      }
    })
  });

  $inputs.focusout(function(){
    if (this.value != '') {
      $(this).siblings('label').hide()
    } else {
      $(this).siblings('label').show() 
    }
  })

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

  //login modal
  $(".launchLoginModal").click(function(e) {
    e.preventDefault();
    $("#signupModal").modal('hide');
    $("#loginModal").modal();
  });

  //signup modal
  $(".launchSignupModal").click(function(e) {
    e.preventDefault();
    $("#loginModal").modal('hide');
    $("#signupModal").modal();
  });

  //project modal on registry page
  $(".launchProjectModal").click(function(e) {
    e.preventDefault();
    $("#projectModal").modal();
  })

  //fb share post-order
  $(".shareRegistry").click(function(e) {
    e.preventDefault();
    FB.ui({
      method: 'share',
      display: 'popup',
      href: $(this).data("registry"),
    }, function(response){});
  });

  $(window).load(function() {
    if(!Cookies.get("hide_sub_modal")) {
      Cookies.set("hide_sub_modal", 1, { expires: 30 });
      setTimeout(function(){
        $("#emailSubModal").modal();
      }, 5000);
    }
  });

  $("#emailSubModal form").submit(function(e) {
    e.preventDefault();
    $.post($(this).prop("action"), $(this).serialize(), $("#emailSubModal").modal("hide"));
  });

  $("#region-select").change(function(e){
    e.preventDefault();
    $("#region-filter").submit();
  });

  $("#issue-select").change(function(e){
    e.preventDefault();
    $("#issue-filter").submit();
  });

  $(".goal").ready(function() {
    var totalRaised = $("#total-raised").text().replace("$","");
    var registryGoal = $("#registry-goal").text().replace("$","");
    var backgroundShift = (-1 * totalRaised / registryGoal) * 100 + "px";
    $(".goal-heart img").css('background-position-y', backgroundShift);
  });

  $(".slider").slick({
    swipe: false,
    infinite: false,
    arrows: false,
    adaptiveHeight: true
  });

  $("#select-project").ready(function() {
    $.get("/registries/projects_and_categories", function(data) {
      $("#select-project .project-container").html(data);
    })
  });

  $("#select-project").on("click", ".pagination a", function(e) {
    e.preventDefault();
    $.get($(this).prop("href"), function(data) {
      $("#select-project .project-container").html(data);
      $(".slider").slick("reinit");
    });
  });

  $("#select-project").on("click", ".project-select", function(e) {
    e.preventDefault();
    $("#project_url_slug").val($(this).data("url-slug"));
    $.post($("#new-registry-form").prop("action"), $("#new-registry-form").serialize(), function(data) {
    }).done(function(data) {
      $.get(data["personalize_url"], function(personalizeForm) {
        $("#personalize .personalize-container").html(personalizeForm);
      }).done(function() {
        $(".slider").slick("slickNext");
      });
    });
  });

  $("#select-project").on("click", ".fetchProjectModal", function(e) {
    e.preventDefault();
    $.get($(this).data("loadUrl"), function(data) {
      $("#projectModalContainer .modal-dialog").html(data);
    });
    $("#projectModalContainer").modal();
  });

  $("#step-1-next").click(function(e) {
    $(".slider").slick("slickNext");
  });

  $("#step-2-previous").click(function(e) {
    $(".slider").slick("slickPrev");
  });

  $("#step-3-previous").click(function(e) {
    $(".slider").slick("slickPrev");
  });

  $("#step-3-next").click(function(e) {
    $.post($("#personalize-registry-form").prop("action"), $("#personalize-registry-form").serialize(), function(data) {
      $(".slider").slick("slickNext");
    });
  });
});