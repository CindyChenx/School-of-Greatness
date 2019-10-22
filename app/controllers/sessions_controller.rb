class SessionsController < ApplicationController

    def new
       
    end

    def create
   
        if auth_hash = request.env['omniauth.auth']
            # log in via OAuth
            # raise Error.inspect
            oauth_nickname = auth_hash['info']['nickname']
            if @user = User.find_by(username: oauth_nickname)
                log_in(@user)
                flash[:success] = "Welcome to the Greatness Program!"
                redirect_to goals_path
            else
                @user = User.create(username: oauth_nickname, password: SecureRandom.hex)
            end
        else
            # normal login with username and password
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

    end

    def destroy
        session.clear
        redirect_to login_path
    end



    private
 
    def auth_hash
        request.env['omniauth.auth']
    end



end
