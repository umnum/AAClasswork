import { combineReducers } from 'redux';
import session from './session_reducer';
import tweets from './tweets_reducer';

const RootReducer = combineReducers({
    session,
    tweets
});

export default RootReducer;