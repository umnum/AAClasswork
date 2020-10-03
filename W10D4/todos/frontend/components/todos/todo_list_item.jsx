import React from 'react';

class TodoListItem extends React.Component {
    constructor(props) {
        super(props)
        this.state = {done: false};
        this.deleteTodo = this.deleteTodo.bind(this);
        this.updateTodo = this.toggleDone.bind(this);
    }
    deleteTodo() {
        this.props.removeTodo(this.props.todo);
    }
    updateTodo() {
        this.setState({done: !this.state.done});
    }
    render () {
    return (
            <li>
                {this.props.todo.title}
                <button onClick={this.deleteTodo}>Delete</button>
                <button onClick={this.updateTodo}>{this.state.done ? "Undo" : "Done"}</button>
            </li>
            )
    }
};

export default TodoListItem;