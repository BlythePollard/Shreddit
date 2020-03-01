class SessionsController < ApplicationController
    before_action :require_login, :except => [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            user = User.from_omniauth(auth_hash)
            #AUTH_HASH coming through, but email is nil....
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else 
            # how to check validations too???
            # @user = User.new(user_params)
            # if @user.save
            @user = User.find_by(name: params[:name])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user.id)
            else 
                flash[:notice] = "no luck"
                redirect_to '/sessions/new'
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
