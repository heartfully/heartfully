class ProjectTile extends React.Component {
  propTypes: {
    photo1_url: React.PropTypes.string,
    url_slug: React.PropTypes.string,
  }

  render() {
    return (
      <div className="c-project-mini flex-2">
        <a href="#">
          <div className="c-project-mini__header" style={{backgroundImage: `url(${this.props.photo1_url})`}}>
            <div className="c-project-mini__title">
              {this.props.name}
            </div>
            <div className="c-project-tabbed__header--overlay"></div>
          </div>
        </a>
        <div className="c-project-mini__info">
          <p>{this.props.description }</p>
          <a className="link--secondary inline nudge-top--small" href={`/projects/${this.props.url_slug}`}>
            {['Learn More', <span>&rarr;</span>]}
          </a>
          <button className="c-button c-button--primary block nudge-top stretch">
            Select this project
          </button>
        </div>
      </div>
    );
  }
}