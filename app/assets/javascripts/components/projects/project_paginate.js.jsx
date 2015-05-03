HeartfullyApp.Components.ProjectPaginate = React.createBackboneClass({

  getInitialState: function() {
    return {
      lastPage: parseInt(window.total_pages),
      cantGoBack: true,
      cantGoFoward: false,
      currentPage: 1
    };
  },

  handleBackClick: function(e) {
    e.preventDefault();
    this.hideOrShowArrows(this.state.currentPage - 1);
  },

  handleNumberClick: function(e) {
    e.preventDefault();
    this.hideOrShowArrows(parseInt(e.target.innerHTML));

    this.scrollToTop();
  }, 

  handleNextClick: function(e) {
    e.preventDefault();
    this.hideOrShowArrows(this.state.currentPage + 1);
  },

  hideOrShowArrows: function(page) {
    if( page >= 1 ) {
      this.props.onPaginateClick({ pageNumber: page });
      this.setState({ currentPage: page });
      this.setState({ cantGoBack: false, cantGoFoward: false });
    } 
    if( page === 1 ) {
      this.setState({ cantGoBack: true });
    }
    if( page === this.state.lastPage ) {
      this.setState({ cantGoFoward: true });
    }
    this.scrollToTop();
  },

  scrollToTop: function() {
    $("html, body").animate({
      scrollTop:0
    },"fast");
  },

  render: function() {
    var ulNodes = [];
    for( var i = 1; i <= this.state.lastPage; i++ ){
      ulNodes.push(<li className={this.state.currentPage === i ? "current" : ''}><a ref="pageNumber" onClick={this.handleNumberClick} href="#">{i}</a></li>);
    }

    if( this.state.cantGoBack ) {
      var backClassString = ' hide';
    }
    if( this.state.cantGoFoward ) {
      var forwardClassString = ' hide';
    }
    return (
      <div className="pagination-centered">
        <ul className="pagination">
          <li className={ backClassString || "arrow" }><a ref="back" onClick={this.handleBackClick} href="#">&laquo;</a></li>
          {ulNodes}
          <li className={ forwardClassString || "arrow" }><a ref="next" onClick={this.handleNextClick} href="#">&raquo;</a></li>
        </ul>
      </div>
    );
  }
});