class FilterForm extends React.Component {

  render() {
    const {categories} = this.props;
    let selectors, regions, issues;
    if (categories) {
      selectors = this.props.categories.reduce((prev, curr) => {
        if (curr.cat_type === 'region') return {...prev, regions: prev.regions.concat([curr])};
        if (curr.cat_type === 'issue') return {...prev, issues: prev.issues.concat([curr])};
        return prev;
      }, {regions: [], issues: []});

      regions = selectors.regions.map(region => <option value={region.id}>{region.name}</option>)

      issues = selectors.issues.map(issue => <option value={issue.id}>{issue.name}</option>)
    }


    return (
      <form>
        <div className="r-flex test">
          <div className="pad flex-2">
            <div className="inline" style={{marginRight: 20}}>
              <label className="block mb--small" style={styles}>Filter by region</label>
              <select onChange={this.props.onChange} className="vm">
                <option value={0}>Filter by Region</option>
                {regions}
              </select>
            </div>
          </div>
          <div className="pad flex-2">
            <div className="inline">
              <label className="block mb--small" style={styles}>Filter by issue</label>
              <select onChange={this.props.onChange} className="vm">
                <option value={0}>Filter by Issue</option>
                {issues}
              </select>
            </div>
          </div>
        </div>
      </form>
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
