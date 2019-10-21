class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    has_many :goals
    has_many :appointments

    accepts_nested_attributes_for :goals



   


end
