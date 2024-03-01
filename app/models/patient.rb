class Patient < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :Doctors, through: :appointments
    accepts_nested_attributes_for :appointments
    paginates_per 3

    validates :name,:age,:gender, presence:  { message: "All the field are present"}
    # validates_associated :appointments
    validate :check_age

    private
    def check_age
        if age <18
        errors.add(:age , "must be greater then 20")
        end
    end

    
end
