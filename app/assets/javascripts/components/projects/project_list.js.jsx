var ProjectList = React.createClass({
  getInitialState: function() {
    return { data: HeartfullyApp.Data.projects };
  },

  render: function() {
    var projectNodes = this.state.data.map(function(project, index) {
      return (
        <ProjectItem {...project} key={index}>
        </ProjectItem>
      );
    });
    return (
      <div className="js-project-list">
        {projectNodes}
      </div>
    );
  }
});
