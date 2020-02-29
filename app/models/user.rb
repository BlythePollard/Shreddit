class User < ApplicationRecord
    has_secure_password 

    has_many :user_activities
    has_many :activities, through: :user_activities
    has_many :votes

    validates :name, presence: true
    validates :password, presence:true
    validates :name, uniqueness: true
    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 6..20 }

    def self.from_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
end



