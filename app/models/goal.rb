class Goal < ApplicationRecord
    belongs_to :user 
    has_many :appointments
    has_many :coaches, through: :appointments
end
