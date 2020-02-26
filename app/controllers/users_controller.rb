class UsersController < ApplicationController
    
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
        @user = User.find(session[:user_id])
    end


    def activities
        @user = User.find(session[:user_id])
        render '/users/activities'

        #issue: activities are not getting related to user- join table not working!
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end
