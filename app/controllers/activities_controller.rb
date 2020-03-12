class ActivitiesController < ApplicationController
    before_action :require_login
    
    def new
        @activity = Activity.new
    end

    def create
        @category = Category.find_by(name: category_params[:categories][:category])
        updated_params = activity_params.merge({category_id: @category.id})
        @activity = current_user.activities.build(updated_params)
        if @activity.save
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
        if @activity.update(activity_params) #this calls save
            redirect_to activity_path(@activity)
        else 
            render '/activities/edit'
        end    
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
        @activities = Activity.all.search_by_location(params[":location"]) 
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

    def category_params
        params.require(:activity).permit(categories: [:category])
    end

    #private method: current_activity
    
end
