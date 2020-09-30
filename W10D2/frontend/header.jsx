import React from 'react'; 
 
const Header = ({tab}) => {
    return (
        <div>
            <h1>{tab.title}</h1>
            <article>{tab.content}</article>
        </div>
        
        )
}

export default Header;