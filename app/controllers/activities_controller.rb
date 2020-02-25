class ActivitiesController < ApplicationController
    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.create(activity_params)
        redirect_to activities_path
    end

    def edit
        @activity = Activity.find(params[:id])
    end

    def update
        @activity = Activity.find(params[:id])
        @activity.update(activity_params)
        @activity.save
        redirect_to activity_path(@activity)
    end

    def show
        @activity = Activity.find(params[:id])
    end

    def index
        @activities = Activity.all
        @user = User.find(session[:user_id])
    end

    def location
    end

    def destroy
        Activity.find(params[:id]).destroy
        redirect_to activities_url
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :location)
    end
    
end
