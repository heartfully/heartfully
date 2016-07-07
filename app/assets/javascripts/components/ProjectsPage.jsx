class ProjectsPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {
    $.get('/api/v1/projects', (data) => {
      this.setState({projects: data.projects});
    });
  }

  requestFilter(event){
    const filterParams = parseInt(event.target.value) ? {categories: event.target.value} : null;

    $.get('/api/v1/projects', filterParams, (data) => {
      this.setState({projects: data.projects});
    });
  }

  renderProjects(projects) {
    return projects.map((project, index, projectArray) => {
      if (index % 2 == 0) {
        // if there are actually two projects
        // keeps from rendering an empty project tile
        // TODO: Make cleaner if possible
        if (projectArray[index + 1]) {
          return (
            <div className="r-flex mb--large">
              <ProjectTile {...projectArray[index]} key={index}/>
              <ProjectTile {...projectArray[index + 1]} key={index + 1}/>
            </div>
          );
        } else {
          return (
            <div className="r-flex mb--large">
              <ProjectTile {...projectArray[index]} key={index}/>
            </div>
          );
        }
      }
    })
  }

  handleProjectDisplay() {
    const {projects} = this.state;
    return (
      <div>
        <div className="test">
          {this.renderProjects(projects.slice(0,2))}
          {this.renderProjects(projects.slice(2,4))}
        </div>
        <RegistryBreaker />
        <div className="test">
          {this.renderProjects(projects.slice(4, projects.length))}
        </div>
      </div>
    );
  }

  handleFilter() {
    return (
       <div>
         <FilterForm onChange={this.requestFilter.bind(this)} categories={this.props.categories} />
         {this.handleProjectDisplay()}
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
        <div className="c-breaker purple center">
          <div className="test large mb">
            Found the one? Create your wedding registry and share the love!
          </div>
          <button className="button c-button c-button--primary launchSignupModal"><a href="/registries/new">Create a registry</a></button>
        </div>
        {this.state.projects ? this.handleFilter() : <div>Loading...</div>}
      </div>
    );
  }
}
