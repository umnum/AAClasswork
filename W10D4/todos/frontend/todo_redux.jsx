import React from 'react'
import ReactDOM from 'react-dom'
import receiveTodos from './actions/todo_actions' 
import todosReducer from './reducers/todo_reducers'
import configureStore from './store/store'
import Root from './components/root'
// FOR TESTING ONLY!!
import { allTodos } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    window.store = store;
    window.allTodos = allTodos;
    const content = document.getElementById('content');
    ReactDOM.render(<Root store={store} />, content);
});