class ActivitiesController < ApplicationController
    before_action :authenticate_user
    
    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.create(activity_params)
        @user = User.find(session[:user_id])
        @user.activities << @activity
        redirect_to activities_path
    end

    def edit
        #check user logged in
        @activity = Activity.find(params[:id])
    end

    def update
        @activity = Activity.find(params[:id])
        @activity.update(activity_params)
        @activity.save
        redirect_to activity_path(@activity)
    end

    def show
        #check user logged in
        @activity = Activity.find(params[:id])
    end

    def index
        #check user logged in
        @activities = Activity.all
        @user = User.find(session[:user_id])
        #binding.pry
    end

    def location
        
    end

    def destroy
        Activity.find(params[:id]).destroy
        redirect_to activities_url
    end

    def top_ten
        @activities = Activity.all
        render '/activities/top_ten'
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :location)
    end
    
end
