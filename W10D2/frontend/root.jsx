import React from 'react';
import Clock from './clock.jsx'
import Tabs from './tabs.jsx'

const Root = (props) => {
    return (
        <div>
            <div><Clock /></div>
             <div><Tabs banana={[{title: "1", content: "hi" },{title: "2", content: "2nd hi"},{title: "3", content: "3rd hi"}]}/></div>
        </div>
    )
}

export default Root;