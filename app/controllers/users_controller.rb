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


    def index
        #issue: activities index and this index are both going to '/activities/index'
        @user = User.find(session[:user_id])
        render '/users/activities'
        #custom route to /users/activities.hmtl.erb OR INDEX - see notes in g docs
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end
