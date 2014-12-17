HeartfullyApp.Collections.Organizations = Backbone.Collection.extend({
  model: HeartfullyApp.Models.Organization,

  url: '/api/v1/organizations.json',

  parse: function(response) {
    return response['organizations'];
  }

});