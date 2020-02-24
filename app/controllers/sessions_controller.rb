class SessionsController < ApplicationController
    def new
    end

    def create
        if params[:name].nil? || params[:name] == ""
            redirect_to '/sessions/new'
        elsif params[:password].nil? || params[:password] == ""
            redirect_to '/sessions/new'
        else 
            @user = User.find(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        end
    end

    def destroy
    end

    private

    def user_params
    end
end
