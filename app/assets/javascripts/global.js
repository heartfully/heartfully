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

  // REGISTRY CREATION STUFF

  function triggerSearch(url) {
    $.get(url, {"search": $("#search").val(), "region_category": $("#region-category").val(), "issue_category": $("#issue-category").val(), }, function(data) {
      $("#select-project .project-container").html(data);
      $("#" + $("#project_url_slug").val()).css("background-color", "#F2EFF9");
      $(".slider").slick("reinit");
    });
  }

  function refreshSlides() {
    var currentSlide = $(".slider").slick("slickCurrentSlide");
    $(".header span").css("color", "#777");
    $(".header span:eq(" + currentSlide + ")").css("color", "#7272de");
    $('html, body').animate({scrollTop: 0}, "fast");
  }

  function refreshPreview() {
    var registryType = $("#registry_type").val();
    if(registryType == "") {
      var first_name = $("#registry_registrant_first_name").val();
      var second_name = $("#registry_partner_first_name").val();
      $(".preview-text .preview-name").text(first_name + " & " + second_name);
    } else {
      var eventName = $("#registry_name").val();
      $(".preview-text .preview-name").text(eventName);
    }
    var date = new Date(($("#registry_event_date").val() + " 00:00:00").replace('-','/'));
    if(!isNaN(date)) {
      var displayDate = date.toLocaleString("en-us", {month: "long", day: "numeric", year: "numeric"})
      $(".preview-text .c-hero__date").text("- " + displayDate + " -");      
    }
  }

  function validateURLSlug() {
    return (/^[a-z0-9]([a-z0-9\-]*[a-z0-9])?$/).test($("#registry_url_slug").val()) && $("#registry_url_slug").val().length > 0;
  }

  $(".slider").ready(function() {
    $(".slider").slick({
      swipe: false,
      infinite: false,
      arrows: false,
      adaptiveHeight: true
    });

    refreshSlides();
  });

  $(".header span").click(function(e) {
    var slideNumber = $(this).index();
    if (!$(this).hasClass("disabled")) {
      $(".slider").slick("slickGoTo", slideNumber);
      refreshSlides();
    } else {
      return false;
    }
  });

  $(".registry-type").click(function(e){
    var registryType = $(this).data("type");
    $(this).removeClass("non-selected");
    $(this).siblings().addClass("non-selected");
    if(registryType == "wedding") {
      $(".url-container span").text("heartful.ly/registry/")
      $(".birthday").css("display", "none");
      $(".wedding").css("display", "inline");
      $("#registry_type").val("");
      $("#registry_registry_story").attr("placeholder", "As we begin our lives together, we want to share our joy by supporting people in need. We are inspired by the work that this amazing non-profit is doing and we invite you to choose items on our behalf to support this project. Can’t wait to see you all soon!")
    } else {
      $(".url-container span").text("heartful.ly/birthday/")
      $(".wedding").css("display", "none");
      $(".birthday").css("display", "inline");
      $("#registry_type").val("Birthday");
      $("#registry_registry_story").attr("placeholder", "I’ve been given so much in life, so to celebrate the big 4-0, I want to give back to those in need. Please help me share the love and make an impact in the lives of others by donating to this amazing organization. Here’s to at least 40 more with all of you amazing people by my side!")
    }
    $(".fields-container").css("display", "inline");
    $(".slide-footer").css("display", "inline");
    $(".slider").slick("reinit");
    refreshPreview();
  });

  $(".flexstuff input").change(function(e) {
    refreshPreview();
  })

  // don't allow invalid characters for url_slug
  $("#registry_url_slug").keypress(function(e) {
    var chr = String.fromCharCode(e.which);
    return (/[a-z\d-]/).test(chr);
  });

  var delay = (function(){
    var timer = 0;
    return function(callback, ms){
      clearTimeout (timer);
      timer = setTimeout(callback, ms);
    };
  })();

  $("#registry_url_slug").keydown(function(e) {
    $("#registry_url_slug").removeClass();
    $("#registry_url_slug").addClass("ui-state-loading");
    delay(function() {
      if(validateURLSlug()) {
        $.get("/registries/check_url_availability", {url_slug: $("#registry_url_slug").val()}, function(data) {
          if(data["available"]) {
            $("#registry_url_slug").removeClass();
            $("#registry_url_slug").addClass("ui-state-valid");
          } else {
            $("#registry_url_slug").removeClass();
            $("#registry_url_slug").addClass("ui-state-invalid");
          }
        });
      } else {
        $("#registry_url_slug").removeClass();
        $("#registry_url_slug").addClass("ui-state-invalid");
      }
    }, 500);
  });

  $("#step-1-next").click(function(e) {
    if($("#registry_url_slug").hasClass("ui-state-valid")) {
      $(".slider").slick("slickNext");
      refreshSlides();
    } else {
      $("#registry_url_slug").addClass("ui-state-invalid");
    }
  });

  $("#step-2-previous").click(function(e) {
    $(".slider").slick("slickPrev");
    refreshSlides();
  });

  // ajax call to get project slide
  $("#select-project").ready(function() {
    $.get("/registries/projects_and_categories", function(data) {
      $("#select-project .project-container").html(data);
    })
  });

  // ajax pagination for projects
  $("#select-project").on("click", ".pagination a", function(e) {
    e.preventDefault();
    $.get($(this).prop("href"), function(data) {
      $("#select-project .project-container").html(data);
      $("#" + $("#project_url_slug").val()).css("background-color", "#F2EFF9");
      $(".slider").slick("reinit");
    });
  });

  // search by text
  $("#select-project").on("click", ".search", function(e) {
    e.preventDefault();
    triggerSearch($(this).data("url"));
  });

  $("#select-project").on("keypress", "#search", function(e) {
    if (e.which == '13') {
      e.preventDefault();
      triggerSearch($(this).data("url"));
    }
  });

  // search by category
  $("#select-project").on("change", "#region-category, #issue-category", function(e) {
    e.preventDefault();
    triggerSearch($(this).data("url"));
  })

  // reset search parameters
  $("#select-project").on("click", ".reset-search", function(e) {
    e.preventDefault();
    $.get($(this).data("url"), function(data) {
      $("#select-project .project-container").html(data);
      $("#" + $("#project_url_slug").val()).css("background-color", "#F2EFF9");
      $(".slider").slick("reinit");
    });
  });

  // learn more project modal
  $("#select-project").on("click", ".fetchProjectModal", function(e) {
    e.preventDefault();
    $.get($(this).data("loadUrl"), function(data) {
      $("#projectModalContainer .modal-dialog").html(data);
    });
    $("#projectModalContainer").modal();
  });

  // choose a project
  $("#select-project").on("click", ".project-select", function(e) {
    var urlSlug = $(this).data("url-slug")
    e.preventDefault();
    if (urlSlug == $("#project_url_slug").val()) {
      $("#project_url_slug").val("");
      $(".c-tiny-project").css("background-color", "");
    } else {
      $("#project_url_slug").val(urlSlug);
      $(".c-tiny-project").css("background-color", "");
      $("#" + urlSlug).css("background-color", "#F2EFF9");
      $(".slider").slick("slickNext");
      refreshSlides();
    }
  });

  $("#step-2-next").click(function(e) {
    $(".slider").slick("slickNext");
    refreshSlides();
  });

  $("#step-3-previous").click(function(e) {
    $(".slider").slick("slickPrev");
    refreshSlides();
  });

  // banner image preview
  $(".personalize-container").on("change", "#registry_banner_image", function(e){
    if(this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.preview-container .preview-hero').css('background-image', 'url("' + e.target.result + '")');
      }
      reader.readAsDataURL(this.files[0]);
    } else {
      $('.preview-container .preview-hero').css('background-image', '');
    }
  });

  // profile image preview
  $(".personalize-container").on("change", "#registry_profile_image", function(e){
    if(this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.preview-container .c-circle').css('background-image', 'url("' + e.target.result + '")');
      }
      reader.readAsDataURL(this.files[0]);
    } else {
      $('.preview-container .c-circle').css('background-image', '');
    }
  });

  // submit the form!
  $("#step-3-next").click(function(e) {
    $(".finalizing").toggle();
    var formData = new FormData($("#new-registry-form")[0]);
    $.ajax({
      url: $("#new-registry-form").prop("action"),
      data: formData,
      type: 'POST',
      contentType: false,
      processData: false
    }).done(function(data) {
      $.get(data["finished_url"], function(finishedData) {
        $("#finished .finished-container").html(finishedData);
      }).done(function() {
        $(".finalizing").toggle();
        $(".slider").slick("slickNext");
        $(".header span").addClass("disabled");
        refreshSlides();
      });
    });
  });

  // CAMPAIGN STUFF

  $(".holiday-carousel").ready(function() {
    $(".holiday-carousel-container").css('display', 'inline-block');
    $(".holiday-carousel").slick({
      autoplay: true,
      dots: false,
      arrows: false,
      pauseOnHover: false
    });
  });

  $(".project-grid .project-container").click(function(e) {
    e.preventDefault();
    var projectUrlSlug = $(this).data("projectUrlSlug");
    var modalContainer = $(".campaign-modal-container");
    var projectId = ".project-" + $(this).data("projectId");

    $(".c-registry-card").hide();
    $(projectId).show();

    $.get($(this).data("loadUrl"), {project_url_slug: projectUrlSlug}, function(data) {
      modalContainer.find(".left-column").html(data);
    }).done(function(e) {
      ReactRailsUJS.mountComponents();
      modalContainer.modal();
    });
  });

  $(".campaign-modal-container").on('click', '.c-registry-card__cart', function() {
    $(".campaign-modal-container").modal('hide');
  })
  
});