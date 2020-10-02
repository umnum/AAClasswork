// This houses our action creators and action type constants

// action type constants...
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

// action creators...

const receiveTodos = (todos) => {
    return ({
        type: RECEIVE_TODOS,
        todos: todos
    })
};

const receiveTodo = (todo) => {
    return ({
        type: RECEIVE_TODO,
        todo: todo
    })
};

// FOR TESTING PURPOSES ONLY!!
window.receiveTodos = receiveTodos;
