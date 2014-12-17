HeartfullyApp.Collections.Items = Backbone.Collection.extend({
  model: HeartfullyApp.Models.Item,

  url: '/api/v1/items.json',

  parse: function(response) {
    return response['items'];
  }

});