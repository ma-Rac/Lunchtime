
class Tablelist extends React.Component {
  componentDidMount(){
  }
  render () {
    return (<div>
              <ul>
                {this.props.tables.map(function(table) {
                  let date = new Date(table.created_at);
                  return <Table creation={date} price={table.price} total={table.total} key={table.id} id={table.id}/>
                })}
              </ul>
            </div>);
  }
}
