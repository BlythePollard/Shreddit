class Activity < ApplicationRecord
    has_many :user_activities
    has_many :users, through: :user_activities
    has_many :votes

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence:true
    validates :location, presence: true

    #accepts_nested_attributes_for :user_activities, :users

    scope :top_ten, -> {order(:cached_weighted_average => :desc).limit(10)}
    #this scope order is not working properly!

end
