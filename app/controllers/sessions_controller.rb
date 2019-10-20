class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            log_in(@user)
            flash[:success] = "Welcome, #{@user.username}!"
            redirect_to goals_path
        else
            flash[:danger] = "Improper credentials given"
            redirect_to login_path
        end
    end


    def destroy
        session.clear
        redirect_to login_path
    end

    



end
