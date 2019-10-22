class SessionsController < ApplicationController

    def new
       
    end

    def create

        if auth_hash = request.env['omniauth.auth']
            # log in via OAuth
            oauth_email = request.env['omniauth.auth']['info']['email']
            if @user = User.find_by(username: oauth_email)
                log_in(@user)
                flash[:success] = "Welcome to the Greatness Program!"
                redirect_to goals_path
            else
                @user = User.new(username: oauth_email, password: SecureRandom.hex)
                if @user.save
                log_in(@user)
                redirect_to goals_path
                else
                    raise @user.errors.full_messages.inspect
                end
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
