var ProjectApprovalItem = React.createClass({
  render: function(){
    return (
      <div className="row">
        <div className="panel  clearfix">
          <div className="large-9  medium-12  columns  base-margin-bottom">
            <h3>{this.props.name}</h3>
            <div>Fill this section with the summary when field gets populated</div>
          </div>
          <div className="large-3  medium-12  columns">
            <ApprovalButton {...this.props} />
          </div>
        </div>
      </div>
    );
  }
});


var ApprovalButton = React.createClass({
  getInitialState: function(){
    return {approved: this.props.approved};
  },

  handleSubmit: function(e){
    e.preventDefault(e);
    // TODO: find a better way to serialize this data
    var data = $(this.refs.button.getDOMNode()).attr('name') + "=" + $(this.refs.button.getDOMNode()).attr('value')
    
    $.post(this.props.action, data, function(data){
      this.setState(data)
    });
  },

  setButton: function(){
    if (this.state.approved == false){
      return (
        <button type="submit" ref='button' className="button  expand  radius" name="project_id" value={this.props.id} > Approve </button>
      )
    } else { 
      return <button className="button  expand  radius  disabled"> Approved </button>
    }
  },

  render: function(){
    return (
      <form ref="form" onSubmit={this.handleSubmit}>
        {this.setButton()}
      </form>
    );
  }
})