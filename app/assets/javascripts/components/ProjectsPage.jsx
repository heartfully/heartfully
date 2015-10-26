class ProjectsPage extends React.Component {
  constructor() {
    super();
    this.state = {}
  }

  componentWillMount() {
    $.get('/api/v1/projects', (data) => {
      this.setState({...data});
    });
  }

  renderProjects(projects) {
    return projects.map((project, index, projectArray) => {
      if (index % 2 == 0) {
        return (
          <div className="r-flex mb--large">
            <ProjectTile {...projectArray[index]} key={index}/>
            <ProjectTile {...projectArray[index + 1]} key={index + 1}/>
          </div>
        );
      }
    })
  }

  handleProjectDisplay() {
    return (
      <div>
        <div className="test">
          {this.renderProjects(this.state.projects.slice(0,2))}
          {this.renderProjects(this.state.projects.slice(2,4))}
        </div>
        <RegistryBreaker />
        <div className="test">
          {this.renderProjects(this.state.projects.slice(5, -1))}
        </div>
      </div>
    );
  }

  render() {
    return (
      <div>
        <div className="mb--xl">
          <div className="test center">
            <h1 className="c-project-header__title">Browse Projects</h1>
          </div>
        </div>
        <div className="c-breaker purple">
          <div className="test center large">
            Heartful.ly wedding registries benefit these many programs around the world.
          </div>
        </div>
        {this.state.projects ? <div><FilterForm categories={this.state.categories} />{this.handleProjectDisplay()}</div>: <div>Loading...</div>}
      </div>
    );
  }
}
