HeartfullyApp.Components.ProjectFilter = React.createClass({

  handleSubmit: function(e) {
    e.preventDefault();
    var regionSelectEl = this.refs.regionCat.getDOMNode();
    var issueSelectEl = this.refs.issueCat.getDOMNode();
    this.props.onUserInput({ regionId: parseInt($(regionSelectEl).val(), 10), issueId: parseInt($(issueSelectEl).val(), 10) });
  },

  render: function() {
    var regionCatNodes = [],
    issueCatNodes = [],
    renderOpt = function(category, index) {
      return (
        <option value={category.get("id")} key={index}>{category.get("name")}</option>
      );
    };

    this.props.categories.each(function(category, index) {
      if (category.get("cat_type") == "region") {
        regionCatNodes.push( renderOpt(category, index) );
      }
      else if(category.get("cat_type") == "issue") {
        issueCatNodes.push( renderOpt(category, index) );
      }
    });

    return (
      <form className="row" ref="filterProjectsForm" onSubmit={this.handleSubmit}>
        <div className="columns small-12 medium-6 large-4">
          <select name="categories[]" ref="regionCat">
            <option value="">Filter by Region</option>
            {regionCatNodes}
          </select>
        </div>
        <div className="columns small-12 medium-6 large-6">
          <select name="categories[]" ref="issueCat">
            <option value="">Filter by Issue</option>
            {issueCatNodes}
          </select>
        </div>
        <div className="columns small-12 medium-6 medium-offset-3 large-2 large-offset-0 end">
          <input className="button expand region-btn" type="submit" value="Search"/>
        </div>
      </form>
    );
  }
});
