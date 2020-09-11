class ApplicationController < ActionController::Base
    helper_method :current_user
    #CRLLL
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_log_in
        redirect_to new_user_url unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end
end 