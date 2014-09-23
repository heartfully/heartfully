LovelyApp.Collections.Users = Backbone.Collection.extend({
  model: LovelyApp.Models.User,

  url: '/api/v1/users.json',

  parse: function(response) {
    return response['users'];
  }

});