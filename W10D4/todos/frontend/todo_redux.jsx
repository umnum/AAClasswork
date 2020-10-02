import React from 'react'
import ReactDOM from 'react-dom'
import receiveTodos from './actions/todo_actions'
import todosReducer from './reducers/todo_reducers'
import configureStore from './store/store'

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    window.store = store;
    const content = document.getElementById('content');
    ReactDOM.render(<h1>Todos App</h1>, content);
});