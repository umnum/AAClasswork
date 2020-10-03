import React from 'react';

export default (props) => {
    return (
        <ul>
            {
            props.todos.map((todo, idx) => {
                return <li key={idx}>{todo.title}</li>;
                //return <TodoListContainer key={idx} title={todo.title}/>;
            })}
        </ul>
    )
}