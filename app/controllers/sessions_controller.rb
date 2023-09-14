class SessionsController < ApplicationController

    def new
        
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to (session[:intended_url] || user) , notice: "Logged In Successfully!" 
            session[:intended_url] = nil
        else
            # flash.now[:alert] = "Invalid email/password combination!"
            # render :new
            redirect_to signin_path, alert: "Invalid email/password combination!"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to movies_path, notice: "logged Out Successfully!"
    end

end
