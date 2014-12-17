HeartfullyApp.Collections.Couples = Backbone.Collection.extend({
  model: HeartfullyApp.Models.Couple,

  url: '/api/v1/couples.json',

  parse: function(response) {
    return response['couples'];
  }

});