class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.iod
            redirect_to user_path(user.id)
        else 
            user = User.find_by(name: params[:name])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user.id)
            else 
                render :new
                #flash message here
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
