class RegistryItems extends React.Component {
  constructor() {
    super();
    this.state = {showCart: false, cart: []};
  }

  addToAndShowCart(item, quantity) {
    // shows cart and adds arguments to cart array
    this.setState({showCart: true, ...this.state.cart.push({...item, quantity: quantity})});
  }

  hideCart() {
    this.setState({showCart: false});
  }

  submitOrder() {
    $.post('/orders', JSON.stringify(this.state.cart), data => {
      console.log('yolo??');
    });
  }

  render() {
    const cart = this.state.showCart ?
                  <Cart {...this.state}
                    hideCart={this.hideCart.bind(this)}
                    submit={this.submitOrder.bind(this)}
                   /> : null;

    const ItemCards = this.props.items.map((item, index) => {
      return(
        <ItemCard
          addToCart={this.addToAndShowCart.bind(this)}
          itemType={item}
          purchase
          key={index}
        />
      );
    });

    return (
      <div>
        {cart}
        <div className="test r-flex" style={{display: 'flex', flexWrap: 'wrap'}}>
          {ItemCards}
        </div>
      </div>
    );
  }
}
