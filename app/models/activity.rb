class Activity < ApplicationRecord
    has_many :user_activities
    has_many :users, through: :user_activities

    accepts_nested_attributes_for :user_activities, :users
end
