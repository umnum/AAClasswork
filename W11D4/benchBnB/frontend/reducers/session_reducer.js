import {RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER, RECEIVE_ERRORS} from '../actions/session_actions';
export const sessionReducer = (state = {}, action) => {
    Object.freeze(state);
    switch(action.type) {
        case RECEIVE_CURRENT_USER:
            return action.user;
        case LOGOUT_CURRENT_USER:
            return {};
        case RECEIVE_ERRORS:
            return action.errors;
        default:
            return state;
    }
}