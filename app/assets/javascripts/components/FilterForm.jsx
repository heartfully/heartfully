class FilterForm extends React.Component {
  render() {
    let regions, issues = [];
    const foo = this.props.categories.reduce((prev, curr, index) => {
      console.log(prev)
      if (curr.cat_type === 'region') return Object.assign(prev, prev.region.push(curr));
      if (curr.cat_type === 'issues') return Object.assign(prev, prev.issues.push(curr));
      return prev;
    }, {regions: [], issues: []});

    console.log(foo)

    return (
      <div className="flex test">
        <div className="pad flex-2">
          <form>
            <div className="inline" style={{marginRight: 20}}>
              <label className="block mb--small" style={styles}>Filter by region</label>
              <select className="vm">
                // fill with region options
              </select>
            </div>
            <div className="inline">
              <label className="block mb--small" style={styles}>Filter by issue</label>
              <select className="vm">
                // fill with issue options
              </select>
            </div>
          </form>
        </div>
        <div className="flex-2"></div>
      </div>
    );
  }
}


const styles = {
  textTransform: 'uppercase',
  color: 'gray',
  fontFamily: ['AvenirNextLTPro-Demi', 'Helvetica', 'Arial'],
  fontSize: '0.8em',
  letterSpacing: '0.5pt',
}
