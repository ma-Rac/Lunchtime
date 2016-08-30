class TableShow extends React.Component {

  render(){
    let weekdays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    let date = new Date(this.props.table.created_at)
    let component = this
    return (
      <div>
        <h1>{weekdays[date.getDay()]} ({date.toLocaleTimeString()})</h1>
        <h3>Price: {this.props.table.price}, TotalCost: {this.props.table.total}</h3>
        <h3>People at this table:</h3>
        <ul>
          {this.props.lunches.map(function(lunch){
            return <LunchItem key={lunch.id} user={lunch.user_id} paid={lunch.paid} users={component.props.users} current_user={component.props.current_user}/>
          })}
        </ul>
      </div>
    )
  }
}
