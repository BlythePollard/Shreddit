class User < ApplicationRecord
    has_secure_password 

    has_many :user_activities
    has_many :activities, through: :user_activities

    validates :name, presence: true
    validates :password, presence:true
    validates :name, uniqueness: true
    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 6..20 }

    def self.find_or_create_by_omniauth(auth_hash)
        oauth_email = auth_hash["info"]["email"]
        if user = User.find_by(:email => oauth_email)
            #if find user, return user
        else 
            user = User.create(:email => oauth_email)
                session[:user_id] = user.id
                redirect_to user_path(user.id)
        end
    end
end
