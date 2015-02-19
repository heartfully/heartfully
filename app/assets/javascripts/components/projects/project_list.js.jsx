HeartfullyApp.Components.ProjectList = React.createBackboneClass({
  render: function() {
    var projectNodes = this.props.projects.map(function(project, index) {
      return (
        <HeartfullyApp.Components.ProjectItem model={project} key={index}>
        </HeartfullyApp.Components.ProjectItem>
      );
    });
    return (
      <div className="js-project-list">
        {projectNodes}
      </div>
    );
  }
});
