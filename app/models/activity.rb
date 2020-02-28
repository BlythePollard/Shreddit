class Activity < ApplicationRecord
    has_many :user_activities
    has_many :users, through: :user_activities

    acts_as_votable

    #accepts_nested_attributes_for :user_activities, :users

    #valiations here!

    scope :top_ten, -> {order(:cached_weighted_average => :desc).limit(10)}

end
