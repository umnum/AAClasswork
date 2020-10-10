import {RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER, RECEIVE_SESSION_ERRORS} from '../actions/session_actions';
let _nullState = {id: null};
const sessionReducer = (state = _nullState, action) => {
    Object.freeze(state);
    switch(action.type) {
        case RECEIVE_CURRENT_USER:
            return action.user;
        case LOGOUT_CURRENT_USER:
            return {};
        case RECEIVE_SESSION_ERRORS:
            return action.errors;
        default:
            return state;
    }
}

export default sessionReducer;