class UsersController < ApplicationController
    before_action :require_log_in, only: [:show]
    def new
        render :new
    end

    def create
        @user = User.new(users_params)
        if @user.save
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            redirect_to new_user_url
        end
    end

    def show
        @user = User.find(params[:id])
        if @user
            render :show
        else
            redirect_to new_user_url
        end
    end

    private
        def users_params
            params.require(:user).permit(:email, :password)
        end
end
