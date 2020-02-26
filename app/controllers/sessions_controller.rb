class SessionsController < ApplicationController
    def new
    end

    def create
            @user = User.find_by(name: params[:name])
            if @user = @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user.id)
            else 
                redirect_to '/'
            end
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
