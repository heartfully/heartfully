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
    const data = {registry_id: this.props.registry_id, items: this.state.cart}
    $.ajax({
        type: "POST",
        url: "/orders",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
          //do something
        },
        error: function (errormessage) {
          //do something else
        }
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
