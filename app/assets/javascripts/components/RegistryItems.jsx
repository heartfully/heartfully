class RegistryItems extends React.Component {
  constructor() {
    super();
    this.state = {showCart: false, cart: []};
  }

  addToAndShowCart(item, quantity) {
    // shows cart and adds arguments to cart array
    this.setState({showCart: true, ...this.state.cart.push({...item, quantity: quantity})});
  }

  emptyCart() {
    this.setState({showCart: false, cart: []});
  }

  hideCart() {
    this.setState({showCart: false});
  }

  itemInCart(item) {
    let matchedItems = this.state.cart.filter(cartItem => {
      return cartItem.id === item.id;
    });
    if (matchedItems.length >= 1) return true;
    return false;
  }

  submitOrder() {
    const data = {registry_id: this.props.registry_id, items: this.state.cart}
    $.ajax({
        type: "POST",
        url: "/orders",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
          window.location = data.responseText;
        },
        error: function (errormessage) {
          console.log("whyyyyyyyy")
          console.log(errormessage)
        }
    });
  }

  render() {
    const cart = this.state.showCart ?
                  <Cart {...this.state}
                    hideCart={this.hideCart.bind(this)}
                    submit={this.submitOrder.bind(this)}
                    emptyCart={this.emptyCart.bind(this)}
                   /> : null;

    const ItemCards = this.props.items.map((item, index) => {
      return(
        <ItemCard
          addToCart={this.addToAndShowCart.bind(this)}
          itemType={item}
          inCart={this.itemInCart(item)}
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
