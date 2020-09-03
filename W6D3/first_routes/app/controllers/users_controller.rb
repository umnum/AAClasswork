class UsersController < ApplicationController
    def index        
        users = User.all
        render json: users
    end

    def create 
        user = User.new(user_params)
        # creates user instance not in DB
        if user.save
            # render json: user
            # redirect_to "/users/#{user.id}" # redirects to show action
            redirect_to users_url(user)
        else
            render json: user.errors.full_messages, status: 422 # unprocesable entity
        end
    end

    def show
        render json: params
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :email)
    end
end
