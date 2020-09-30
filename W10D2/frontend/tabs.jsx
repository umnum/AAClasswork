import React from 'react';
import Header from './header';

class Tabs extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            selectedTabs: 0
        }
    }


    render(){
        return (
            <ul>
                {this.props.banana.map( tabs => {
                    return (
                        <Header key={tabs.title} tab={tabs}/>
                           
                    )
                })}
            </ul>
        )
    }
}


export default Tabs;