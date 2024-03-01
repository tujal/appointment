class Doctor < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :patients, through: :appointments
    validates :name,:specialties, :phone, presence: true
    validates :phone,  numericality: true, length: {minimum: 10
    }
    paginates_per 2
end
