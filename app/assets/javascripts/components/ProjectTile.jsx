class ProjectTile extends React.Component {

  render() {
    return (
      <div className="c-project-mini flex-2">
        <a href={`/projects/${this.props.url_slug}`}>
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
          <form action={`/projects/${this.props.url_slug}/select`} method="post">
            <input type="submit"
              className="c-button c-button--primary block nudge-top stretch" value="Select This Project"/>
          </form>
        </div>
      </div>
    );
  }
}

ProjectTile.propTypes = {
    photo1_url: React.PropTypes.string,
    url_slug: React.PropTypes.string,
  }

style ={color: '#fff', textAlign: 'center', padding: 10};
