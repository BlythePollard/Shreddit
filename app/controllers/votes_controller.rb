class VotesController < ApplicationController
    before_action :find_post

    def create
        @activity.likes.create(user_id: current_user.id)
        redirect_to activity_path(@activity)
    end

    def find_activity
        @activity = Activity.find(params[:id])
    end 
end