class ItemCard extends React.Component {

  render() {
    return (
      <div className="c-registry-card" style={cardStyles}>
        <h3 className="c-registry-card__title">
          {this.props.itemType.name}
        </h3>
        <div className="c-registry-card__info">
          <div className="c-registry-card__price">
            ${Math.round(this.props.itemType.price)}
          </div>
          <button className="c-registry-card__gift c-button">
            <span>Purchase</span>
          </button>
        </div>
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
