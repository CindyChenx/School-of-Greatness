class SessionsController < ApplicationController

    def new
       
    end

    def create

        # @user = User.find_or_create_by(uid: auth['uid']) do |u|
        #     u.name = auth['info']['name']
        #     u.email = auth['info']['email']
        #     u.image = auth['info']['image']
        #   end
       
        #   session[:user_id] = @user.id
       
        # redirect_to goals_path

        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            log_in(@user)
            flash[:success] = "Welcome to the Greatness Program!"
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



    # private
 
    # def auth
    #     request.env['omniauth.auth']
    # end



end
