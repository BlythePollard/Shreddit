class VotesController < ApplicationController
    before_action :find_activity

    def create
        #how to modify this so that it goes through user & view does accordingly?
        activity_vote = @activity.votes.new(user_id: current_user.id)
        activity_vote.likes = 1
        activity_vote.save
        redirect_to activity_path(@activity)
    end

    def find_activity
        @activity = Activity.find(params[:activity_id])
    end 
end