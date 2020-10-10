class Api::SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login!(@user)
            render :show
        else
            #flash.now[:errors] = ["Invalid username or password"]
            render json: {errors: "Invalid username or password"}, status: 401
        end
    end

    def destroy
        if !logged_in?
            render json: { error: "No logged in user" }, status: 404
        else 
            logout!
            render json: {}
        end
    end

end

# The HyperText Transfer Protocol (HTTP) 422 Unprocessable Entity response status code indicates that the server understands the content type of the request entity, and the syntax of the request entity is correct, but it was unable to process the contained instructions.

# The 401 Unauthorized Error is an HTTP response status code indicating that the request sent by the client could not be authenticated. 
