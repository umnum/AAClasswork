class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :require_log_in

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_log_in
        redirect_to new_session_url unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def log_in_user!(user)
        #User.find_by_credentials()
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end
end
