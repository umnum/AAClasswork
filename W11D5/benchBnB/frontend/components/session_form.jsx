import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        };
        this.handleInput = this.handleInput.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(type) {
        return (e) => {
            this.setState({[type]: e.target.value})
        }
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state)
        this.props.processForm(user)
            .then(success => this.props.history.push('/'))
    }

    render () {
        let isLogin = this.props.formType === 'login';
        return (
            <>
                <header>{isLogin? "Log In" : "Sign Up"}</header>
                {isLogin ? <Link to="/signup">Sign Up</Link> : <Link to="/login">Log In</Link> }
                <form>
                    <label>Username:
                        <input onChange={this.handleInput('username')} type="text" value={this.state.username}/>
                    </label>
                    <label>Password:
                        <input onChange={this.handleInput('password')} type="password" value={this.state.password}/>
                    </label>
                    <button onClick={this.handleSubmit}>{isLogin ? "Log In" : "Sign Up"}</button>
                </form>
                {this.props.errors.length > 0 ? <p>{this.props.errors[0]}</p> : <></>}
            </>
        )
    }
}

export default SessionForm;