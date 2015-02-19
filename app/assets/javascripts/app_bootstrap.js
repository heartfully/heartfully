var HeartfullyApp = HeartfullyApp || {
  Models: {},
  Collections: {},
  Components: {},
  Routers: {},
  Data: {}
};

// Any JSON data that is bootstrapped throughout the app must have this "bootstrapped-json" class on the tag in order for the bootstrapped data to be loaded
$(".bootstrapped-json").each(function() {
  $.extend(HeartfullyApp.Data, $(this).data());
});
