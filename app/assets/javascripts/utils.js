$.fn.serializeObject = function()
{
  var o = {};
  var a = this.serializeArray();
  $.each(a, function() {
    if (o[this.name] !== undefined) {
      if (!o[this.name].push) {
          o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || '');
    } else {
      o[this.name] = this.value || '';
    }
  });
  return o;
};

$.fn.startLoading = function() {
  this.append("<div class='loading-overlay'><div class='loading-gif'></div></div>");
}

$.fn.stopLoading = function() {
  this.find('.loading-overlay').remove();
}
