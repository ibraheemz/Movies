class UsersController < ApplicationController

    before_action :require_signin, except: [:new, :create]

    before_action :requier_correct_user, only: [:edit, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user, notice: "Signed Up Successfully!"
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @user = User.find(params[:id])
        @reviews = @user.reviews
    end

    def edit
        
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user, notice: "Account updated Successfully!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil
        redirect_to root_path, alert: "Account deleted successfully!"

    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

        def requier_correct_user
            @user = User.find(params[:id])
            redirect_to movies_path unless current_user?(@user)
        end

end
