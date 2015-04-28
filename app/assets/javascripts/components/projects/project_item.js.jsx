HeartfullyApp.Components.ProjectItem = React.createBackboneClass({
  render: function() {
    return (
      <div className="columns large-4 medium-6 small-12 project-glimpse end">
        <div className="text-center image-container">
          <img src={"https://cdn.rawgit.com/Heartfully/registry-images/master/" + this.getModel().get("project_photo")} className="img-circle" />
        </div>
        <div className="project-header">
          <h3 className="name"><strong>{this.getModel().get("name")}</strong></h3>
        </div>
        <div>
          <h4 className="organization"><strong>Organization: </strong>{this.getModel().get("partner")}</h4>
        </div>
        <div>
          <h4><strong>Location:</strong> {this.getModel().get("country")}</h4>
        </div>
        <div>
          <h4><strong>Goal:</strong> ${Math.floor(this.getModel().get("funding_goal"))}</h4>
        </div>
        <div className="actions row text-center">
          <div className="small-12 columns">
            <strong><a href={"/projects/" + this.getModel().get("url_slug")}>Learn More</a></strong>
          </div>
        </div>
      </div>
    );
  }
});
