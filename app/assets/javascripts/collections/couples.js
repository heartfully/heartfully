LovelyApp.Collections.Couples = Backbone.Collection.extend({
  model: LovelyApp.Models.Couple,

  url: '/api/v1/couples.json',

  parse: function(response) {
    return response['couples'];
  }

});