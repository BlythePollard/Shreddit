class Session < ApplicationRecord
    has_secure_password 

    validates :name, presence: true
    validates :password, presence:true
    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 6..20 }
end
