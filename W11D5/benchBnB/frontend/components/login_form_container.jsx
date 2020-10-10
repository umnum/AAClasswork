import { connect } from 'react-redux';
import SessionForm from './session_form';
import {login, receiveErrors} from '../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
    return ({
        errors: Object.values(state.errors.session),
        formType: 'login'
    });
};

const mapDispatchToProps = dispatch => {
    return ({
        processForm: (user) => dispatch(login(user)),
        receiveErrors: (errors) => dispatch(receiveErrors(errors))
    });
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm); 