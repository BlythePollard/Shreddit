class User < ApplicationRecord
    has_secure_password 

    has_many :user_activities
    has_many :activities, through: :user_activities

    validates :name, presence: true
    validates :password, presence:true
    validates :name, uniqueness: true
    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 6..20 }
end
