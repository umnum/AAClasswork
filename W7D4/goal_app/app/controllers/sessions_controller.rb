class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        #params[:user][:username]
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        # debugger
        if user
            login!(user)
            redirect_to users_url
       else
            flash[:errors] = ['Invalid Credentials']
            # render :new
            redirect_to new_session_url
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

    private

    # def session_params
    #     params.require(:user).permit(:username, :password)
    # end
end
