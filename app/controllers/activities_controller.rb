class ActivitiesController < ApplicationController
    before_action :require_login
    
    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.create(activity_params)
        @user = current_user
        if @activity.valid?
            @user.activities << @activity
            redirect_to activities_path
        else 
           render '/activities/new'
        end
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
        @user = current_user
    end

    def location
        @user = current_user
        @activities = Activity.all.search_by_location(params[:":location"])   
        if !@activities.empty?
        else 
            flash[:notice] = "There are no activities in this location yet."
            redirect_to user_path(@user)
        end
    end

    def destroy
        Activity.find(params[:id]).destroy
        redirect_to activities_url
    end

    def top_ten
        @user = current_user
        @activities = Activity.all
        render '/activities/top_ten'
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :location)
    end
    
end