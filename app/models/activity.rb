class Activity < ApplicationRecord
    has_many :user_activities
    has_many :users, through: :user_activities
    has_many :votes
    belongs_to :category
    accepts_nested_attributes_for :category

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence:true
    validates :location, presence: true

    scope :top_ten, -> {order(created_at: :desc).limit(10)} 

    def self.search_by_location(location) #what if location is nil? scope will always return AR object, class method can return nil
        Activity.where(location: location)
    end
end
