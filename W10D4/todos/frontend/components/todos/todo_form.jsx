import React from 'react'

class TodoForm extends React.Component {

    constructor (props) {
        super(props);
        this.id = this.props.id;
        this.state = {
            id: this.id,
            title: "",
            body: ""
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
    }

    handleSubmit (e) {
        e.preventDefault();
        this.props.receiveTodo(this.state)
        this.id++;
        this.setState({
            id: this.id,
            title: "",
            body: ""
        })
    }

    updateTitle (e) {
        this.setState({title: e.target.value});
    }

    updateBody (e) {
        this.setState({body: e.target.value});
    }

    render () {
        return (
            <form onSubmit={this.handleSubmit}>
                <h3>Create a new todo.</h3>
                <label>Title:
                    <input type="text" onChange={this.updateTitle} value={this.state.title}/>
                </label>
                <label>Body:
                    <input type="text" onChange={this.updateBody} value={this.state.body}/>
                </label>
                <input type="submit" value="Add Todo"/>
            </form>
        )
    }
}

export default TodoForm;