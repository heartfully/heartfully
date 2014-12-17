HeartfullyApp.Collections.Registries = Backbone.Collection.extend({
  model: HeartfullyApp.Models.Registry,

  url: '/api/v1/registries.json',

  parse: function(response) {
    return response['registries'];
  }

});