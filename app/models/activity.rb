class Activity < ApplicationRecord
    has_many :user_activities
    has_many :users, through: :user_activities

    #accepts_nested_attributes_for :user_activities, :users

    #valiations here!

    scope :top_ten, -> {order(created_at: :desc).limit(10)}

end
