class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show 
        @user = current_user
        @user_appointments = @user.appointments
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

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

end
