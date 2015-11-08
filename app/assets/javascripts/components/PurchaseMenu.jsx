class PurchaseMenu extends React.Component {
  constructor() {
    super();
    this.state = {quantity: 0};
  }

  handleQuantity(event) {
    this.setState({quantity: parseInt(event.target.value)});
  }

  render() {
    const item = this.props.itemType;
    const {quantity} = this.state;

    return (
      <div>
        <div className="c-registry-card__qty active">
          <div className="c-registry-card__qty-input">
            <label>Quantity</label>
            <input onChange={this.handleQuantity.bind(this)}
              type="number"
              min="0"
              placeholder="0" />
          </div>
          <button
            onClick={this.props.addToCart.bind(null, item, quantity)}
            className="c-registry-card__cart c-button"
            >
            <span>Add to Cart</span>
          </button>
        </div>
      </div>
    );
  }
}
