HeartfullyApp.Components.ProjectFilter = React.createClass({

  handleSubmit: function(e) {
    e.preventDefault();
    var regionSelectEl = this.refs.regionCat.getDOMNode();
    var verticalSelectEl = this.refs.verticalCat.getDOMNode();
    this.props.onUserInput({ regionId: $(regionSelectEl).val(), verticalId: $(verticalSelectEl).val() });
  },

  render: function() {
    var regionCatNodes = [],
    verticalCatNodes = [],
    renderOpt = function(category, index) {
      return (
        <option value={category.get("id")} key={index}>{category.get("name")}</option>
      );
    }

    this.props.categories.each(function(category, index) {
      if (category.get("cat_type") == "region") {
        regionCatNodes.push( renderOpt(category, index) );
      }
      else if(category.get("cat_type") == "vertical") {
        verticalCatNodes.push( renderOpt(category, index) );
      }
    });

    return (
      <form className="row" ref="filterProjectsForm" onSubmit={this.handleSubmit}>
        <select className="columns small-12 medium-6 large-4" name="categories[]" ref="regionCat">
          {regionCatNodes}
        </select>
        <select className="columns small-12 medium-6 large-4" name="categories[]" ref="verticalCat">
          {verticalCatNodes}
        </select>
        <input className="columns small-12 large-4 button" type="submit" value="Search"/>
      </form>
    );
  }
});
