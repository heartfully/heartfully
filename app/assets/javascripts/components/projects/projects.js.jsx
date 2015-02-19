HeartfullyApp.Components.Projects = React.createBackboneClass({

  mixins: [
    React.BackboneMixin("categories"),
    React.BackboneMixin("projects")
  ],

  getInitialState: function() {
    return { selectedRegionId: null, selectedVerticalId: null }
  },

  handleUserInput: function(data) {
    var self = this;

    this.setState({
      selectedRegionId: data.regionId,
      selectedVerticalId: data.verticalId
    });

    this.props.projects.fetch({
      data: { categories: [data.regionId, data.verticalId] },
      reset: true
    });
  },

  render: function() {
    return (
      <div>
        <HeartfullyApp.Components.ProjectFilter
          categories={this.props.categories}
          onUserInput={this.handleUserInput}
        />
        <HeartfullyApp.Components.ProjectList projects={this.props.projects} />
      </div>
    );
  }
});
