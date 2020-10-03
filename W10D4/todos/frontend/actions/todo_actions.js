// This houses our action creators and action type constants

// action type constants...
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

// action creators...

export const receiveTodos = (todos) => {
    return ({
        type: RECEIVE_TODOS,
        todos: todos
    })
};

export const receiveTodo = (todo) => {
    return ({
        type: RECEIVE_TODO,
        todo: todo
    })
};

export const removeTodo = (todo) => {
    return ({
        type: REMOVE_TODO,
        todo: todo
    })
}

// FOR TESTING PURPOSES ONLY!!
//window.receiveTodos = receiveTodos;
//window.receiveTodo = receiveTodo;