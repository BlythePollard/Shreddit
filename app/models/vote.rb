class Vote < ApplicationRecord
    belongs_to :user
    belongs_to :activity

    def upvote
        vote_count = self.likes + 1
        #method here adds +1 to likes
    end

    #def like_count?
end