import * as APIUtils from '../util/session_api_util'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS'

export const login = user => {
    return dispatch => {
        return APIUtils.login(user).then(response => dispatch(receiveCurrentUser(response)),
                                         errors => dispatch(receiveErrors(errors.responseJSON)));
    }
}

export const logout = () => {
    return dispatch => {
        return APIUtils.logout().then(response => dispatch(logoutCurrentUser()));
    }
}

export const signup = user => {
    return dispatch => {
        return APIUtils.signup(user).then(response => dispatch(receiveCurrentUser(response)),
                    errors => dispatch(receiveErrors(errors.responseJSON))
        );
    }
}

export const receiveCurrentUser = user => {
    return ({
        type: RECEIVE_CURRENT_USER,
        user 
    })
}

export const logoutCurrentUser = () => {
    return ({
        type: LOGOUT_CURRENT_USER,
        user: {}
    })
}

export const receiveErrors = (errors) => {
    return ({
        type: RECEIVE_SESSION_ERRORS,
        errors
    })
}