class PurchaseMenu extends React.Component {
  constructor(props) {
    super(props);
    this.state = {quantity: 1};
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
              disabled={this.props.inCart}
              min="1"
              placeholder="1" />
          </div>
          {this.props.inCart ?
            <div style={{
                background: '#7D72DE',
                color: '#fff',
                padding: 10,
                fontSize: 20}}>
              In cart
            </div> :
            <button
              onClick={this.props.addToCart.bind(null, item, quantity)}
              className="c-registry-card__cart c-button"
              >
              <span>Add to Cart</span>
            </button>
          }
        </div>
      </div>
    );
  }
}
