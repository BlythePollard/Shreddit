class Vote < ApplicationRecord
    belongs_to :user
    belongs_to :activity, :counter_cache => true


    
    #def like_count?
end