import { connect } from 'react-redux';
import SessionForm from './session_form';
import {receiveErrors, signup} from '../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
    return ({
        errors: Object.values(state.errors.session),
        formType: 'signup'
    });
};

const mapDispatchToProps = dispatch => {
    return ({
        processForm: (user) => dispatch(signup(user)),
        receiveErrors: (errors) => dispatch(receiveErrors(errors))
    });
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm); 