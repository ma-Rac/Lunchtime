class Table extends React.Component {
  test(){
    console.log("achievement unlocked");
    console.log(this.props);
    window.location = "lunchtables/" + this.props.id
  }

  render () {
    let weekdays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    return (
      <div>
        <div>{weekdays[this.props.creation.getDay()]} ({this.props.creation.toLocaleTimeString()})</div>
        <div>Price: {this.props.price}</div>
        <div>Total: {this.props.total}</div>
        <div>Users: {this.props.users}</div>
        <button onClick={this.test.bind(this)}>Check this Table!</button>
      </div>
    );
  }
}

Table.propTypes = {
  creation: React.PropTypes.object,
  price: React.PropTypes.number,
  total: React.PropTypes.number
};
