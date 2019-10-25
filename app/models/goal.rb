class Goal < ApplicationRecord
    belongs_to :user 
    has_many :appointments
    has_many :coaches, through: :appointments

    accepts_nested_attributes_for :appointments


end
