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
            redirect_to root_path
        end
    end

    def show
        @user = User.find(session[:user_id])
    end


    def index
        #custom route to /users/activities.hmtl.erb
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end
