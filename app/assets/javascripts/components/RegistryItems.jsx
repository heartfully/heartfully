class RegistryItems extends React.Component {

  render() {
    const ItemCards = this.props.items.map((item, index) => {
      return <ItemCard itemType={item} purchase key={index}/>;
    });
    return <div className="test" style={{display: 'flex', flexWrap: 'wrap'}}>{ItemCards}</div>;
  }
}
