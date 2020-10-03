import {combineReducers} from 'redux';
import todosReducer from './todo_reducers';

const rootReducer = combineReducers({
   todos: todosReducer 
});

export default rootReducer;