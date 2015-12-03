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

    return (
      <div className="c-registry-card" style={cardStyles}>
        <h3 className="c-registry-card__title">
          {this.props.itemType.name}
        </h3>
        <div className="c-registry-card__info">
          <div className="c-registry-card__price">
            ${Math.round(this.props.itemType.price)}
          </div>
          {this.handlePurchase()}
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

const cardStyles = {
  width: 460,
  margin: 10,
}
