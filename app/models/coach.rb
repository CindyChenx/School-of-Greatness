class Coach < ApplicationRecord
    has_many :appointments
    has_many :goals, through: :appointments
end
