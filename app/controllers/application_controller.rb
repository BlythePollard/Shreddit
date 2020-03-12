class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
    end

    def current_user
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]  
    end
    
      def logged_in?
        !!current_user
      end

    def current_activity
      @activity = Activity.find(params[:id])
    end

      private

      def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to root_path
        end
      end

end
