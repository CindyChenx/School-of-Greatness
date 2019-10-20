class Appointment < ApplicationRecord
    belongs_to :goal 
    belongs_to :coach

    validates :date, presence: true
end
