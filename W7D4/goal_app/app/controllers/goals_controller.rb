class GoalsController < ApplicationController
    def new

    end

    def create
        @goal = Goal.new(goal_params)
        if @goal.save
            @goal.user_id = current_user.id
            redirect_to user_url(current_user)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def goal_params
        params.require(:goal).permit(:title, :details,:visibility, :finished, :completed, :cheers)
    end
end
