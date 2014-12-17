HeartfullyApp.Collections.Projects = Backbone.Collection.extend({
  model: HeartfullyApp.Models.Project,

  url: '/api/v1/projects.json',

  parse: function(response) {
    return response['projects'];
  }

});