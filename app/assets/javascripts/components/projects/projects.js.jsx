HeartfullyApp.Components.Projects = React.createBackboneClass({

  mixins: [
    React.BackboneMixin("categories"),
    React.BackboneMixin("projects")
  ],

  getInitialState: function() {
    return { categoryIds: [] }
  },

  handleUserInput: function(data) {
    var self = this;

    // Start loading gif
    $(this.refs.projectList.getDOMNode()).startLoading();

    // Filter out blank inputs, check if any input was entered
    var catIds = _.filter(data, function(val){ return !!val; });

    this.setState({categoryIds: catIds});

    this.props.projects.fetch({
      data: { categories: catIds },
      reset: true,
      success: function() {
      }
    });
  },

  handlePaginate: function(data) {
    var self = this;

    this.setState({ pageNumber: data.pageNumber });

    this.props.projects.fetch({
      data: { page: data.pageNumber },
      reset: true,
      success: function() {
      }
    });
  },

  render: function() {
    var self = this;

    // Get the category objects to display on the page
    var cats = this.props.categories.filter(function(cat) {
      return self.state.categoryIds.indexOf(cat.get("id")) >= 0;
    });
    var catText = "All Projects";
    if (cats.length) {
      catText = "Projects in "+cats[0].get("name");
      if (cats.length == 2) { catText += " and " + cats[1].get("name"); }
    }

    return (
      <div>
        <HeartfullyApp.Components.ProjectFilter categories={this.props.categories} onUserInput={this.handleUserInput} />
        <h2 className="text-center">{catText}</h2>
        <HeartfullyApp.Components.ProjectList ref="projectList" projects={this.props.projects} />
        <HeartfullyApp.Components.ProjectPaginate onPaginateClick={this.handlePaginate} />
      </div>
    );
  }
});
