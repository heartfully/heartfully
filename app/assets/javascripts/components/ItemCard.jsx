class ItemCard extends React.Component {
  constructor(){
    super();
    this.state = {purchaseMenu: false};
  }

  toggleMenu() {
    this.setState({purchaseMenu: !this.state.purchaseMenu});
  }

  handlePurchase() {
    const classes = this.state.purchaseMenu ? "c-registry-card__gift c-button c-button--disabled" : "c-registry-card__gift c-button";
    return (
      <button onClick={this.toggleMenu.bind(this)} className={classes}>
        <span>Purchase</span>
      </button>
    );
  }

  render() {
    const purchase = this.state.purchaseMenu ? <PurchaseMenu {...this.props} /> : null;
    const purchaseButton = window.location.href.match("projects") ? null : this.handlePurchase();
    var classNames = "c-registry-card project-" + this.props.itemType.project_id;

    return (
      <div className={classNames}>
        <p className="c-registry-card__title">
          {this.props.itemType.name}
        </p>
        <div className="c-registry-card__info">
          <div className="c-registry-card__price">
            ${Math.round(this.props.itemType.price)}
          </div>
          {purchaseButton}
        </div>
        {purchase}
      </div>
    );
  }
}

ItemCard.propTypes = {
  itemType: React.PropTypes.object.isRequired,
  purchase: React.PropTypes.bool.isRequired,
}
