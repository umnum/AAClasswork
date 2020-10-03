import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/todo_actions";

const initialState = {
    1: {
      id: 1,
      title: "wash car",
      body: "with soap",
      done: false
    },
    2: {
      id: 2,
      title: "wash dog",
      body: "with shampoo",
      done: true
    }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    // this reducer must convert our todos array into an object
    switch (action.type) {
        case RECEIVE_TODOS:
            return ({...action.todos});
        case RECEIVE_TODO:
            // Make a new object setting a single key value pair for action.todo
            nextState[action.todo.id] = action.todo 
            // Return a new state object by merging your previous state and your
            // new object
            return nextState;
        default:
            return state;
    }
};

// FOR TESTING PURPOSES ONLY!!
window.todosReducer = todosReducer;

export default todosReducer;