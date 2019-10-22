class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show 
        @user = User.find(params[:id])
        @user_appointments = @user.appointments
        @accomplished_tasks = accomplished(@user)
        @unaccomplished_tasks = unaccomplished(@user)
    end

    def new  
        @user = User.new
    end

    def create  
        @user = User.create(user_params)
        if @user.save
            log_in(@user)
            redirect_to goals_path
        else
            render :new
        end
    end


    private 

    def accomplished(user)
        user.goals.where(accomplished: true)
    end

    def unaccomplished(user)
        user.goals.where(accomplished: false)
    end

    def user_params
        params.require(:user).permit(:name, :username, :password, :uid, :image)
    end

end
