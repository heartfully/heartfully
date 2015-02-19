HeartfullyApp.Routers.Main = Backbone.Router.extend({
  routes: {
    "": "default"
  },

  initialize: function() {
    this.categories = new HeartfullyApp.Collections.Categories(HeartfullyApp.Data.categories);
    this.projects = new HeartfullyApp.Collections.Projects(HeartfullyApp.Data.projects);

    var ProjectsView = React.createFactory(HeartfullyApp.Components.Projects);
    this.projectsView = ProjectsView({categories: this.categories, projects: this.projects});
  },

  default: function() {
    React.render(this.projectsView, document.getElementById('js-projects-list'));
  }
});

HeartfullyApp.Routers.main = new HeartfullyApp.Routers.Main;
Backbone.history.start();
