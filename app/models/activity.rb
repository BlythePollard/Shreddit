class Activity < ApplicationRecord
    has_many :user_activities
    has_many :users, through: :user_activities
    has_many :votes

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence:true
    validates :location, presence: true

    #accepts_nested_attributes_for :user_activities, :users

    scope :top_ten, -> {order(votes.pluck(:likes).count => :desc).limit(10)}
    #top ten will take vote counts of ALL activities, order them descending
    #need another method to iterate, get vote counts for each

end
