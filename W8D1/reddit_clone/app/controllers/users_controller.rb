class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        render :show
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        @user = User.find_by(id: params[:id])
        if logged_in?
            if @user.id == current_user.id
                if @user.update(user_params)
                    redirect_to user_url(@user)
                else
                    flash.now[:errors] = @user.errors.full_messages
                    render :edit
                end
            end
        else
            redirect_to new_session_url
        end
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user.id)
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end
end
