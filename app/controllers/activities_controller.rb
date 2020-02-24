class ActivitiesController < ApplicationController
    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.create(activity_params)
        redirect_to activities_path
    end

    def edit
    end

    def update
    end

    def index
        @activities = Activity.all
    end

    def location
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :location)
    end
    
end
