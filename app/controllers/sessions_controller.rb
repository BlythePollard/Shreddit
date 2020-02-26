class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #issues with showing errors in validation with login
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else 
            render :new
        end
    end

    def destroy
        reset_session     
        redirect_to '/' 
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end
