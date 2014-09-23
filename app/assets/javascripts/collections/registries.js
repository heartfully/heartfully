LovelyApp.Collections.Registries = Backbone.Collection.extend({
  model: LovelyApp.Models.Registry,

  url: '/api/v1/registries.json',

  parse: function(response) {
    return response['registries'];
  }

});