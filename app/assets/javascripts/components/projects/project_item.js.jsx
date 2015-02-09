var ProjectItem = React.createClass({
  render: function() {
    return (
      <div className="large-4 columns project-glimpse">
        <span>
          <img src={this.props.profilePhoto} className="img-circle" />
        </span>
        <h3 className="name">{this.props.name}</h3>
        <div>
          <strong>Organization:</strong> <a target="_blank" href=""></a>
        </div>
        <div>
          <strong>Location:</strong> {this.props.country}
        </div>
        <div>
          <strong>Goal:</strong> ${this.props.fundingGoal}
        </div>
        <br />
        <p className="description truncate">{this.props.description}</p>
        <div className="actions row">
          <div className="small-5 columns">
            <a href={"/projects/" + this.props.id} className="button expand view-details">View Details</a>
          </div>
          <div className="small-5 columns">
            <a href="#" className="button expand">Select Project</a>
          </div>
        </div>
      </div>
    );
  }
});
