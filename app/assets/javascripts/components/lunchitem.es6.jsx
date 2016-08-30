class LunchItem extends React.Component {

  componentDidMount(){
    console.log(this.props)
  }

  findUser(){
    let component = this;
    return this.props.users.filter(function(user){
      return user.id == component.props.user
    })
  }

  routePay(){
    console.log("test")
  }
  render(){
    let username = this.findUser()[0]
    let component = this;
    return(
      <div>
        <div>{username.name} paid:{this.props.paid}</div>
          { component.props.current_user !== null && component.props.current_user == component.props.user && <button onClick={this.routePay}>Pay!</button> }
      </div>
    )
  }
}
