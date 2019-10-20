class GoalsController < ApplicationController

    before_action :authenticate
    before_action :get_goal, only: [:edit, :update]
    

    def index 
        @goals = Goal.all
    end

    def edit
        authorize(@goal)
    end

    def new
        @goal = Goal.new
    end

    def create  
        goal = Goal.new(goal_params)
        goal.user = current_user
        if goal.save
            flash[:success] = "Your goal was successfully created!"
            redirect_to goals_path
        else
            flash[:danger] = "Something went wrong saving your goal!"
            redirect_to goals_path
        end
    end

    def update
        authorize(@goal)
        @goal.update(goal_params)
        flash[:success] = "Your goal was successfully updated!"
        redirect_to goals_path
    end



    private 

    def get_goal
        @goal = Goal.find(params[:id])
    end

    def goal_params
        params.require(:goal).permit(:title, :accomplished)
    end

end
