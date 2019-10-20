class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    has_many :goals
    has_many :appointments

    accepts_nested_attributes_for :goals

    # goals_attributes=


    def accomplished
        self.goals.where(accomplished: true)
    end

    def unaccomplished
        self.goals.where(accomplished: false)
    end


end
