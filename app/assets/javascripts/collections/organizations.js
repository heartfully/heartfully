LovelyApp.Collections.Organizations = Backbone.Collection.extend({
  model: LovelyApp.Models.Organization,

  url: '/api/v1/organizations.json',

  parse: function(response) {
    return response['organizations'];
  }

});