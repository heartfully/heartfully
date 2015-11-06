class PurchaseMenu extends React.Component {
  render() {
    return (
      <div className="c-registry-card__qty active">
        <div className="c-registry-card__qty-input">
          <label>Quantity</label>
          <input type="number" placeholder="0"></input>
        </div>
        <button className="c-registry-card__cart c-button">
          <span>Add to Cart</span>
        </button>
      </div>
    );
  }
}
