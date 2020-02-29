class Vote < ApplicationRecord
    belongs_to :user
    belongs_to :activity

    
    #def like_count?
end