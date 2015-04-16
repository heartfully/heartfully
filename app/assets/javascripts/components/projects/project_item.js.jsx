HeartfullyApp.Components.ProjectItem = React.createBackboneClass({
  render: function() {
    return (
      <div className="columns large-4 medium-6 small-12 project-glimpse end">
        <div className="text-center image-container">
          <img src={this.getModel().get("banner_img")} className="img-circle" />
        </div>
        <div className="project-header">
          <h3 className="name"><strong>{this.getModel().get("name")}</strong></h3>
        </div>
        <div>
          <h4><strong>Organization:</strong> <a target="_blank" href=""></a></h4>
        </div>
        <div>
          <h4><strong>Location:</strong> {this.getModel().get("country")}</h4>
        </div>
        <div>
          <h4><strong>Goal:</strong> ${this.getModel().get("funding_goal")}</h4>
        </div>
        <div className="actions row">
          <div className="small-5 columns">
            <strong><a href={"/projects/" + this.getModel().get("id")}>Learn More</a></strong>
          </div>
          <div className="small-5 columns">
           <strong><a href="#">Select Project</a></strong>
          </div>
        </div>
      </div>
    );
  }
});
