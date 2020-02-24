class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
    end

    def current_user
        session[:name]
      end
    
      private
    
      def require_logged_in
        redirect_to controller: 'sessions', action: 'new' unless current_user
      end
end
