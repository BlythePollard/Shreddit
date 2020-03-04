class UsersController < ApplicationController
    before_action :require_login, :except => [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else 
            render :new
        end
    end

    def show
        @user = current_user
    end


    def activities
        @user = User.find(session[:user_id])
        render '/users/activities'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end
