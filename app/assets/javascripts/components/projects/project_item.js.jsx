HeartfullyApp.Components.ProjectItem = React.createBackboneClass({
  render: function() {
    return (
      <div className="large-4 columns project-glimpse">
        <span>
          <img src={this.getModel().get("profile_photo")} className="img-circle" />
        </span>
        <h3 className="name">{this.getModel().get("name")}</h3>
        <div>
          <strong>Organization:</strong> <a target="_blank" href=""></a>
        </div>
        <div>
          <strong>Location:</strong> {this.getModel().get("country")}
        </div>
        <div>
          <strong>Goal:</strong> ${this.getModel().get("funding_goal")}
        </div>
        <br />
        <p className="description truncate">{this.getModel().get("description")}</p>
        <div className="actions row">
          <div className="small-5 columns">
            <a href={"/projects/" + this.getModel().get("id")} className="button expand view-details">View Details</a>
          </div>
          <div className="small-5 columns">
            <a href="#" className="button expand">Select Project</a>
          </div>
        </div>
      </div>
    );
  }
});
