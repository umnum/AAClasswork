import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = (props) => {
    function handleLogout() {
        props.logout();
    };
    let {currentUser, logout} = props;
    return (
        currentUser ? 
            <h1>Welcome, {currentUser.username} <button onClick={handleLogout}>Log Out</button></h1> :
            <h1><Link to="/signup">Sign Up</Link><Link to="/login">Log In</Link></h1>
    )
}

export default Greeting;