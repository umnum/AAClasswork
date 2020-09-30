import React from 'react';
import { render } from 'react-dom';


class Clock extends React.Component{
    constructor(){
        let date = new Date();
        super();
        this.state = { 
            date: date,
            hours: date.getHours(),
            minutes: date.getMinutes(),
            seconds: date.getSeconds() 
        }
        this.tick = this.tick.bind(this);
    }

    tick(){
        let seconds = this.state.seconds + 1;
        let minutes = this.state.minutes + Math.floor(seconds/60);
        let hours = this.state.hours + Math.floor(minutes/60);
        seconds %= 60;
        minutes %= 60;
        hours %= 24;
        this.setState({hours, minutes, seconds});
    }
    componentDidMount(){
        this.intId = setInterval(this.tick,1000);
    }
    compenentWillUnmount(){
        clearInterval(this.intId)
    }

    render(){
        return (
            <div> 
                <h1> Clock </h1>
                <div className = 'date'>
                    <ul>
                        <li> Time:</li>
                        <li> {this.state.hours}:{this.state.minutes}:{this.state.seconds}</li>
                    </ul>
                    <br/>
                    <ul>
                        <li> Date:</li>
                        <li> {this.state.date.toDateString()}</li>
                    </ul>
                </div>

            </div> 
        )
    }
}
export default Clock;