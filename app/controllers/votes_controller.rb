class VotesController < ApplicationController
    before_action :find_activity

    def create
        @a = @activity.votes.new(user_id: current_user.id)
        @a.likes = 1
        @a.save
        redirect_to activity_path(@activity)
    end

    def find_activity
        @activity = Activity.find(params[:activity_id])
    end 
end