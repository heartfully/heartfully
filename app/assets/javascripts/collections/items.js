LovelyApp.Collections.Items = Backbone.Collection.extend({
  model: LovelyApp.Models.Item,

  url: '/api/v1/items.json',

  parse: function(response) {
    return response['items'];
  }

});