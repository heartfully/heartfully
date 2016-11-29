class Cart extends React.Component {
  

  cartItems() {
    return this.props.cart.map(item => {
      const total = item.quantity * item.price;
      return <tr><td>{item.name}</td><td>{item.quantity}</td><td>${Math.round(total)}</td></tr>;
    });
  }

  render() {
    return (
      <RenderInBody>
      <div className="c-checkout">
        <h3>Are you ready to checkout?</h3>
        <h4 className="mb">Your selected items:</h4>
        <table className="mb">
          <thead>
            <tr>
              <th>Item</th> <th>Quantity</th> <th>Total amount</th>
            </tr>
          </thead>
          <tbody>
            {this.cartItems()}
          </tbody>
        </table>
        <button onClick={this.props.submit} className="c-button block c-button--primary mb--small">
            Go to Checkout
        </button>
        <button onClick={this.props.hideCart} id="continue-shopping" className="c-button block mb c-button--secondary">
          Continue Shopping
        </button>
        <button onClick={this.props.emptyCart} style={emptyCartStyles}>
          Empty Cart
        </button>
      </div>
      </RenderInBody>
    );
  }
}

Cart.propTypes = {
  cart: React.PropTypes.array.isRequired,
}

emptyCartStyles = {
  padding: 10,
  color: '#FF4D4D',
  border: '1px solid #FF4D4D',
  background: '#FFDADA',
  float: 'left',
}

var RenderInBody = React.createClass({

    componentDidMount: function() {
      this.popup = document.createElement("div");
      document.body.appendChild(this.popup);
      this._renderLayer();
    },


    componentDidUpdate: function() {
      this._renderLayer();
    },


    componentWillUnmount: function() {
      React.unmountComponentAtNode(this.popup);
      document.body.removeChild(this.popup);
    },


    _renderLayer: function() {
      React.render(this.props.children, this.popup);
    },


    render: function() {
      // Render a placeholder
      return React.DOM.div(this.props);
    }

  });
